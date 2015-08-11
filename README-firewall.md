# Firewall Workers -> DB Server

Al crear el linode (u otro tupo de node) incluir una ip privada para cada uno de los nodos que interactúan, incluyendo workers y DBs. Los nodos se comunicarán a través de una red privada protegiendo los puertos del servidor de DB dando acceso desde la red pública solo al servicio de SSH y los servidores worker, solo SSH, HTTP(s) y otros necesarios como acceso a servicios de Node que no sean ruteables.

Se recomienda mantener los servicios de sockets fuera de los puertos tradicionales de HTTP(s) para mantener la compatibilidad con el servicio de cloudflare que no soporta conexiones de sockets en sus servicios básicos o gratuitos.

En los ejemplos se utilizarán 2 IPs para simular las IPs del servidor de DB y Worker:

+ DB: 192.168.203.96/17 # seshat - priv.seshat.eg.wktapp.com 
+ Worker: 192.168.199.92/17 # geb - priv.geb.eg.wktapp.com

## DB Server - Firewall

```
$ firewall-cmd --permanent --new-zone=wktapp
$ firewall-cmd --permanent --zone=wktapp --add-service=mysql

# Crear una regla por cada nodo worker.

$ firewall-cmd --permanent --zone=wktapp --add-source=192.168.199.92/17

$ firewall-cmd --reload
```

## Worker Server - Firewall

```
$ firewall-cmd --zone=public --permanent --add-service=http
$ firewall-cmd --zone=public --permanent --add-service=https
$ firewall-cmd --zone=public --permanent --add-port=9001-9999/tcp # Servicios de node

$ firewall-cmd --reload
```

Actualmente, el firewall se configura automáticamente en la instalación para aceptar conexiones solo desde cloudflare a través de http(s) y recibir conexiones tcp desde la red pública completa desde los puertos 9001 al 9999 para elevar servicios varios.

Para eliminar las reglas que limitan el acceso solo a través de cloudflare, se deben listar las reglas ingresadas y eliminarlas una a una y luego permitir el acceso a los servicios http y https:

```
$ firewall-cmd --list-rich-rules | grep \"https\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done
$ firewall-cmd --list-rich-rules | grep \"http\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done
$ firewall-cmd --zone=public --permanent --add-service=http
$ firewall-cmd --zone=public --permanent --add-service=https
$ firewall-cmd --reload
```

## DB Server - MySQL

En la configuración de MySQL (/etc/my.cnf) se debe configurar el servicio para aceptar conexiones solo a través de la red privada:

```
[mysqld]

bind-address=192.168.203.96
```

## DB Server - MySQL - Permisos de Usuario

Se debe configurar un usuario de control con permisos limitados solo a la IP local. Este usuario se podrá acceder con MySQL Workbench u otra herramienta a través de tunel SSH dentro de la misma máquina.

```
> CREATE USER 'ops'@'192.168.203.96' IDENTIFIED BY 'some-password';
> GRANT ALL PRIVILEGES ON *.* TO 'ops'@'192.168.203.96' WITH GRANT OPTION;
> FLUSH PRIVILEGES;
````

Para los Usuarios de acceso que tendrán las aplicaciones, se deben configurar para poder acceder desde cualquier host. El firewall se encargará de permitir accesos solo desde la red privada. Esto permitirá escalar hacia otra máquina en la red privada sin necesidad de hacer más configuraciones en los servidores.

```
> CREATE USER 'proyecto'@'%' IDENTIFIED BY 'some-password';
> GRANT ALL PRIVILEGES ON *.* TO 'proyecto'@'%';
> FLUSH PRIVILEGES;
````

Las aplicaciones deberán conectarse directamente al servidor de base de datos. Podrán utilizar la IP o el hostname privado:

+ 192.168.203.96
+ priv.seshat.eg.wktapp.com

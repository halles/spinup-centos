# Centos7 Development Environment

Para re-crear el ambiente de desarrollo, se necesita primero crear una instalación base del SO elegido (en este caso CentOS 7) utilizando Virtualbox y luego utilizar los scripts de inicialización.

## Instalación del SO desde la distribución minimal.

* El password para root deberá ser vagrant.
* Se debe crear un usuario vagrant con password vagrant y con capacidades de administración.
* Se debe activar una interface de red por defecto.
* La configuración de las particiones de disco puede dejarse en automático.
* Idealmente el idioma del SO deberá ser inglés.
* Desde la configuración de la interface de red de la máquina virtual en Virtualbox, redireccionar el puerto 22 de la máquina guest hacia el 2222 de la máquina host. **Este puerto se utilizará para continuar con la instalalación más adelante**
* Instalar el sistema operativo normalmente y luego reiniciar la máquina.

## Scripts de Inicialización

Será necesario primero realizar una copia de estos archivos para poder ejecutarlos como root. Lo primero que tenemos que hacer es instalar rsync en la máquina, luego copiar los archivo y así poder ejecutar la instalación del software. Acá debemos reemplazar el puerto de conexión via ssh según cómo hayamos configurado la redirección de puertos de virtualbox. Las consolas estarán identificadas por ```host$``` y ```guest$``` respectivamente:

```
host$ ssh -p2222 root@localhost
guest$ sudo yum -y install rsync
guest$ exit
host$ rsync -avz -e "ssh -p2224" --exclude-from '.rsync-exclude' ./ root@localhost:~/spinup/
host$ ssh -p2222 root@localhost
guest$ cd ~/spinup/
guest$ ./spinup-wcde.sh
```

## Empaquetación y Pruebas

Para realizar las pruebas correspondientes es necesario empaquetar la máquina virtual, e instalarla como la máquina que utilizará el proyecto de WCDE (http://code.wktapp.com/devops/wikot-centos-development-environment). Debemos conocer cómo se llama la máquina virtual en virtualbox (en nuestro caso Centos7SpinupDev) y la versión para insertar en el nombre al exportarla (0.0.10)

$ ./spinup-wcde-build.sh Centos7SpinupDev 0.0.10

Esto exportará la máquina virtual, la guardará dentro del directorio ./build y la instalará en vagrant bajo el nombre wcde-dev. Con esto podemos modificar el Vagrantfile en nuestro ambiente de desarrollo para utilizar la máquina en cuestión.


# Publicación

Una vez publicada, podemos subir la máquina en el atlas de hashicorp y utilizarla normalmente.

# To Do

* Buscar la forma de mantener persistencia de los directorios de datos MySQL y MongoDB tras la publicación y actualización de las máquinas de desarrollo
* Realizar una suite de tests para ver que todo quedó instalado correctamente e informe al usuario de posibles errores.
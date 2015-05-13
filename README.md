# Spin Up - Centos 7 - Production Servers and Development Environment Box

## Para inicializar

* Servidor de producción, ejecutar ./spinup.sh
* Creación de Ambiente de Desarrollo, ejecutar: ./spinup-wcde.sh

## Scope

Este conjunto de scripts permiten la rápida inicialización de un servidor típico de los Clusters (Con Centos 7) que se utilizan en Wikot, además de herramientas de configuración para los servicios.

El stack comprende:

1. Utilización de Centos 7
2. Nginx 1.6.2
3. PHP 5.5 desde Webtatic corriendo a través de php-fpm
4. MySQL Server 5.6
5. phpMyAdmin
6. Usuario de control ops y root sin acceso por ssh
7. ImageMagick y módulo para php.
8. Composer
9. Ruby + Gems + Sass
10. Node + NPM + forever

## To Do

* Completar este Todo
* Sacar copias de php-fpm.d para hacer template
* Scripts para administración: creacion de usuarios, DBs y accesos para administración por proyecto (http://www.cyberciti.biz/faq/howto-linux-add-user-to-group/)
* Conversión de estructura a deployment con Docker en lugar de la estructura actual

## Scripts de Inicialización

* Ingresar con root al servidor recién creado
* Descargar los scripts de inicializacion en la máquina virtual y ejecutar, utilizando ```bash <(curl -s https://gist.githubusercontent.com/halles/0f0d6a67433025f4aad5/raw/29ccfbe3371ec6abee7fae7d321cfdd68a2c9fe3/start-spinup-production.sh)```

## Material de Apoyo

### Links

* http://www.gratisoft.us/sudo/sudoers.man.html
* http://serverfault.com/questions/149673/linux-how-to-prevent-a-user-from-login-in-but-allow-su-user
* 403 en directorio
  * http://nginxlibrary.com/403-forbidden-error/
  * http://www.yolinux.com/TUTORIALS/LinuxTutorialManagingGroups.html (Usar gpasswd -a nginx worker y 750)
* 405 en nginx con archivos estáticos
  * http://leandroardissone.com/post/19690882654/nginx-405-not-allowed
* http://blog.starcklin.com/2013/08/centos-linode-longview-synchronize-server/

### Snippets

* Para generar una llave con comentario, sin passphrase y archivo específico
```ssh-keygen -f cl.wktapp.com.deploykey -C "cluster@cl.wktapp.com" -N ""```


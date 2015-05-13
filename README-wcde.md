# Centos7 Development Environment

Para re-crear el ambiente de desarrollo, se necesita primero crear una instalación base del SO elegido (en este caso CentOS 7) utilizando Virtualbox y luego utilizar los scripts de inicialización.

## Instalación del SO desde la distribución minimal.

* El password para root deberá ser vagrant.
* Se debe crear un usuario vagrant con password vagrant y con capacidades de administración.
* Se debe activar una interface de red por defecto.
* La configuración de las particiones de disco puede dejarse en automático.
* Idealmente el idioma del SO deberá ser inglés.
* Desde la configuración de la interface de red de la máquina virtual en Virtualbox, redireccionar el puerto 22 de la máquina guest hacia el 2222 de la máquina host.
* Instalar el sistema operativo normalmente y luego reiniciar la máquina.

## Scripts de Inicialización

* Desde la interface de la máquina virtual, insertar el CD de Guest Additions: Menú Devices » Insert Guest Additions CD Image
* Ingresar a la máquina virtual ejecutando ```ssh -p2222 vagrant@localhost```
* Utilizar ```sudo su -``` para ingresar como root al sistema
* Descargar los scripts de inicializacion en la máquina virtual y ejecutar, utilizando ```bash <(curl -s https://gist.githubusercontent.com/halles/b013419b96be7ed5ff52/raw/07e2dd7c833ee3d2907636f3258863408620efc3/start-spinup-wcde.sh)```
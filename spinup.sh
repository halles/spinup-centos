#!/bin/bash

printf "\n"
printf "************************************************\n"
printf "**         Inicialización de Servidor         **\n"
printf "************************************************\n"
printf "\n"

printf "== Parametros de Servidor\n\n"

read -p "Hostname: " server_hostname
read -p "Cluster: " cluster_hostname

printf "\n"

printf "== Parametros de Configuracion para MySQL\n\n"

read -p "Password de root: " mysql_root_password

printf "\n"

printf "== Parámetros de Usuario de Control\n\n"
read -p "username:   " ssh_username
read -p "password:   " ssh_password
printf "* Si no se especifica una Ssh Key de acceso no se ingresará ninguna al momento de crear el usuario\n"
read -p "ssh-key:    " ssh_userkey

printf "\n"

printf "== Parámetros de Usuario Worker\n\n"
read -p "username:   " worker_user
read -p "password:   " worker_user
printf "* El Deploy token es una clave temporal para descargar las Deploy Keys con que funcionará el servidor\n"
printf "* Si no se especifica este token, tendrá que instalar el deploy key manualmente en el usuario correpsondiente\n"
printf "* El Token debe crearlo en http://keys.wktapp.com/\n"
read -p "deploy-token: " worker_deploytoken

printf "************************************************\n"
printf "**         Confirmar la configuración         **\n"
printf "\n"
printf "Hostname: $server_hostname\n"
printf "\n"
printf "MySQL Root Password: $mysql_root_password\n"
printf "\n"
printf "SSH Username: $ssh_username\n"
printf "SSH Password: $ssh_password\n"
printf "SSH User Key: $ssh_userkey\n"
printf "\n"
printf "Worker Username:   $worker_username\n"
printf "Worker Password:   $worker_password\n"
printf "Worker Deploy Token: $worker_deploytoken\n"
printf "\n"

while true; do
    read -p "¿Es correcta esta configuración? [S o N] " yn
    case $yn in
        [Ss]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

printf "\n"
printf "** Comienza la Configuracion... Tomará un tiempo \n\n"

yum -y upgrade
yum update

# Configuracion de Usuarios

./scripts/user.sh
./scripts/worker.sh

# Instalacion de nginx

#./scripts/nginx.sh

# Instalacion de PHP con PHP-FPM

#./scripts/php-fpm.sh

# Instalacion de MySQL y phpMyAdmin

#./scripts/mysql.sh $mysql_root_password

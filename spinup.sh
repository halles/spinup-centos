#!/bin/bash

printf "\n"
printf "************************************************\n"
printf "**         Inicialización de Servidor         **\n"
printf "************************************************\n"
printf "\n"

printf "== Parametros de Servidor\n\n"

read -p "Hostname (miryam): " server_hostname
read -p "Cluster (cl.wktapp.com): " cluster_hostname

printf "\n"

printf "== Parametros de Configuracion para MySQL\n\n"

read -p "Password de root: " mysql_root_password

printf "\n"

printf "== Parámetros de Usuario de Control\n\n"
read -p "username:   " ssh_username
read -p "password:   " ssh_password

printf "\n"

printf "************************************************\n"
printf "**         Confirmar la configuración         **\n"
printf "\n"
printf "Hostname: $server_hostname\n"
printf "\n"
printf "MySQL Root Password: $mysql_root_password\n"
printf "\n"
printf "SSH Username: $ssh_username\n"
printf "SSH Password: $ssh_password\n"
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

# Configuraciones Varias

./scripts/locale-fix.sh
./scripts/hostname.sh $server_hostname $cluster_hostname

# Repositorios externos

./scripts/epel.sh
./scripts/webtatic.sh

# Instalacion de Utils

./scripts/git.sh
./scripts/htop.sh

# Configuracion de Usuarios

./scripts/user.sh $ssh_username $ssh_password
./scripts/deny-root-ssh.sh

#./scripts/worker.sh

# Setup del Firewall

./scripts/firewall.sh

# Instalacion de nginx

./scripts/nginx.sh

# Instalacion de PHP con PHP-FPM

./scripts/php-fpm.sh

# Instalacion de MySQL

./scripts/mysql.sh $mysql_root_password

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

printf "== Parámetros de Usuario de Control\n\n"
read -p "username:   " ssh_username
read -p "password:   " ssh_password

printf "\n"

printf "************************************************\n"
printf "**         Confirmar la configuración         **\n"
printf "\n"
printf "Hostname: $server_hostname\n"
printf "Cluster:  $cluster_hostname\n"
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
yum -y update

# Base Utils

./scripts/deltarpm.sh
./scripts/network-tools.sh
./scripts/wget.sh
./scripts/nano.sh
./scripts/bzip2.sh
./scripts/tree.sh
./scripts/ntp.sh

# Configuraciones Varias

./scripts/locale-fix.sh
./scripts-production/hostname.sh $server_hostname $cluster_hostname
./scripts/timezone-fix.sh

# Repositorios externos

./scripts/epel.sh
./scripts/webtatic.sh

# Instalacion de Utils

./scripts/git.sh
./scripts/htop.sh

# Configuracion de Usuarios

./scripts-production/user.sh $ssh_username $ssh_password
./scripts-production/deny-root-ssh.sh

# Setup del Firewall

./scripts-production/firewall-workers.sh

# Instalacion de nginx

./scripts-production/nginx.sh

# PHP con PHP-FPM y Módulos

./scripts/php-fpm.sh
./scripts-production/php-fpm.sh
./scripts/ImageMagick.sh

# Node y Módulos

./scripts/node.sh

# Ruby y Módulos

./scripts/ruby.sh

# Composer

./scripts/composer.sh

# Otras configuraciones

./scripts-production/SElinux.sh

# Clean Up

./scripts-production/cleanup.sh

# Shutdown

shutdown -h now

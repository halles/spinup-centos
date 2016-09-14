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

while true; do
    read -p "¿Usarás Nginx? [S o N] " yn
    case $yn in
        [Ss]* )
          with_nginx=1
          break
          ;;
        [Nn]* )
          with_nginx=0
          break
          ;;
    esac
done

if [ "$with_nginx" = 1 ]; then

  while true; do
      read -p "¿El servidor http(s) está protegido por cloudflare? [S o N] " yn
      case $yn in
          [Ss]* )
            with_cloudflare=1
            break
            ;;
          [Nn]* )
            with_cloudflare=0
            break
            ;;
      esac
  done

else

  with_cloudflare=0

fi

while true; do
    read -p "¿Usarás NodeJS (sockets) en los puertos 9000+? [S o N] " yn
    case $yn in
        [Ss]* )
          with_sockets=1
          break
          ;;
        [Nn]* )
          with_sockets=0
          break
          ;;
    esac
done

while true; do
    read -p "¿Usarás MySQL? [S o N] " yn
    case $yn in
        [Ss]* )
          with_mysql=1
          break
          ;;
        [Nn]* )
          with_mysql=0
          break
          ;;
    esac
done

if [ "$with_mysql" = 1 ]; then

  read -p "Password usuario root mysql:   " mysql_root_password

fi

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
printf "Nginx:      $with_nginx\n"
printf "Cloudflare: $with_cloudflare\n"
printf "Node:       $with_node\n"
printf "MySQL:      $with_mysql\n"
printf "MySQL pass: $mysql_password\n"


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

./scripts-production/firewall.ssh $with_mysql $with_nginx $with_cloudflare $with_sockets

# Instalacion de MySQL

if [ "$with_mysql" = 1 ]; then
  ./scripts-production/mysql.sh $mysql_root_password
fi

if [ "$with_nginx" = 1 ]; then

  # Instalacion de nginx

  ./scripts-production/nginx.sh $with_cloudflare

  # PHP con PHP-FPM y Módulos

  ./scripts/php-fpm.sh
  ./scripts-production/php-fpm.sh
  ./scripts/ImageMagick.sh

fi

if [ "$with_node" = 1 ]; then

  # Node y Módulos

  ./scripts/node.sh

fi

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

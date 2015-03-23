#!/bin/bash

yum -y upgrade
yum update

# Base Utils

./scripts/network-tools.sh
./scripts/wget.sh
./scripts/nano.sh
./scripts/bzip2.sh
./scripts/tree.sh

# Configuraciones Varias

./scripts-dev/vagrant-sshd.sh
./scripts/locale-fix.sh
./scripts-dev/hostname.sh wcde wktapp.com
./scripts/timezone-fix.sh

# Repositorios externos

./scripts/epel.sh
./scripts/webtatic.sh

# Instalacion de Utils

./scripts/git.sh
./scripts/htop.sh

# Setup del Firewall

./scripts-dev/firewall.sh

# Instalacion de nginx

./scripts-dev/nginx.sh

# Instalacion de MySQL

./scripts-dev/mysql.sh

# PHP con PHP-FPM y Módulos

./scripts/php-fpm.sh
./scripts/ImageMagick.sh

# Node y Módulos

./scripts/node.sh

# Ruby y Módulos

./scripts/ruby.sh

# Composer

./scripts/composer.sh

# Otras configuraciones

./scripts-dev/SElinux.sh 
./scripts-dev/vbox-insecure-keys.sh

# Clean Up

./scripts-dev/cleanup.sh

# Shutdown

shutdown -h now

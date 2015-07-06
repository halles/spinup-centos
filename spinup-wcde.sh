#!/bin/bash

yum -y upgrade
yum -y update

# Base Utils

./scripts/deltarpm.sh
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

# Node y Módulos

./scripts/node.sh

# Ruby y Módulos

./scripts/ruby.sh

# Setup del Firewall

./scripts-dev/firewall.sh

# Instalacion de nginx

./scripts-dev/nginx.sh

# Instalacion de MySQL

./scripts-dev/mysql.sh

# Instalacion de MongoDB

./scripts-dev/mongodb.sh

# PHP con PHP-FPM y Módulos

./scripts/php-fpm.sh
./scripts/phpmyadmin.sh
./scripts-dev/phpmyadmin.sh
./scripts-dev/php-fpm.sh
./scripts/ImageMagick.sh
./scripts/composer.sh

# Mongo Express

./scripts-dev/mongoexpress.sh

# Otras configuraciones

./scripts-dev/SElinux.sh 
./scripts-dev/vbox-insecure-keys.sh
./scripts-dev/vbox-additions.sh

# Clean Up

./scripts-dev/cleanup.sh

# Shutdown

shutdown -h now

#!/bin/bash

# Instalacion de PHP 5.5 desde Webtatic

rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum -y install php55w php55w-opcache php55w-bcmath php55w-mbstring php55w-cli php55w-common php55w-fpm php55w-gd php55w-mcrypt php55w-mysqlnd php55w-xml

# Registro de PHP-FPM como servicio

chkconfig --level 2345 php-fpm on
service php-fpm start
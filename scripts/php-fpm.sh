#!/bin/bash

# Instalacion de PHP 5.5 desde Webtatic

yum -y install \
	php55w \
	php55w-opcache \
	php55w-bcmath \
	php55w-mbstring \
	php55w-cli \
	php55w-common \
	php55w-fpm \
	php55w-gd \
	php55w-mcrypt \
	php55w-mysqlnd \
	php55w-xml \
	php55w-devel \
	php55w-pear \
	php55w-intl \
	php55w-mcrypt \
	php55w-pdo

# Registro de PHP-FPM como servicio

systemctl enable php-fpm.service
systemctl start php-fpm.service
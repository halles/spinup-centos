#!/bin/bash

# Instalacion de nginx

wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
rpm -i nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
systemctl enable nginx.service
systemctl stop nginx.service

# Añadimos nginx al grupo apache para mantener compatibilidades con configuraciones por defecto del SO

gpasswd -a nginx apache

# Configuración por defecto para nginx

cp config-dev/nginx/nginx.conf /etc/nginx/nginx.conf

# No Reiniciamos el Servicio nginx ya que debe cargar las configuraciones después de montar los directorios compartidos
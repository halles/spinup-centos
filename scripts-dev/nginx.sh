#!/bin/bash

# Instalacion de nginx

wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
rpm -i nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
systemctl enable nginx.service
systemctl stop nginx.service

# Configuración por defecto para nginx

cp config-dev/nginx/nginx.conf /etc/nginx/nginx.conf
sudo rm /etc/nginx/conf.d/default.conf

# Creación de Certificados Self signed para nginx

mkdir /etc/nginx/ssl
openssl genrsa -out /etc/nginx/ssl/server.key 1024
openssl req -new -key /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.csr -subj "/C=CL/ST=LaTam/L=Santiago/O=Wikot/OU=IT Department/CN=devops.wktapp.com"
openssl x509 -req -days 365 -in /etc/nginx/ssl/server.csr -signkey /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt

# No Reiniciamos el Servicio nginx ya que debe cargar las configuraciones después de montar los directorios compartidos
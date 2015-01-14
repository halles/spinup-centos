#!/bin/bash

# Instalacion de repositorio epel

wget http://download.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh epel-release-7-5.noarch.rpm

# Instalacion de nginx

wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
rpm -i nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
chkconfig --level 2345 nginx on
service nginx start

# Configuracion Base de Nginx


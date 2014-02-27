#!/bin/bash

# Instalacion de repositorio epel

wget http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh epel-release-6-8.noarch.rpm

# Instalacion de nginx

wget http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
rpm -i nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum -y install nginx
chkconfig --level 2345 nginx on
service nginx start

# Configuracion Base de Nginx


#!/bin/bash

# Instalacion de nginx

wget http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
rpm -i nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum -y install nginx
systemctl enable nginx.service
systemctl start nginx.service

# Configuración por defecto para nginx

cp config-production/nginx/nginx.conf /etc/nginx/nginx.conf

# Cloudflare para entregar IP real al servicio

CF_IPS_FILE='/etc/nginx/cloudflare_real_ip.conf'
CF_IPS=`curl https://www.cloudflare.com/ips-v4`

echo '' > $CF_IPS_FILE

for ip in $CF_IPS
do
	echo "set_real_ip_from   $ip;" >> $CF_IPS_FILE
done

echo '' >> $CF_IPS_FILE
echo 'real_ip_header     CF-Connecting-IP;' >> $CF_IPS_FILE

# Reiniciar Servicio nginx

systemctl restart nginx.service

# Configuracion Base de Nginx


# Instalacion de phpMyAdmin

yum -y install phpmyadmin

##
# Configuración por defecto para phpMyAdmin Post Instalación
# phpMyAdmin es accesible en el puerto 8980

cp config-dev/nginx/phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf
cp config-dev/php-fpm.d/phpmyadmin.conf /etc/php-fpm.d/phpmyadmin.conf
cp config-dev/phpMyAdmin/config.inc.php /etc/phpMyAdmin/config.inc.php
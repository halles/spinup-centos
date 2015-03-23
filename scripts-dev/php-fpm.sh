cp config-dev/php-fpm/phpmyadmin.conf /etc/php-fpm.d/
cp config-dev/nginx/phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf

systemctl start php-fpm.service
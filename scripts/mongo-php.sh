printf "\n" | pecl install mongo

cp config/php.d/mongo.ini /etc/php.d/mongo.ini

systemctl restart php-fpm

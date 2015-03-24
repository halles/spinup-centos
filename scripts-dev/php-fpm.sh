cp config-dev/php-fpm/phpmyadmin.conf /etc/php-fpm.d/phpmyadmin.conf
cp config-dev/nginx/phpmyadmin.conf /etc/nginx/conf.d/phpmyadmin.conf
cp config-dev/phpmyadmin.config.inc.php /etc/phpMyAdmin/config.inc.php

systemctl start php-fpm.service
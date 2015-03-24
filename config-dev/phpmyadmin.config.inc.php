<?php

/* Servers configuration */
$i = 0;

/* Server: WCDE [1] */
$i++;
$cfg['Servers'][$i]['verbose'] = 'WCDE';
$cfg['Servers'][$i]['host'] = 'localhost';
$cfg['Servers'][$i]['port'] = '';
$cfg['Servers'][$i]['socket'] = '';
$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['nopassword'] = true;
$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['user'] = '';
$cfg['Servers'][$i]['password'] = '';
$cfg['Servers'][$i]['AllowNoPassword'] = true;

/* End of servers configuration */

$cfg['blowfish_secret'] = '5510a04f6ab993.02352584';
$cfg['DefaultLang'] = 'en';
$cfg['ServerDefault'] = 1;
$cfg['UploadDir'] = '/vagrant/var/phpMyAdmin/upload';
$cfg['SaveDir'] = '/vagrant/var/phpMyAdmin/save';

?>

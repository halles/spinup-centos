# Instalar NTP

yum install -y ntp ntpdate
systemctl enable ntpd
systemctl start ntpd
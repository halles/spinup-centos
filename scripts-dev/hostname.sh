args=("$@")
server_hostname=${args[0]}
cluster_hostname=${args[1]}

echo 'HOSTNAME="$server_hostname.$cluster_hostname"' >> /etc/sysconfig/network
echo -e "127.0.0.1 \t $server_hostname.$cluster_hostname $server_hostname" >> /etc/hosts
hostname $server_hostname.$cluster_hostname
systemctl restart network.service

## Refs
# http://www.cyberciti.biz/faq/centos-hostname-change-command-line/
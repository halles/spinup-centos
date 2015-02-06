server_hostname=${args[0]}
cluster_hostname=${args[1]}

echo 'HOSTNAME="$server_hostname.$cluster_hostname"' >> /etc/sysconfig/network
server_ip=`ifconfig eth0 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'`
echo -e "$server_ip \t $server_hostname.$cluster_hostname $server_hostname" >> /etc/hosts
hostname $server_hostname.$cluster_hostname
systemctl restart network.service
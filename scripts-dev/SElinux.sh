# Enable permissive behaviour on SELinux

setenforce Permissive
sed 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config > /etc/selinux/config
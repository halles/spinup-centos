# Enable permissive behaviour on SELinux

setenforce Permissive
sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
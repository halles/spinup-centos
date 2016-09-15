printf '\n#Added by SpinUp Script\n'  >> /etc/ssh/sshd_config
printf 'PermitRootLogin no\n' >> /etc/ssh/sshd_config
systemctl restart sshd.service

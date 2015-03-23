echo 'Defaults:vagrant !requiretty' >> /etc/sudoers.d/vagrant
echo 'Defaults env_keep = "SSH_AUTH_SOCK"' >> /etc/sudoers.d/vagrant
echo 'vagrant ALL=NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
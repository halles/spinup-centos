# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "halles/wikot-centos7-dev-box"

  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "forwarded_port", guest: 443, host: 8443

  config.vm.synced_folder "../", "/sites"

  config.vm.provision "shell", inline: <<-SHELL
     sudo su -
     cd /vagrant
     ./spinup-wcde.sh
  SHELL

end

cd ~
curl -o spinup.tar.gz https://github.com/halles/wikot-centos-development-environment/archive/master.tar.gz
tar xfz spinup.tar.gz
rm spinup.tar.gz
cd spinup-centos.git
./spinup-workers.sh
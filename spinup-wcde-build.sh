args=("$@")
box_base_name=${args[0]}
box_version=${args[1]}
vb_version=${args[2]}

output_file="build/wcde-centos7-vb$vb_version-$box_version.box"

vagrant package --base "'$box_base_name'" --output output_file
vagrant box add halles/wcde output_file

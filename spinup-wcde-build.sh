args=("$@")
box_base_name=${args[0]}
box_version=${args[1]}

output_file="build/wcde-centos7-$box_version.box"

vagrant package --base "'$box_base_name'" --output $output_file
vagrant box add wcde-dev $output_file

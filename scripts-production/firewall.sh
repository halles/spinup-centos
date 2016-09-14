args=("$@")
with_db=${args[0]}
with_http=${args[1]}
with_cloudflare=${args[2]}
with_node=${args[3]}

# Ensure SSH is open to go through firewall

firewall-cmd --zone=public --add-service=ssh

# Firewall Rules for Accepting Cloudflare IPs only on http and https

if [ "$with_http" = 1 ] ; then

  if [ "$with_cloudflare" = 1 ] ; then

    CF_IPS=`curl https://www.cloudflare.com/ips-v4`

    firewall-cmd --list-rich-rules | grep \"https\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done
    firewall-cmd --list-rich-rules | grep \"http\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done

    firewall-cmd --reload

    for ip in $CF_IPS; do firewall-cmd --permanent --zone=public --add-rich-rule="rule family='ipv4' source address='$ip' service name='http' accept"; done
    for ip in $CF_IPS; do firewall-cmd --permanent --zone=public --add-rich-rule="rule family='ipv4' source address='$ip' service name='https' accept"; done

  else

    firewall-cmd --zone=public --add-service=https
    firewall-cmd --zone=public --add-service=http

  fi

fi

if [ "$with_node" = 1 ] ; then
  firewall-cmd --zone=public --permanent --add-port=9001-9999/tcp
fi

firewall-cmd --reload

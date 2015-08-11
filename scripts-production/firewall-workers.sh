systemctl start firewalld.service
systemctl enable firewalld.service

# Firewall Rules for Accepting Cloudflare IPs only on http and https

CF_IPS=`curl https://www.cloudflare.com/ips-v4`

firewall-cmd --list-rich-rules | grep \"https\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done
firewall-cmd --list-rich-rules | grep \"http\" | while IFS= read -r rule; do firewall-cmd --permanent --zone=public --remove-rich-rule="$rule"; done

firewall-cmd --reload

for ip in $CF_IPS; do firewall-cmd --permanent --zone=public --add-rich-rule="rule family='ipv4' source address='$ip' service name='http' accept"; done
for ip in $CF_IPS; do firewall-cmd --permanent --zone=public --add-rich-rule="rule family='ipv4' source address='$ip' service name='https' accept"; done

firewall-cmd --zone=public --permanent --add-port=9001-9999/tcp

firewall-cmd --reload
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

rm -f /var/run/starter.charon.pid

echo ": PSK \"$VPN_PSK\"" >/etc/ipsec.secrets
echo "$VPN_USER : XAUTH \"$VPN_PASS\"" >>/etc/ipsec.secrets

ipsec start --nofork --debug

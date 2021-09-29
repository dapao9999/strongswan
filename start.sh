sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -j MASQUERADE

rm -f /var/run/starter.charon.pid

echo ": PSK ${PSK:-vpn}" >/etc/ipsec.secrets

ipsec start --nofork 

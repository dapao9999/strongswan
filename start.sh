sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o eth0 -m policy --dir out --pol ipsec -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
rm -f /var/run/starter.charon.pid
echo ": PSK ${PSK:-vpn}" >/etc/ipsec.secrets
ipsec start --nofork 

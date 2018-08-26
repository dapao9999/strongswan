FROM ubuntu

RUN apt update && apt -y install strongswan iptables


COPY ipsec.conf ipsec.secrets /etc/
COPY start.sh /

ENV VPN_USER vpn
ENV VPN_PASS vpn
ENV VPN_PSK vpn

EXPOSE 500/udp 4500/udp

CMD /start.sh

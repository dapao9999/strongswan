FROM ubuntu

RUN apt update && apt -y install strongswan iptables

RUN mkdir /config

COPY ./etc/* /etc/
COPY ./bin/* /usr/bin/

VOLUME /etc
VOLUME /config

ENV VPN_USER vpn
ENV VPN_PASS vpn
ENV VPN_PSK vpn

# http://blogs.technet.com/b/rrasblog/archive/2006/06/14/which-ports-to-unblock-for-vpn-traffic-to-pass-through.aspx
EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn

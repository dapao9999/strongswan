FROM alpine

RUN apk add --no-cache curl strongswan

COPY ipsec.conf strongswan.conf /etc/
COPY start.sh /

EXPOSE 500/udp 4500/udp

CMD /start.sh

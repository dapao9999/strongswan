FROM alpine:edge

RUN apk add --no-cache curl strongswan

COPY ipsec.conf ipsec.secrets strongswan.conf /etc/
COPY start.sh /

EXPOSE 500/udp 4500/udp

CMD /start.sh

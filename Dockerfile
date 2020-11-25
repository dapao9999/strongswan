FROM alpine:edge

RUN apk add -u --no-cache curl strongswan musl

COPY ipsec.conf ipsec.secrets /etc/
COPY start.sh /

EXPOSE 500/udp 4500/udp

CMD /start.sh

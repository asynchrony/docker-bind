FROM alpine

ADD named.conf /etc/bind/named.conf

RUN apk add --update bind \
 && rm -rf /var/cache/apk/* \
 && /usr/sbin/named-checkconf /etc/bind/named.conf

EXPOSE 53/udp 53/tcp

CMD ["/usr/sbin/named", "-g", "-u", "named"]

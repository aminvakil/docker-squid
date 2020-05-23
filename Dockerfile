FROM alpine:3.11

LABEL maintainer="Amin Vakil <info@aminvakil.com>"

ENV SQUID_VERSION=4.10-r0

RUN apk add --no-cache squid="$SQUID_VERSION"

RUN set -x \
	&& sed -i '/http_access deny !Safe_ports/ s/^#*/#/' /etc/squid/squid.conf \
	&& sed -i '/http_access deny CONNECT !SSL_ports/ s/^#*/#/' /etc/squid/squid.conf

WORKDIR /etc/squid

EXPOSE 3128

COPY start_squid.sh /usr/local/bin/start_squid.sh
COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

ENTRYPOINT ["/usr/local/bin/start_squid.sh"]

CMD ["squid", "-N"]

FROM alpine:3.13.1

LABEL maintainer="Amin Vakil <info@aminvakil.com>"

ENV SQUID_VERSION=5.0.4-r0

RUN apk add --no-cache squid="$SQUID_VERSION"

RUN set -x \
	&& sed -i '/http_access deny !Safe_ports/ s/^#*/#/' /etc/squid/squid.conf \
	&& sed -i '/http_access deny CONNECT !SSL_ports/ s/^#*/#/' /etc/squid/squid.conf \
	&& sed -i '/http_access deny all/ s/^#*/#/' /etc/squid/squid.conf

EXPOSE 3128

CMD ["squid", "-N"]

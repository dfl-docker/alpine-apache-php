FROM alpine:3.5

MAINTAINER Daniel Fernando Lourusso <daniel@dflourusso.com.br>

LABEL Description="A Simple apache/php image using alpine Linux for Web Apps"

RUN apk update \
    && apk add apache2 php5-apache2 php5-json php5-phar php5-openssl php5-mysql php5-curl php5-mcrypt php5-pdo_mysql php5-ctype php5-gd php5-xml php5-dom php5-iconv \
    && rm -f /var/cache/apk/* \
    && mkdir /run/apache2 \
    && sed -i 's/#LoadModule\ rewrite_module/LoadModule\ rewrite_module/' /etc/apache2/httpd.conf \
    && sed -i 's/#ServerName\ www.example.com/ServerName\ localhost/' /etc/apache2/httpd.conf \
    && sed -i 's/short_open_tag\ =\ Off/short_open_tag\ =\ On/' /etc/php5/php.ini \
    && mkdir -p /opt/utils

EXPOSE 80

ADD start.sh /opt/utils/

RUN chmod +x /opt/utils/start.sh

ENTRYPOINT ["/opt/utils/start.sh"]

# CMD ["/bin/sh"]

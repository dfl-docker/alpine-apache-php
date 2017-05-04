#!/bin/sh

sed -i "s#^DocumentRoot \".*#DocumentRoot \"/app/public\"#g" /etc/apache2/httpd.conf
sed -i "s#/var/www/localhost/htdocs#/app/public#" /etc/apache2/httpd.conf
printf "\n<Directory \"/app/public\">\n\tAllowOverride All\n</Directory>\n" >> /etc/apache2/httpd.conf
# chown -R apache:apache /app/dev

httpd -D FOREGROUND

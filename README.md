# Docker Alpine Apache PHP


    $ docker run --name alpine-apache-php -v $(pwd):/app -p 80:80 --link mysql:mysql -d -t dflourusso/alpine-apache-php


> Apache will search an *index.php* in *./public*

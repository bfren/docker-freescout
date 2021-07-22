FROM bfren/nginx-php:php7.4-2.2.4

COPY ./overlay /
COPY ./FREESCOUT_VERSION /tmp/FREESCOUT_VERSION
COPY ./PHP_REVISION /tmp/PHP_VERSION

COPY ./overlay /

RUN bf-install

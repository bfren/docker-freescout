FROM bfren/nginx-php:php7.4-2.2.8

ENV \
    # set to the application's external URL
    FREESCOUT_URL= \
    # admin user's first name
    FREESCOUT_ADMIN_FIRSTNAME= \
    # admin user's last name
    FREESCOUT_ADMIN_LASTNAME= \
    # admin user's email address
    FREESCOUT_ADMIN_EMAIL= \
    # admin user's password
    FREESCOUT_ADMIN_PASS= \
    # database name
    WP_DB_NAME= \
    # database user
    WP_DB_USER= \
    # database password
    WP_DB_PASS= \
    # database host
    WP_DB_HOST= \
    WP_DEBUG=0

COPY ./overlay /
COPY ./FREESCOUT_REVISION /tmp/FREESCOUT_VERSION
COPY ./PHP_BUILD /tmp/PHP_VERSION

COPY ./overlay /

RUN bf-install

VOLUME [ "/data" ]

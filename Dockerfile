FROM bfren/nginx-php:php7.4-3.2.0

ARG BF_IMAGE
ARG BF_VERSION

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
    # database connection type (valid values: 'mysql' or 'postgresql')
    FREESCOUT_DB_CONN=mysql \
    # database port (e.g. 3306 for MySQL or 5432 for PostgreSQL)
    FREESCOUT_DB_PORT=3306

COPY ./overlay /
COPY ./FREESCOUT_REVISION /tmp/FREESCOUT_VERSION
COPY ./PHP_BUILD /tmp/PHP_VERSION

COPY ./overlay /

RUN bf-install

VOLUME [ "/data" ]

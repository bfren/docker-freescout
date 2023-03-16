FROM bfren/nginx-php:php8.2-5.3.28

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-freescout"

ARG BF_IMAGE
ARG BF_VERSION

ENV \
    # disable debug output by default
    BF_DEBUG=0 \
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
COPY ./php8.2/overlay /

RUN bf-install

VOLUME [ "/data" ]

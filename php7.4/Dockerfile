FROM ghcr.io/bfren/nginx-php:php7.4.33-7.2.14

LABEL org.opencontainers.image.source="https://github.com/bfren/docker-freescout"

ARG BF_IMAGE
ARG BF_PUBLISHING
ARG BF_VERSION

COPY ./overlay /
COPY ./php7.4/overlay /

ENV \
    # set to the application's external URL
    BF_FS_URL= \
    # admin user's first name
    BF_FS_ADMIN_FIRSTNAME= \
    # admin user's last name
    BF_FS_ADMIN_LASTNAME= \
    # admin user's email address
    BF_FS_ADMIN_EMAIL= \
    # admin user's password
    BF_FS_ADMIN_PASS= \
    # database connection type (valid values: 'mysql' or 'postgresql')
    BF_FS_DB_CONN=mysql \
    # database host
    BF_FS_DB_HOST= \
    # database port (e.g. 3306 for MySQL or 5432 for PostgreSQL)
    BF_FS_DB_PORT=3306 \
    # database name
    BF_FS_DB_NAME=freescout \
    # database user account
    BF_FS_DB_USER= \
    # database password
    BF_FS_DB_PASS=

RUN bf-install

VOLUME [ "/data" ]

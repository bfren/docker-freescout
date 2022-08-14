# Docker FreeScout

![GitHub release (latest by date)](https://img.shields.io/github/v/release/bfren/docker-freescout) ![Docker Pulls](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fpulls%2Ffreescout) ![Docker Image Size](https://img.shields.io/endpoint?url=https%3A%2F%2Fbfren.dev%2Fdocker%2Fsize%2Ffreescout)<br/>
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/bfren/docker-freescout/dev-php7_4?label=PHP+7.4) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/bfren/docker-freescout/dev-php8_0?label=PHP+8.0) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/bfren/docker-freescout/dev-php8_1?label=PHP+8.1)

[Docker Repository](https://hub.docker.com/r/bfren/freescout) - [bfren ecosystem](https://github.com/bfren/docker)

Comes with [FreeScout](https://freescout.net/) preinstalled, along with all the required and recommended PHP modules.

## Contents

* [Ports](#ports)
* [Volumes](#volumes)
* [Environment Variables](#environment-variables)
* [Licence / Copyright](#licence)

## Ports

* 80

## Volumes

| Volume   | Purpose                                                            |
| -------- | ------------------------------------------------------------------ |
| `/data`  | Installed modules and persistent storage (logs, attachments, etc). |

See the [Nginx](https://github.com/bfren/docker-nginx) image for other configuration details.

## Environment Variables

See the [Nginx + PHP](https://github.com/bfren/docker-nginx-php) image for details of `www.conf` and `php.ini` overrides using environment variables.

| Variable                    | Values        | Description                          | Default                                                       |
| --------------------------- | ------------- | ------------------------------------ | ------------------------------------------------------------- |
| `FREESCOUT_URL`             | string        | Application URL.                     | *None* - required unless taking over a previous installation. |
| `FREESCOUT_ADMIN_FIRSTNAME` | string        | Admin user first name.               | *None* - required unless taking over a previous installation. |
| `FREESCOUT_ADMIN_LASTNAME`  | string        | Admin user last name.                | *None* - required unless taking over a previous installation. |
| `FREESCOUT_ADMIN_EMAIL`     | string        | Admin user email address.            | *None* - required unless taking over a previous installation. |
| `FREESCOUT_ADMIN_PASS`      | string        | Admin user password.                 | *None* - required unless taking over a previous installation. |
| `FREESCOUT_DB_CONN`         | mysql / pgsql | Database connection type.            | mysql                                                         |
| `FREESCOUT_DB_PORT`         | string        | Database name.                       | 3306                                                          |
| `FREESCOUT_DB_NAME`         | string        | Database name.                       | *None* - required unless taking over a previous installation. |
| `FREESCOUT_DB_USER`         | string        | Database username.                   | *None* - required unless taking over a previous installation. |
| `FREESCOUT_DB_PASS`         | string        | Database password.                   | *None* - required unless taking over a previous installation. |
| `FREESCOUT_DB_HOST`         | string        | Database host.                       | *None* - required unless taking over a previous installation. |
| `FREESCOUT_DEBUG`           | 0 or 1        | Whether or not to enable debug mode. | 0                                                             |
| `FREESCOUT_HTTPS`           | true or false | Whether or not to force HTTPS.       | true - set to false if not hosting behind a reverse proxy     |

## Licence

> [MIT](https://mit.bfren.dev/2021)

## Copyright

> Copyright (c) 2021-2022 [bfren](https://bfren.dev) (unless otherwise stated)

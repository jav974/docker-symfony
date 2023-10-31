ARG PHP_VERSION=8.2
ARG WEBSERVER="nginx"

FROM serversideup/php:${PHP_VERSION}-fpm-${WEBSERVER} AS base

RUN apt-get update && apt-get install -y \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-xml

FROM base AS dev

RUN apt-get update && apt-get install -y php${PHP_VERSION}-xdebug
ENV XDEBUG_MODE=off

FROM base AS prod

RUN set -eux; \
    if [ -f composer.json ]; then \
        composer install --prefer-dist --no-dev --no-autoloader --no-scripts --no-progress; \
        composer clear-cache; \
    fi

COPY . .

RUN set -eux; \
    if [ -f composer.json ]; then \
        composer dump-autoload --classmap-authoritative --no-dev; \
        composer dump-env prod; \
        composer run-script --no-dev post-install-cmd; \
        chmod +x bin/console; sync; \
    fi


ARG PHP_VERSION=8.2
ARG WEBSERVER=nginx

FROM serversideup/php:${PHP_VERSION}-fpm-${WEBSERVER} AS base
ARG PHP_VERSION

RUN apt-get update && apt-get install -y \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-xml

FROM base AS dev
ARG PHP_VERSION

RUN apt-get update && apt-get install -y php${PHP_VERSION}-xdebug
COPY .docker/php/xdebug.ini /etc/php/current_version/mods-available/xdebug.ini
ENV XDEBUG_MODE=off

FROM base AS prod
ENV APP_ENV=prod

COPY . .

RUN set -eux; \
    composer install --prefer-dist --no-dev --no-autoloader --no-scripts --no-progress; \
    composer clear-cache; \
    composer dump-autoload --classmap-authoritative --no-dev; \
    composer run-script --no-dev post-install-cmd; \
    chmod +x bin/console; \
    chown -R webuser:webgroup .; \
    sync;


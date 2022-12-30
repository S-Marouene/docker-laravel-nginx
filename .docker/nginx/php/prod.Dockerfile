
#composeer
FROM composer AS composer-build

WORKDIR /var/www/html

COPY composer.json composer.lock /var/www/html/


RUN mkdir -p /var/www/html/database/{factories,seeds} \
    && composer install --no-dev --prefer-dist --no-scripts --no-autoloader --no-progress --ignore-platform-reqs

#npm
FROM node:12 AS npm-build

WORKDIR /var/www/html

COPY package.json webpack.mix.js /var/www/html/
COPY resources /var/www/html/resources/
COPY public /var/www/html/public/
#RUN npm ci
#RUN npm run production

#production images
FROM php:7.4-fpm
WORKDIR /var/www/html

RUN apt-get update && apt-get install --quiet --yes --no-install-recommends \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo pdo_mysql

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY --chown=www-data --from=composer-build /var/www/html/vendor/ /var/www/html/vendor/

COPY --chown=www-data --from=npm-build /var/www/html/public/ /var/www/html/public/

COPY --chown=www-data . /var/www/html/

RUN composer dump -o \
    && composer check-platform-reqs \
    && rm -f /usr/bin/composer


FROM php:7.4-fpm


# Set working directory
WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install --quiet --yes --no-install-recommends \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip pdo pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer


RUN groupadd --gid 1000 appuser \
    && useradd --uid 1000 -g appuser \
        -G www-data,root --shell /bin/bash \
        --create-home appuser

USER appuser

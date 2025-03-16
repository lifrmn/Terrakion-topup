FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libpng-dev \
    libonig-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install intl mbstring pdo_mysql zip gd

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

CMD ["php-fpm"]

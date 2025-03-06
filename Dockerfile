FROM php:8.3-apache
LABEL maintainers="Polyntsov Konstantin <optimistex@gmail.com>"

# === INSTALL MODULES ===
RUN apt-get update && apt-get install -y zip libzip-dev && docker-php-ext-install zip

# === INSTALL COMPOSER ===
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --version=2.8.5 \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

# === SET UP WORKING DIR ===
WORKDIR /var/www/html

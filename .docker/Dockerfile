FROM php:8.2-fpm

RUN apt-get update \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-enable pdo_mysql

# Désactiver l'affichage des erreurs dans le HTML
RUN { \
    echo "display_errors = Off"; \
    echo "display_startup_errors = Off"; \
    echo "log_errors = On"; \
    echo "error_log = /dev/stderr"; \
} > /usr/local/etc/php/conf.d/error-logging.ini

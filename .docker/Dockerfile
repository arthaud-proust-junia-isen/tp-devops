FROM nginx:1.29.1

# Installer PHP + MariaDB
RUN apt-get update && apt-get install -y \
    lsb-release \
    ca-certificates \
    apt-transport-https \
    software-properties-common \
    gnupg2 \
    curl \
    mariadb-server \
 && curl -sSL https://packages.sury.org/php/README.txt | bash -x \
 && apt-get update \
 && apt-get install -y php8.1-fpm php8.1-cli php8.1-mysql \
 && rm -rf /var/lib/apt/lists/*

 # Supprimer la config par défaut de nginx
RUN rm /etc/nginx/conf.d/default.conf

# Configurer PHP-FPM pour écouter en TCP plutôt qu'en socket
RUN sed -i 's|listen = /run/php/php8.1-fpm.sock|listen = 9000|' /etc/php/8.1/fpm/pool.d/www.conf

COPY .docker/nginx.conf /etc/nginx/conf.d/croupier.conf
COPY . /var/www/html/croupier

# Créer la db et remplir avec des données de test
COPY .docker/init.sql /docker-entrypoint-initdb.d/init.sql

# Exposer Nginx
EXPOSE 80

# Démarrer MariaDB, PHP-FPM et Nginx
CMD service mariadb start \
    && mysql -u root -e "SOURCE /docker-entrypoint-initdb.d/init.sql;" \
    && mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'mnVkrECAWnj96Yk4'; FLUSH PRIVILEGES;" \
    && service php8.1-fpm start \
    && nginx -g "daemon off;"
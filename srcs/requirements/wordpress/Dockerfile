FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
    wget \
    php7.4-fpm \
    php7.4-mysqli \
    php-mysql \
    mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php && \
    chown -R www-data:www-data /run/php && \
    mkdir -p /var/www/html

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./tools/wp-downloader.sh .

RUN chmod +x ./wp-downloader.sh

ENTRYPOINT ["sh", "./wp-downloader.sh"]

FROM debian:bullseye
RUN apt update && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/absalah.key \
    -out /etc/nginx/ssl/absalah.crt \
    -subj "/C=MO/ST=KH/L=KH/O=1337/OU=1337/CN=absalah.42.fr/UID=absalah"

COPY conf/nginx.conf /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]
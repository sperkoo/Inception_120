FROM debian:bullseye

RUN apt update && apt install -y nginx

COPY ./tools/ /var/www/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

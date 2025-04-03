FROM debian:bullseye

RUN apt -y update && \
    apt install -y wget php php-mysql

COPY ./tools/adminer-downloader.sh /adminer-downloader.sh

RUN chmod +x /adminer-downloader.sh

CMD ["/adminer-downloader.sh"]
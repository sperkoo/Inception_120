FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql && \
    chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql

COPY tools/db_creator.sh .

RUN chmod +x ./db_creator.sh

ENTRYPOINT ["sh", "./db_creator.sh"]

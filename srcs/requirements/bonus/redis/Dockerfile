FROM debian:bullseye

RUN apt-get update -y && \
    apt-get install -y redis && \
    apt-get install -y redis-server

RUN echo 'maxmemory 256mb' >> /etc/redis/redis.conf && \ 
   echo 'maxmemory-policy allkeys-lru' >> /etc/redis/redis.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
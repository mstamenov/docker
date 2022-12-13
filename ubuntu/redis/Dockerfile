FROM redis

RUN mkdir /usr/local/etc/redis
COPY redis.conf /usr/local/etc/redis/

COPY entrypoint.sh /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

ENTRYPOINT ["/bin/bash", "/root/entrypoint.sh"]

sed -E -i.bak "\
s/^bind /# \0/; \
s/^save /# \0/; \
s/^appendonly no$/appendonly yes/; \
s/^auto-aof-rewrite-percentage .*$/auto-aof-rewrite-percentage 33/; \
s/^# requirepass .*$/requirepass $redis_password/; \
s/^# maxmemory-policy .*$/maxmemory-policy volatile-ttl/; \
s/^# maxmemory .*$/maxmemory 28gb/; \
" /usr/local/etc/redis/redis.conf

redis-server /usr/local/etc/redis/redis.conf

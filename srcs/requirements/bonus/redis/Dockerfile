FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y redis

COPY ./conf/cache.conf /etc/redis/cache.conf

RUN cat /etc/redis/cache.conf >> /etc/redis/redis.conf && \
    rm /etc/redis/cache.conf

EXPOSE 6379

ENTRYPOINT ["redis-server", "--protected-mode", "no"]
#test pour fonctionnement
#redis-cli -h localhost
#ping //reponse pong
#Définissez et obtenez des valeurs associées à une clé.
#redis-cli -h 127.0.0.1 -p 6379 set test_key "Hello, Redis!"
#redis-cli -h 127.0.0.1 -p 6379 get test_key
#Définissez une expiration pour une clé et vérifiez si elle disparaît après expiration.
#redis-cli -h 127.0.0.1 -p 6379 set my_key "My Value"
#redis-cli -h 127.0.0.1 -p 6379 expire my_key 30
#Utilisez des outils de benchmarking tels que redis-benchmark pour évaluer les performances de votre cache Redis.
#redis-benchmark -h 127.0.0.1 -p 6379
#Utilisez la commande INFO pour obtenir des informations sur l'état de Redis, telles que la mémoire utilisée, le nombre de clés, etc.
#redis-cli -h 127.0.0.1 -p 6379 info

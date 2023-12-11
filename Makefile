
all: 
	mkdir -p /home/blefebvr/data/mariadb
	mkdir -p /home/blefebvr/data/wordpress
	mkdir -p /home/blefebvr/data/adminer
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx
	docker logs redis
	docker logs adminer
	docker logs ftp_server
	docker logs hugo

clean:
	docker container stop nginx mariadb wordpress adminer redis hugo ftp_server 2> /dev/null || true;
	docker network rm inception 2> /dev/null || true;

fclean: clean
	@sudo rm -rf /home/blefebvr/data/mariadb/*
	@sudo rm -rf /home/blefebvr/data/wordpress/*
	@sudo rm -rf /home/blefebvr/data/adminer/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean

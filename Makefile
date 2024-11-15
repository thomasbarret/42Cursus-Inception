all:
	@sudo docker pull debian:bullseye
	@sudo mkdir -p /home/tbarret/data/wordpress
	@sudo mkdir -p /home/tbarret/data/mariadb
	@sudo docker compose -f srcs/docker-compose.yml up --build -d
redis:
	@sudo docker compose -f srcs/docker-compose.yml build redis

ftp:
	@sudo docker compose -f srcs/docker-compose.yml build ftp

adminer:
	@sudo docker compose -f srcs/docker-compose.yml build adminer

wordpress:
	@sudo docker compose -f srcs/docker-compose.yml build wordpress

mariadb:
	@sudo docker compose -f srcs/docker-compose.yml build mariadb

site:
	@sudo docker compose -f srcs/docker-compose.yml build sit

stop:
	@sudo docker compose -f srcs/docker-compose.yml stop

fclean: stop
	@sudo rm -rf /home/tbarret/data/wordpress
	@sudo rm -rf /home/tbarret/data/mariadb
	@sudo docker system prune -af

down:
	@sudo docker compose -f srcs/docker-compose.yml down -v

re: fclean
	make all

bonus: all

.PHONY: all clean fclean re bonu

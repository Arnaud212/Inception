LOGIN = agiraud
PATH_COMPOSE = ./srcs/docker-compose.yml
PATH_VOLUME	= /home/$(LOGIN)/data

all: build up

build:
	sudo mkdir -p $(PATH_VOLUME)/wordpress
	sudo mkdir -p $(PATH_VOLUME)/mariadb
	sudo chmod -R 777 $(PATH_VOLUME)/mariadb
	sudo chmod -R 777 $(PATH_VOLUME)/wordpress
	sudo docker-compose --file=$(PATH_COMPOSE) build --no-cache

up:
	sudo docker-compose --file=$(PATH_COMPOSE) up --detach
	sudo grep $(LOGIN).42.fr /etc/hosts || echo "127.0.0.1 $(LOGIN).42.fr" | sudo tee -a /etc/hosts

down:
	docker-compose --file=$(PATH_COMPOSE) down --rmi all --remove-orphans -v

start:
	docker-compose --file=$(PATH_COMPOSE) start

stop:
	docker-compose --file=$(PATH_COMPOSE) stop

fclean: down
	sudo rm -rf $(PATH_VOLUME)

re: fclean all

.PHONY: all up down start stop fclean re 
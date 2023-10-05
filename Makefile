YML_PATH = ./srcs/docker-compose.yml

all: up

up:
	docker-compose -f $(YML_PATH) up -d --build

down:
	docker-compose -f $(YML_PATH) down

logs:
	docker-compose -f $(YML_PATH) logs

clean:
	@docker system prune -af

fclean: clean
	@docker volume prune -af
	@cd /home/asadanow/data/ && sudo rm -rf mariadb/* && sudo rm -rf wordpress/*

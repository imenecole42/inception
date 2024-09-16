all: 
	mkdir -p /home/imraoui/data/mariadb
	mkdir -p /home/imraoui/data/wordpress
	mkdir -p /home/imraoui/data/adminer
	docker compose -f ./srcs/docker-compose.yml build
	docker compose -f ./srcs/docker-compose.yml up -d

logs:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx
	docker logs redis
	docker logs hugo
	docker logs adminer
	docker logs ftp_server

clean:
	docker container stop nginx mariadb wordpress redis  hugo adminer ftp_server 
	docker network rm inception

fclean: clean
	@sudo rm -rf /home/imraoui/data/mariadb/*
	@sudo rm -rf /home/imraoui/data/wordpress/*
	#@sudo rm -rf /home/imraoui/data/adminer/*
	@docker system prune -af

re: fclean all

.Phony: all logs clean fclean

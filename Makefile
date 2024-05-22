all:
	sudo docker-compose -f src/docker-compose.yml  up -d --build
down:
	sudo docker-compose -f src/docker-compose.yml  down
clean: down
	yes | sudo docker system prune -a
.PHONY: all down clean
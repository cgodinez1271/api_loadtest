# Makefile
#Thu Nov 21 12:21:20 EST 2019
#
container = apitest

help:   ## Show this help
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start:  ## Start docker container
	docker-compose up
	docker ps

stop:   ## Stop & remove container
	docker stop $(container)
	docker rm $(container)

logs:   ## Show container logs
	docker container logs $(container)

login:  ## Login into container
	docker exec -it $(container) bash 

vmstat: ## Execute mpstat on container 
	docker exec -it $(container) vmstat 2

status: ## Show container status
	docker ps -f name=$(container)

update_os:
	docker exec -it $(container) apt update && apt upgrade -y
	docker exec -it $(container) apt-get install htop

htop:
	docker exec -it $(container) htop



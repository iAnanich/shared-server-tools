include .env
export

.env:
	cp example.env .env
	nano .env

docker-compose.yml:
	sh from-template.sh

it: .env
	echo "setting up like for the first time..."
	make label-this-node
	make create-net
	echo "Deploying..."
	make deploy
	make ps


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${POSTGRES_STACK_NAME}

rm:
	docker stack rm ${POSTGRES_STACK_NAME}

# Status
# ------

ps:
	docker stack ps ${POSTGRES_STACK_NAME}

ls:
	docker stack services ${POSTGRES_STACK_NAME}

# Network
# -------

create-net:
	docker network create --driver overlay ${POSTGRES_NETWORK_NAME}

remove-net:
	docker network rm ${POSTGRES_NETWORK_NAME}

# Logs
# ----

log:
	docker service logs ${POSTGRES_STACK_NAME}_postgres

flog:
	docker service logs --follow ${POSTGRES_STACK_NAME}_postgres

# Volumes
# -------

remove-data:
	docker volume rm ${POSTGRES_STACK_NAME}_data

# Labels
# ------

label-this-node:
	sh label-this-node.sh

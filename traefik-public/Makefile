include .env
export

.env:
	sh configure.sh

docker-compose.yml: .env
	sh from-template.sh

it: .env
	echo "setting up like for teh first time..."
	make create-network
	make label-this-node
	echo "Deploying..."
	make deploy
	make ps

clean-after:
	make rm
	make remove-certificates-volume
	make remove-network
	echo "everything cleaned."


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Network
# -------

create-network:
	docker network create --driver=overlay ${TRAEFIK_NETWORK_NAME}

remove-network:
	docker network rm ${TRAEFIK_NETWORK_NAME}

# Volume
# ------

remove-certificates-volume:
	docker volume rm ${TRAEFIK_STACK_NAME}_certificates

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${TRAEFIK_STACK_NAME}

rm:
	docker stack rm ${TRAEFIK_STACK_NAME}

# Status
# ------

ps:
	docker stack ps ${TRAEFIK_STACK_NAME}

ls:
	docker stack services ${TRAEFIK_STACK_NAME}

# Logs
# ----

log:
	docker service logs ${TRAEFIK_STACK_NAME}_traefik

flog:
	docker service logs --follow ${TRAEFIK_STACK_NAME}_traefik

# utils
# -----

label-this-node:
	sh label-this-node.sh

clear-acme:
	make rm
	make remove-certificates-volume
	make deploy

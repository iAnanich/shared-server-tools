include .env
export

.env:
	cp example.env .env
	nano .env

it: .env
	echo "setting up like for teh first time..."
	make label-node
	echo "Deploying..."
	make deploy
	make ps


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${PORTAINER_STACK_NAME}

rm:
	docker stack rm ${PORTAINER_STACK_NAME}

# Status
# ------

ps:
	docker stack ps ${PORTAINER_STACK_NAME}

ls:
	docker stack services ${PORTAINER_STACK_NAME}

# Logs
# ----

log:
	docker service logs ${PORTAINER_STACK_NAME}_portainer

flog:
	docker service logs --follow ${PORTAINER_STACK_NAME}_portainer

# utils
# -----

label-node:
	sh label-node.sh

include .env
export

first-time:
	echo "setting up like for teh first time..."
	make label-node
	make deploy
	make ls


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${PORTAINER_STACK_NAME}

rm:
	docker stack rm ${PORTAINER_STACK_NAME}

ps:
	docker stack ps ${PORTAINER_STACK_NAME}

ls:
	docker service ls | grep "${PORTAINER_STACK_NAME}"

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

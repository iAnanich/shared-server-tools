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
	docker stack deploy -c docker-compose.yml ${SWARMPIT_STACK_NAME}

rm:
	docker stack rm ${SWARMPIT_STACK_NAME}

ps:
	docker stack ps ${SWARMPIT_STACK_NAME}

ls:
	docker service ls | grep "${SWARMPIT_STACK_NAME}"

# Logs
# ----

log:
	docker service logs ${SWARMPIT_STACK_NAME}_app

flog:
	docker service logs --follow ${SWARMPIT_STACK_NAME}_app

# utils
# -----

label-node:
	sh label-node.sh

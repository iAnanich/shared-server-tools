include .env
export

.env:
	cp example.env .env
	nano .env

it: .env
	echo "setting up like for teh first time..."
	make label-this-node
	echo "Deploying..."
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

# Status
# ------

ps:
	docker stack ps ${SWARMPIT_STACK_NAME}

ls:
	docker stack services ${SWARMPIT_STACK_NAME}

# Logs
# ----

log:
	docker service logs ${SWARMPIT_STACK_NAME}_app

flog:
	docker service logs --follow ${SWARMPIT_STACK_NAME}_app

# utils
# -----

label-this-node:
	sh label-this-node.sh

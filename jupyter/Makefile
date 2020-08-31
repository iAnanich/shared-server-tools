include .env
export

.env:
	cp example.env .env
	nano .env

it: .env
	echo "setting up like for the first time..."
	make label-this-node
	echo "Deploying..."
	make deploy
	make ps


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${JUPYTER_STACK_NAME}

rm:
	docker stack rm ${JUPYTER_STACK_NAME}

# Status
# ------

ps:
	docker stack ps ${JUPYTER_STACK_NAME}

ls:
	docker stack services ${JUPYTER_STACK_NAME}

# Logs
# ----

log:
	docker service logs ${JUPYTER_STACK_NAME}_notebook

flog:
	docker service logs --follow ${JUPYTER_STACK_NAME}_notebook

# labels
# -----

label-this-node:
	sh label-this-node.sh

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
	make create-config-volume
	echo "Entering interactive runner registration..."
	make iregister
	echo "Deploying..."
	make deploy
	make ps

iregister:
	# https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container
	docker run --rm -it -v ${GITLABCIRUNNER_VOLUME_NAME}:/etc/gitlab-runner gitlab/gitlab-runner:latest register

# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Stack
# -----

deploy: docker-compose.yml
	docker stack deploy -c docker-compose.yml ${GITLABCIRUNNER_STACK_NAME}

rm:
	docker stack rm ${GITLABCIRUNNER_STACK_NAME}

# Status
# ------

ps:
	docker stack ps ${GITLABCIRUNNER_STACK_NAME}

ls:
	docker stack services ${GITLABCIRUNNER_STACK_NAME}

# Logs
# ----

log:
	docker service logs ${GITLABCIRUNNER_STACK_NAME}_runner

flog:
	docker service logs --follow ${GITLABCIRUNNER_STACK_NAME}_runner

# labels
# -----

label-this-node:
	sh label-this-node.sh

# Volumes
# -------

create-config-volume:
	docker volume create ${GITLABCIRUNNER_VOLUME_NAME}

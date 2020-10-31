include .env
export

.env:
	sh configure.sh

docker-compose.dump.yml: .env
	docker-compose -f docker-compose.yml config > docker-compose.dump.yml

it: .env
	echo "setting up like for teh first time..."
	make mk-net
	make put-labels
	echo "Deploying..."
	make deploy
	make ps

clean-after:
	make rm-stack
	make rm-certs-volume
	make rm-net
	make clear-labels
	echo "everything cleaned."


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Network
# -------

mk-net:
	docker network create --driver=overlay ${TRAEFIK_NETWORK}

rm-net:
	docker network rm ${TRAEFIK_NETWORK}

# Volume
# ------

rm-certs-volume:
	docker volume rm ${TRAEFIK_STACK}_certs

# Stack
# -----

deploy: docker-compose.dump.yml
	docker stack deploy -c docker-compose.dump.yml ${TRAEFIK_STACK}

update:
	make cleancfg
	make deploy

rm-stack:
	docker stack rm ${TRAEFIK_STACK}

# Status
# ------

ps:
	docker stack ps ${TRAEFIK_STACK}

ls:
	docker stack services ${TRAEFIK_STACK}

# Logs
# ----

log:
	docker service logs ${TRAEFIK_STACK}_traefik

flog:
	docker service logs --follow ${TRAEFIK_STACK}_traefik

# labels
# ------

put-labels:
	docker node update --label-add ${TRAEFIK_NODE_LABEL_CERTS}=true $$(docker info -f '{{.Swarm.NodeID}}')

clear-labels:
	docker node update --label-rm ${TRAEFIK_NODE_LABEL_CERTS} $$(docker info -f '{{.Swarm.NodeID}}')

# Configuration
# -------------

dump-cfg:
	make docker-compose.dump.yml

clean-cfg:
	rm -f docker-compose.dump.yml

# utils
# -----

clear-acme:
	make rm-stack
	make rm-certs-volume
	make deploy

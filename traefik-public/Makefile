include .env
export

.env:
	sh configure.sh

docker-compose.dump.yml: .env
	docker-compose -f docker-compose.yml config > docker-compose.dump.yml

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
	docker network create --driver=overlay ${TRAEFIK_NETWORK}

remove-network:
	docker network rm ${TRAEFIK_NETWORK}

# Volume
# ------

remove-certificates-volume:
	docker volume rm ${TRAEFIK_STACK}_certificates

# Stack
# -----

deploy: docker-compose.dump.yml
	docker stack deploy -c docker-compose.dump.yml ${TRAEFIK_STACK}

update:
	make cleancfg
	make deploy

rm:
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

dumpcfg:
	make docker-compose.dump.yml

cleancfg:
	rm -f docker-compose.dump.yml

# utils
# -----

clear-acme:
	make rm
	make remove-certificates-volume
	make deploy

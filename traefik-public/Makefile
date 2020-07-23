
cfg:
	sh configure.sh

docker-swarm.yml:
	make cfg

first-time:
	echo "setting up like for teh first time..."
	make create-network
	make tag-the-node
	make deploy
	make ps

clean-after:
	make rm
	make clear-acme
	make remove-network
	echo "everything cleaned."

# utils
# -----

hash:
	openssl passwd -apr1


# -----------------------------
#  ~ Docker Swarm operations ~
# =============================

# Network
# -------

create-network:
	docker network create --driver=overlay traefik-public

remove-network:
	docker network rm traefik-public

# Stack
# -----

deploy: docker-swarm.yml
	docker stack deploy -c docker-swarm.yml traefik-front

rm:
	docker stack rm traefik-front

ps:
	docker stack ps traefik-front

# Logs
# ----

log:
	docker service logs traefik-front_traefik

flog:
	docker service logs --follow traefik-front_traefik

# utils
# -----

tag-the-node:
	sh tag-the-node.sh

clear-acme:
	make rm
	docker volume rm traefik-front_traefik-public-certificates
	make deploy

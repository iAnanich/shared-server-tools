
source .env

docker-compose -f docker-swarm.template.yml config > docker-swarm.yml

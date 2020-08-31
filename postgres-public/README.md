
# Postgres public


### Good to know

* If you want to deploy this stack with Portainer, use `make docker-compose.yml` 
command to create config file from template and copy-paste it into Portainer 
stack editor.
* Before deploying this stack, you need to put label on the node where you want 
to store database data (use `make label-this-node`), create external overlay 
network and create 2 docker secrets (listed in `docker-compose.yml`).

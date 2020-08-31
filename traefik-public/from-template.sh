#!/bin/bash

envsubst '$TRAEFIK_NETWORK_NAME' > docker-compose.yml < docker-compose.template.yml

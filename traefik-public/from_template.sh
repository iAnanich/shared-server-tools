#!/bin/bash

envsubst '$TRAEFIK_CERTIFICATES_VOLUME_NAME,$TRAEFIK_NETWORK_NAME' < docker-compose.template.yml > docker-compose.yml

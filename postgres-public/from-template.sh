#!/bin/bash

envsubst '$POSTGRES_NETWORK_NAME,$POSTGRES_STACK_NAME' > docker-compose.yml < docker-compose.template.yml

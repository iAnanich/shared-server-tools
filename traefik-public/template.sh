#!/bin/bash

source .env

docker-compose -f docker-compose.template.yml config > docker-swarm.yml

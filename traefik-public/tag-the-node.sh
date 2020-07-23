#!/bin/bash

# Code from:
# https://dockerswarm.rocks/traefik/

echo "This script will prepare current node for further usage:
it tags current node as one for storing SSL certs."

# get Docker Swarm node ID
node_id=$(docker info -f '{{.Swarm.NodeID}}')

# Create a tag in this node, so that Traefik is always deployed to the same
# node and uses the same volume
docker node update --label-add traefik-public.traefik-public-certificates=true $node_id

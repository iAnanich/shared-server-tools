#!/bin/bash

# Code idea from:
# https://dockerswarm.rocks/portainer/

echo "This script will prepare current node for further usage:
it labels current node as one for storing Portainer data."

# get Docker Swarm node ID
node_id=$(docker info -f '{{.Swarm.NodeID}}')

label="portainer.portainer-data=true"
docker node update --label-add $label $node_id
echo "Successfully labeled node $node_id for $label"

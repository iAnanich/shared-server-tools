#!/bin/bash

# Code idea from:
# https://dockerswarm.rocks/swarmpit/

echo "This script will prepare current node for further usage:
it labels current node as one for storing Swarmpit data."

# get Docker Swarm node ID
node_id=$(docker info -f '{{.Swarm.NodeID}}')

label1="swarmpit.db-data=true"
label2="swarmpit.influx-data=true"

docker node update --label-add $label1 $node_id
docker node update --label-add $label2 $node_id

echo "Successfully labeled node $node_id for $label1 and $label2"

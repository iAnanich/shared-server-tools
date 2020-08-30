#!/bin/bash

echo "This script will prepare current node for further usage:
it labels current node as one for storing Jupyter Notebook data."

# get Docker Swarm node ID
node_id=$(docker info -f '{{.Swarm.NodeID}}')

label="jupyter.notebook-data=true"
docker node update --label-add $label $node_id
echo "Successfully labeled node $node_id for $label"

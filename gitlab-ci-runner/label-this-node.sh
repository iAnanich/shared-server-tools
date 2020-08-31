#!/bin/bash

echo "This script will prepare current node for further usage:
it labels current node as one for storing GitLab CI Runner config."

# get Docker Swarm node ID
node_id=$(docker info -f '{{.Swarm.NodeID}}')

label="gitlab-ci-runner.config=true"
docker node update --label-add $label $node_id
echo "Successfully labeled node $node_id for $label"

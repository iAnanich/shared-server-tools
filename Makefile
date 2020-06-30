
# List docker swarm stacks
stacks:
	docker stack ls

# ==============
#  Docker tools
# --------------

# free up sime space be removing unused data (containers, images, build cache)
prune:
	docker system prune

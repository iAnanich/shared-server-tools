
# Docker container name: gitlab-runner
# Docker volume for runner config files: gitlab-runner-config

create:
	bash create.sh

remove:
	docker stop gitlab-runner
	docker rm gitlab-runner

enter:
	docker exec -it gitlab-runner bash

register:
	# https://docs.gitlab.com/runner/install/docker.html#option-2-use-docker-volumes-to-start-the-runner-container
	docker run --rm -it -v gitlab-runner-config:/etc/gitlab-runner gitlab/gitlab-runner:latest register

start:
	docker start gitlab-runner

stop:
	docker stop gitlab-runner

pause:
	docker pause gitlab-runner

unpause:
	docker unpause gitlab-runner

log:
	docker logs gitlab-runner

flog:
	docker logs --follow gitlab-runner


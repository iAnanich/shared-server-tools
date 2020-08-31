
# GitLab CI runner

Implemented via conventional docker container.

* https://dockerswarm.rocks/gitlab-ci/
* https://docs.gitlab.com/runner/install/docker.html

## Setup

#### with Makefile

```shell script
make it
```

This command will create `.env` and enter nano editor for you to change env var 
values. Than current node will be labeled and config volume created. At the end, 
deployment happens and GitLab CI Runner must be available.

#### with Portainer

Copy-paste `docker-compose.template.yml` into stack editor and replace 
`$GITLABCIRUNNER_VOLUME_NAME` with desired volume name (volume must have been 
created before).

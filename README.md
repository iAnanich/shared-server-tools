
# Shared server tools

Set of tools of operating server shared with multiple projects using Docker.

[TOC]

### Requirements

```shell script
apt install make docker.io docker-compose openssl
```

Although, useful packages:
```shell script
apt install git curl apache2-utils htop gettext-base
```

Pull common docker images:
```shell script
docker pull traefik:latest
docker pull nginx:stable-alpine
docker pull postgres:alpine
```

## Features

#### GitLab CI runner

`./gitlab-ci-runner/`

Scripts for setting up your own GitLab CI runner.

#### Traefik public

`./traefik-public/`

Cluster-wide load balancer and https proxy.

#### Portainer

`./portainer/`

Portainer is a web UI (user interface) that allows you to see the state of 
your Docker services in a Docker Swarm mode cluster and manage it.

## Commands

See `Makefile` for list of shortcuts and what they do.

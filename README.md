
# Shared server tools

Set of tools of operating server shared with multiple projects using Docker.

[TOC]

### Requirements

```shell script
apt install make docker.io docker-compose openssl
```

Although, useful packages:
```shell script
apt install git curl apache2-utils htop
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

Cluster-wide load balancer.

## Commands

See `Makefile` for list of shortcuts and what they do.

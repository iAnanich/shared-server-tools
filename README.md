
# Shared server tools

Set of tools of operating server shared with multiple projects using Docker.

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

## Commands

See `Makefile` for list of shortcuts and what they do.

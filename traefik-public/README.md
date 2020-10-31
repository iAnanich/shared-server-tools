
# Traefik public
Cluster-wide load-balancer/proxy

Inspired by https://dockerswarm.rocks/traefik/

#### Enabled features
* auto HTTPS (powered by Let's Encrypt)
* configurable by labels
* IP forwarding
* forwards to services with `traefik.constraint-label=traefik-public` label

## How to setup

#### First time launching

```shell script
make it
```
This command will execute configuration script and deploy for the first time.

**Note**: if something went wrong, you can type `make clean-after` to revert all changes.

#### Configure

Configuration happens in to steps:
1. `.env` - can be created by hand from `example.env` file (copy and edit) or 
by `make .env` which will prompt for every value.
2. `docker-compose.dump.yml` - created by `make dumpcfg` which applies settings
from `.env` to `docker-compose.yml`. Further modifications can be applied too.

For reconfiguration, type `make .env`, and then `make deploy` to apply changes.

#### Deploy

```shell script
make deploy
```
Applies changes from `docker-compose.dump.yml`.

`make deploy` will use config from last dump, so if you applied changes to 
`.env`, use `make update`. 

#### Further management
See Makefile for full list of shortcuts.

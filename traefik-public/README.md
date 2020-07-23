
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
make first-time
```

**Note**: if something went wrong, you can type `make clean-after` to revert all changes.

#### Configure

For first-time configuration or reconfiguration, type `make configure`.

**Note**: this will create ignored `docker-swarm.yml`. 
If calling `make deploy` or `make first-time` without the file, 
configuration script will be executed, prompting for settings.

#### Deploy

```shell script
make deploy
```

#### Further management
See Makefile for full list of shortcuts.

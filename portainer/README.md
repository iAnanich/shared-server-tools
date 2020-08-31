
# Portainer

Inspired by (copied from) https://dockerswarm.rocks/portainer/

More about Portainer CE [here](https://www.portainer.io/portainer-ce/)

## How to setup

#### First time launching

```shell script
make it
```
This command will prepare the node and deploy for the first time.

**Note**: if something went wrong, you can type `make rm` to remove stack.

#### Configure

Configuration is stored in `.env` - it can be created by hand from 
`example.env` file (copy and edit).

#### Deploy

```shell script
make deploy
```
Applies changes from `docker-compose.yml`.

#### Further management
See Makefile for full list of shortcuts.

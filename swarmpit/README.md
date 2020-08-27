
# Swarmpit

Inspired by (copied from) https://dockerswarm.rocks/swarmpit/

More about Swarmpit [here](https://swarmpit.io/)

## How to setup

#### First time launching

```shell script
make first-time
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


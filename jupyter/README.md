
# Jupyter Notebook

This setup helps to deploy single Jupyter Notebook.

Most information was pulled from [here](https://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)

## Prerequisites

This boilerplate assumes that your docker swarm:
* `traefik-public` external overlay network
* contains working Traefik service (or stack) which works on services with 
`traefik-public` constraint label.
* `https-redirect` Traefik http middleware for redirecting HTTP requirests to HTTPS
* `le` certificate resolver
* (optional) Portainer stack

## Usage

There are three ways on how to use it:
* native - just use the docker-compose.yml as config for the stack
* makefile - executing commands with `make` and storing variables in `.env`
* portainer (preferred if available) - use Portainer UI to add stack and label node

What this boilerplate has: 
* docker-compose.yml - config file for the stack
* label-node.sh - script for labeling *current* node
* example.env - example for `.env`, shows you what environment variables are 
required
* Makefile - file with shortcuts for operating the stack

#### Native

###### 1. Variables

You will need to set up (export) environment variables listed in 
"Requires by docker stack" section of `example.env` or provide them every time 
`docker stack deploy` is called.

At the moment, this stack requires only `JUPYTER_NOTEBOOK_DOMAIN` env var to be
set.

###### 2. Labels

Put the label on the node where you want to store notebooks home directory. 

Command below will put a label on current node:
```bash
sh label-this-node.sh
```

Script `label-this-node.sh` contains all required labels to be used for stack 
to work properly, so you can check it if you want to put labels on other nodes.

###### 3. Deployment

Execute command below (with env vars if they weren't set before):
```bash
docker stack deploy -c docker-compose.yml jupyter
```
*Note*: stack name `jupyter` can be changed

I hope you know how to operate with the stack on its lifespan, and if not - 
welcome to next option "makefile".

#### Makefile

This approach heavily relies on using `.env` file for storing environment 
variables and reusing them inside Makefile.

First start can be done with a single command:
```bash
make it
```

1. If `.env` file was not created before, command will copy `example.env` and enter 
nano editor - save the file when you are done setting all variable values.
2. Than command attempts to label current node for data persistence.
3. After success, command deploys the stack and prints stack tasks.

Further operation can be done with shortcuts provided by Makefile - read them 
all and try on yourself. For example, `make flog` is useful for reading live logs.

#### Portainer

If Portainer stack is available, that is a preferred way of setting up this simple stack.

###### 1. Prepare

Open Portainer UI and navigate to node settings - select node where you want to 
launch Jupyter Notebook and store its data and put a `jupyter.notebook-data`
label with value `true` on it.

*Note*: please check `label-this-node.sh` script for the full list of required labels.

###### 2. Deploy

Create new stack in Portainer UI using built-in editor. 

Just copy the contents of the `docker-compose.yml` and provide environment 
variables listed in `example.env` file in section "Required by docker stack" 
(they must be listed in the `docker-compose.yml` too) and that's all!

Now you have full control over jupyter Notebook using Portainer Web UI.

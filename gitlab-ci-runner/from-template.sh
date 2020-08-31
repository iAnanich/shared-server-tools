#!/bin/bash

envsubst '$GITLABCIRUNNER_VOLUME_NAME' > docker-compose.yml < docker-compose.template.yml

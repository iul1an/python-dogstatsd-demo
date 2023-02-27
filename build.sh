#!/bin/bash

set -euo pipefail

DOCKER_IMAGE_NAME=${DOCKER_IMAGE_NAME:=python-dogstatsd-demo}
DOCKER_IMAGE_TAG=${DOCKER_IMAGE_TAG:=$(git rev-parse --short=7 HEAD)}

docker build -t $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG .

docker tag $DOCKER_IMAGE_NAME:$DOCKER_IMAGE_TAG $DOCKER_IMAGE_NAME:latest

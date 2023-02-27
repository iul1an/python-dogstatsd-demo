# python-dogstatsd-demo

## Overview
This project allows testing Kubernetes HPA using DataDog custom metrics.

## Usage
Build container image:
```
$ ./build.sh
```
Run/test container:
```
$ docker run \
	--rm \
	--name python-dogstatsd-demo \
	-e DD_DOGSTATSD_TAGS="environment:dev app:python-dogstatsd-demo" \
	-e DD_AGENT_HOST="10.96.32.22" \
	-p 8080:8080 \
	python-dogstatsd-demo
```

OR
```
$ docker-compose up
```

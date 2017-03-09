# from https://github.com/fchollet/keras/blob/master/docker/Makefile
help:
	@cat Makefile

DATA?="${HOME}/Data"
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker
BACKEND=tensorflow
TEST=tests/
SRC=$(shell dirname `pwd`)

build:
	docker build -t mdp:keras --build-arg python_version=3.5 -f $(DOCKER_FILE) .

bash: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mdp:keras bash

ipython: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mdp:keras ipython

notebook: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --net=host --env KERAS_BACKEND=$(BACKEND) mdp:keras

test: build
	$(DOCKER) run -it -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mdp:keras py.test $(TEST)
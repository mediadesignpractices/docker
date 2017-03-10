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
	docker build -d -t mediadesignpractices:keras -f $(DOCKER_FILE) .

bash:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices:keras bash

ipython:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices:keras ipython

notebook:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --net=host --env KERAS_BACKEND=$(BACKEND) mediadesignpractices:keras

test:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices:keras py.test $(TEST)
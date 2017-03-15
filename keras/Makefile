# from https://github.com/fchollet/keras/blob/master/docker/Makefile
help:
	@cat Makefile

DATA?="${HOME}/Data"
GPU?=0
DOCKER_FILE=Dockerfile
DOCKER=GPU=$(GPU) nvidia-docker
TAG=keras
BACKEND=tensorflow
TEST=../tests/
SRC=$(shell dirname `pwd`)

build:
	docker build -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices/$(TAG) bash

ipython:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices/$(TAG) ipython

notebook:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --net=host --env KERAS_BACKEND=$(BACKEND) mediadesignpractices/$(TAG)

test:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data --env KERAS_BACKEND=$(BACKEND) mediadesignpractices/$(TAG) py.test $(TEST)
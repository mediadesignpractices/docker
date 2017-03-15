help:
	@cat Makefile

DATA?="${HOME}/Data"
TAG?="jupyter"
DOCKER_FILE=Dockerfile
NOTEBOOK_PORT=8888
SRC=$(shell dirname `pwd`)/jupyter

build:
	docker build -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash

ipython:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) ipython

notebook:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data -p $(NOTEBOOK_PORT):8888 mediadesignpractices/$(TAG)

test:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data -p $(NOTEBOOK_PORT):8888 mediadesignpractices/$(TAG) jupyter --version
help:
	@cat Makefile

DATA?="${HOME}/Data"
TAG?=debian
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)

build:
	docker build -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash

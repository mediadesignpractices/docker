help:
	@cat Makefile

DATA?="${HOME}/Data"
TAG?="debian"
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)

build:
	docker build -d -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash

# test:
#	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash -c "jupyter notebook /home/mdp/test/example.ipynb"
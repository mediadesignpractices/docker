help:
	@cat Makefile

DATA?="${HOME}/Data"
TAG?="python"
VERSION="python"
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)

build:
	docker build -d -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash

python:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) $(VERSION)

test:
	docker run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) $(VERSION) --version; $(VERSION) -c "x=5+6; print(x)"; $(VERSION) -c "import string" 
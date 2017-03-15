help:
	@cat Makefile

DATA?="${HOME}/Data"
GPU?=0
TAG=tensorflow
DOCKER=nvidia-docker
NOTEBOOK_PORT=8888
TENSORBOARD_PORT=6006
DOCKER_FILE=Dockerfile
SRC=$(shell dirname `pwd`)

build:
	$(DOCKER) build -t mediadesignpractices/$(TAG) -f $(DOCKER_FILE) .

bash:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) bash

ipython:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) ipython

notebook:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data -p $(NOTEBOOK_PORT):8888 -p $(TENSORBOARD_PORT):6006  mediadesignpractices/$(TAG)

test:
	$(DOCKER) run -it -h mdp -v $(SRC):/src -v $(DATA):/data mediadesignpractices/$(TAG) python3 -c \
	"import tensorflow as tf;\
	hello = tf.constant('Hello, TensorFlow!');\
	sess = tf.Session();\
	print(sess.run(hello))"
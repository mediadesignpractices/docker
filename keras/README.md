# Using Keras via Docker

This directory contains `Dockerfile` to make it easy to get up and running with
Keras via [Docker](http://www.docker.com/).

## Running the container

We are using `Makefile` to simplify docker commands within make commands.

You can [download](https://raw.githubusercontent.com/mediadesignpractices/docker/master/keras/Makefile) the makefile from git.

    # curl -O https://raw.githubusercontent.com/mediadesignpractices/docker/master/keras/Makefile

Build the container and start a jupyter notebook

    $ make notebook

Build the container and start an iPython shell

    $ make ipython

Build the container and start a bash

    $ make bash

For GPU support install NVidia drivers (ideally latest) and
[nvidia-docker](https://github.com/NVIDIA/nvidia-docker). Run using

    $ make notebook GPU=0 # or [ipython, bash]

Switch between Theano and TensorFlow

    $ make notebook BACKEND=theano
    $ make notebook BACKEND=tensorflow

Mount a volume for external data sets

    $ make DATA=~/mydata

Prints all make tasks

    $ make help

You can change Theano parameters by editing `/docker/theanorc`.


Note: If you would have a problem running nvidia-docker you may try the old way
we have used. But it is not recommended. If you find a bug in the nvidia-docker report
it there please and try using the nvidia-docker as described above.

    $ export CUDA_SO=$(\ls /usr/lib/x86_64-linux-gnu/libcuda.* | xargs -I{} echo '-v {}:{}')
    $ export DEVICES=$(\ls /dev/nvidia* | xargs -I{} echo '--device {}:{}')
    $ docker run -it -p 8888:8888 $CUDA_SO $DEVICES gcr.io/tensorflow/tensorflow:latest-gpu
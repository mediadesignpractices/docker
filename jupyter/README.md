# Using Jupyter via Docker

This directory contains `Dockerfile` to make it easy to get up and running with
Jupyter via [Docker](http://www.docker.com/).


## Running the container

We are using `Makefile` to simplify docker commands within make commands.
You can [download](https://raw.githubusercontent.com/mediadesignpractices/docker/master/jupyter/Makefile) the makefile from git.

    # curl -O https://raw.githubusercontent.com/mediadesignpractices/docker/master/jupyter/Makefile

Build the container and start a jupyter notebook

    $ make notebook

Build the container and start an iPython shell

    $ make ipython

Build the container and start a bash

    $ make bash

Mount a volume for external data sets

    $ make DATA=~/mydata notebook

Prints all make tasks

    $ make help
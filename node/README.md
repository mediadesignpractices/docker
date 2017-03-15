# Using Node via Docker

This directory contains `Dockerfile` to make it easy to get up and running with
Node via [Docker](http://www.docker.com/).


## Running the container

We are using `Makefile` to simplify docker commands within make commands.

Build the container and start a bash

    $ make bash

Build the container and start a node shell
*files in local directory are copied in to the container*

    $ make node 'myfile.py'

Mount a volume for external data sets

    $ make DATA=~/mydata node


Prints all make tasks

    $ make help
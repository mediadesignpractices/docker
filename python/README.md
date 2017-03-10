# Using Python via Docker

This directory contains `Dockerfile` to make it easy to get up and running with
Python via [Docker](http://www.docker.com/).


## Running the container

We are using `Makefile` to simplify docker commands within make commands.

Build the container and start a bash

    $ make bash

Build the container and start a python shell
*files in local directory are copied in to the container*

    $ make python 'myfile.py'

Mount a volume for external data sets

    $ make DATA=~/mydata

Prints all make tasks

    $ make help
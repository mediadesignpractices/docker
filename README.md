# MDP Dockerfiles

A few mdp oriented Dockerfiles for getting students up and running quickly.


## What is Docker

Docker is an open-source program that enables a Linux application and its dependencies to be packaged as a container.

Container-based visualization isolates applications from each other on a shared operating system (OS). This approach standardizes application delivery, allowing apps to run in any Linux (or Mac) environment, whether physical or virtual. Because they share the same operating system, containers are portable among different Linux distributions and are significantly smaller than virtual machine (VM) images. 

More importantnly it allows everyone who is working on an application (or workshop) to start with an identical setup.

![What is a Container <from docker.com>](./images/what_is_a_container.png)

## Installing Docker

General installation instructions are
[on the Docker site](https://docs.docker.com/installation/), but here are some
quick links:

* [OSX](https://docs.docker.com/installation/mac/): [docker toolbox](https://www.docker.com/toolbox)
* [ubuntu](https://docs.docker.com/installation/ubuntulinux/)


## Repositiory Structure

The dockerfiles in this repository are structured so that they stack, starting at a base image, then core dependencies, up to higher level applications or libraries. Because of Docker's "Automated Builds"  changes to base images automatically work their way in to images that  have them as a dependency or starting point.

**The structure:**

```

buildpack-deps:jessie
|
|---mediadesignpractices:latest
    |
    |--- mediadesignpractices:python(or python3)
    |   |--- mediadesignpractices:jupyter(or jupyter-python3)
    |       |--- mediadesignpractices (Natural Language Toolkit)
    |
    |--- mediadesignpractices:node


tensorflow/tensorflow:latest-gpu
|
|--- mediadesignpractices:tensorflow
    |___ mediadesignpractices:keras


``` 

Because the majority of MDP students and faculty are prototyping rather than developing applications the images are MDP specific builds that are closer to working in a linux development environment with base tools like nano, vim, git, unzip, wget etc. which help with command line interaction, there are "official" images (which these are based on) that are bare bones and therefore less relevant for prototyping.


## Getting started
** Coming soon **

## Tagging system

The repository follows [semver](http://semver.org/) format.

> Given a version number {MAJOR}.{MINOR}.{PATCH}, increment the:
> 
> 1. MAJOR version when you make incompatible API changes,
> 2. MINOR version when you add functionality in a backwards-compatible manner, and
> 3. PATCH version when you make backwards-compatible bug fixes.
> Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

Because many of the images are related, all images (python, node, jupyter) share the same version numbers. They are not related to the application version `python:v2.7.1` would not be python version `python-v2.7.1`.

If you are building something that requires stability make sure to use a versioned image e.g. `mediadesignpractices/python:v1.0.1` rather than `mediadesignpractices/python` or `mediadesignpractices/python:latest`.
The same goes for anything that is "archival".

## Contributing

Tag changes following semver format, adding a package to mediadesignpractices:latest would constitute a minor version change e.g. `v1.0.1` becomes `v1.0.2`.

Changing node.js from `v6.10.0` to `v7.0.1` would probably constitute a major **breaking** version change, e.g. `v1.0.1` becomes `v2.0.0`.

This is the regualar expression used to validate a release tag:

`^[v]((\d?\d\.)(0\.|[1-9]?[0-9]\.)([1-9]?[0-9]|))$`

You can try it on [regex101](https://regex101.com/r/iR8fS9/5)



**To tag a change:**

```

# add a tag
git tag {tag}

# Move a tag to current commit (for example you just changed the readme), use force.
git tag {tag} -f

# push the tags to github
git push origin {branch} --tags (-f to force)

```

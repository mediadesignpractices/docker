FROM buildpack-deps:jessie
LABEL organization "Media Design Practices"
LABEL maintainer "mediadesignpractices"
LABEL contributor "unsalted"

# Configure environment
ENV DEBIAN_FRONTEND noninteractive
ENV MDP_USER mdp
ENV MDP_UID 1000
ENV WORK_DIR /home/$MDP_USER/data
ENV SHELL /bin/bash
ENV HOME /home/$MDP_USER
ENV LANG C.UTF-8
ENV PYTHON3_VERSION python3.4
ENV PYTHON2_VERSION python2.7

#useful basic packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        git \
        vim \
        jed \
        emacs \
        nano \
        wget \
        cmake \
        rsync \
        locales \
        software-properties-common \
        unzip \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        $PYTHON3_VERSION \
        $PYTHON2_VERSION \
        python-dev \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# generate language files
RUN locale-gen "en_US.UTF-8"
ENV LC_ALL en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Create MDP_UID user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $MDP_UID $MDP_USER && \
    mkdir -p $WORK_DIR && \
    chown $MDP_USER $WORK_DIR

USER $MDP_USER
WORKDIR $WORK_DIR

CMD ["bash"]
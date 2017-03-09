FROM tensorflow/tensorflow:latest-gpu
LABEL maintainer "unsalted"

ENV DEBIAN_FRONTEND noninteractive
ENV MDP_USER mdp
ENV MDP_UID 6000
ENV WORK_DIR /home/$MDP_USER/data
ENV HOME /home/$MDP_USER


RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        vim \
        jed \
        emacs \
        nano \
        wget \
        cmake \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install TensorFlow CPU version from central repo
RUN pip --no-cache-dir install \
    nltk

# Create MDP_UID user with UID=1000 and in the 'users' group
RUN useradd -m -s /bin/bash -N -u $MDP_UID $MDP_USER && \
    mkdir -p $WORK_DIR && \
    chown $MDP_USER $WORK_DIR

USER $MDP_USER
WORKDIR $WORK_DIR

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

CMD ["/run_jupyter.sh"]
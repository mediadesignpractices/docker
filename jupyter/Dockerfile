FROM mdp/python:latest
LABEL organization "Media Design Practices"
LABEL maintainer "mediadesignpractices"
LABEL contributor "unsalted"

USER root
ENV WORK_DIR /home/$MDP_USER/notebooks

RUN apt-get update && apt-get install -yq --no-install-recommends \
        libsm6 \
        pandoc \
        libxrender1 \
        inkscape \
        libav-tools \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# useful basics
RUN pip --no-cache-dir install \
        ipykernel \
        jupyter \
        sklearn \
        ipywidgets \
        && \
    python -m ipykernel.kernelspec

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# IPython
EXPOSE 8888

RUN mkdir -p $WORK_DIR && \
    chown $MDP_USER $WORK_DIR

USER $MDP_USER
WORKDIR $WORK_DIR

CMD ["/run_jupyter.sh"]
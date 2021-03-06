FROM mediadesignpractices/python:latest
LABEL organization "Media Design Practices"
LABEL maintainer "mediadesignpractices"
LABEL contributor "unsalted"

USER root
ENV NOTEBOOK_DIR $HOME/notebooks

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
COPY jupyter_notebook_config.py $HOME/.jupyter/

# IPython
EXPOSE 8888

RUN mkdir -p $NOTEBOOK_DIR \
    && chown $NB_USER $NOTEBOOK_DIR \
    && ln -s $NOTEBOOK_DIR $DATA_DIR/notebooks


USER $NB_USER
WORKDIR $NOTEBOOK_DIR

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
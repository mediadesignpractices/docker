FROM mediadesignpractices/jupyter:latest
LABEL organization "NB"
LABEL maintainer "mdp"
LABEL contributor "unsalted"

USER root

# useful basics
RUN pip --no-cache-dir install \
        nltk

USER $NB_USER
WORKDIR $NOTEBOOK_DIR

# IPython
EXPOSE 8888

CMD ["/run_jupyter.sh"]
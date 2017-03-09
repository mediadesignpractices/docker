FROM mdp:jupyter
USER root
ENV WORK_DIR /home/$MDP_USER/notebooks

# useful basics
RUN pip --no-cache-dir install \
        nltk \
        && \
    python -m ipykernel.kernelspec

USER $MDP_USER
WORKDIR $WORK_DIR

# IPython
EXPOSE 8888

CMD ["/run_jupyter.sh"]
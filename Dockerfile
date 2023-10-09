FROM ubuntu:latest
COPY PYCPD.ipynb .
FROM jupyter/scipy-notebook:cf6258237ff9
ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
# RUN useradd --uid ${NB_UID} ${NB_USER}
# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
# RUN pip install --upgrade pip
RUN git clone https://github.com/siavashk/pycpd.git pycpd
RUN cd pycpd; pip install . 

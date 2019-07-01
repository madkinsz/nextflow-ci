FROM continuumio/miniconda3:4.6.14

# Setup conda environment
COPY envs/linux_env.yml /environment.yml
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /usr/local/envs/nextflow-ci/bin:$PATH

# Setup java (and other nextflow preinstall requirements)
RUN apt-get -y update \
    && apt-get -y install openjdk-8-jdk graphviz realpath curl --no-install-recommends \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $PATH:$JAVA_HOME/bin

# Setup nextflow
SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN curl -fsSL https://github.com/nextflow-io/nextflow/releases/download/v19.05.0-edge/nextflow | bash \
    && mv nextflow /usr/local/bin

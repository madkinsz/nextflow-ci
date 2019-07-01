FROM conda/miniconda3-centos7

# Setup conda environment
COPY envs/linux_env.yml /environment.yml
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /usr/local/envs/nextflow-ci/bin:$PATH

# Setup java (and other nextflow preinstall requirements)
RUN yum -y update && \
    yum -y install java-1.8.0-openjdk graphviz realpath curl which && \
    java -version
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk
ENV PATH $PATH:$JAVA_HOME/bin

# Setup nextflow
RUN curl -fsSL https://github.com/nextflow-io/nextflow/releases/download/v19.05.0-edge/nextflow | bash && \
    mv nextflow /usr/local/bin

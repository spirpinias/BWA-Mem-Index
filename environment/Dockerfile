# hash:sha256:9308260a3fb79dc7f6c079de14692d880bfe4ef3cd11113539a666c25877052c
FROM registry.apps.codeocean.com/codeocean/mambaforge3:22.11.1-4-ubuntu22.04

ARG DEBIAN_FRONTEND=noninteractive

ARG GIT_ASKPASS
ARG GIT_ACCESS_TOKEN
COPY git-askpass /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates=20211016ubuntu0.22.04.1 \
        git=1:2.34.1-1ubuntu1.8 \
        samtools=1.13-4 \
    && rm -rf /var/lib/apt/lists/*

RUN conda install -y --channel=bioconda \
        bwa==0.7.17 \
    && conda clean -ya

RUN pip install -U --no-cache-dir \
    code-ocean-aux-tools==1.1.2

COPY postInstall /
RUN /postInstall

FROM gcr.io/kaggle-gpu-images/python:latest

# install common libraries
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
        git vim tmux build-essential bash-completion sudo chromium-browser
RUN apt-get install -y cuda-drivers

# upgrade conda & pip
RUN conda update -n base conda
RUN conda update --all
RUN pip install --upgrade pip

# install latest cuda
ENV CUDA_HOME="/usr/local/cuda"
ENV PATH="/usr/local/cuda/bin:$PATH"
ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:$LD_LIBRARY_PATH"

# clean up
RUN apt-get install -y python3-pip
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# create user
ARG USER_NAME=kaggle
ARG USER_UID=1000
ARG USER_GID=${USER_UID}

RUN groupadd --force --gid ${USER_GID} ${USER_NAME} && \
    useradd -m -u ${USER_UID} -g ${USER_GID} --shell /bin/bash ${USER_NAME}

# sudoer
RUN echo "${USER_NAME}:${USER_NAME}" | chpasswd && \
    usermod -aG sudo ${USER_NAME} && \
    echo "${USER_NAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# python local dir
RUN mkdir -p /home/kaggle/.local && \
    chown -R ${USER_UID}:${USER_GID} /home/kaggle/.local 
ENV PYTHONUSERBASE "/home/kaggle/.local"


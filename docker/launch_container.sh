#!/bin/bash
IMAGE_NAME=kaggle-docker-updated:latest
CONTAINER_NAME=kaggle-docker-updated-latest

if [ "$(docker image ls -q ${IMAGE_NAME})" == "" ]; then
	docker build --build-arg USER_UID=${UID} -t ${IMAGE_NAME} docker
fi

if [ "$(docker container ls -a -q -f name=${CONTAINER_NAME})" == "" ]; then
    docker create -it --privileged --net=host --gpus=all \
        --volume=/tmp/.X11-unix:/tmp/.X11-unix \
        --volume=${HOME}/.Xauthority:/home/kaggle/.Xauthority \
        --volume=${PWD}:/kaggle \
        --volume=${HOME}/.kaggle:/home/kaggle/.kaggle \
        --env=NOTEBOOK_DISABLE_ROOT=1 \
        --env=DISPLAY=${DISPLAY} \
	--user=kaggle \
        --workdir=/kaggle/working \
        --name=${CONTAINER_NAME} \
        ${IMAGE_NAME} \
        /bin/bash
fi

docker start -i ${CONTAINER_NAME}

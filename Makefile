ZIM_DIR=$(shell pwd)/zim
IMAGE=kiwix/kiwix-serve:latest
NAME=kiwix-serve
PORT=8181

build-arm:
	docker build ./docker/server -t ${IMAGE} --build-arg ARCH="arm32v7/"

run:
	docker run --name ${NAME} -v ${ZIM_DIR}:/data -p ${PORT}:80 ${IMAGE} $(shell ls ${ZIM_DIR})

stop:
	docker stop $(shell docker ps -qf "name=${NAME}")

remove:
	docker rm $(shell docker ps -aqf "name=${NAME}")


ZIM_DIR=$(shell pwd)/zim
IMAGE=kiwix/kiwix-serve:latest
NAME=kiwix-serve
PORT=8181

build-arm:
	docker build ./docker/server -t ${IMAGE} --build-arg ARCH="arm32v7/"

run:
	docker run --restart=always --name ${NAME} -d -v ${ZIM_DIR}:/data -p ${PORT}:80 ${IMAGE} $(shell (ls ${ZIM_DIR}|grep .zim$$))

start:
	docker start ${NAME}

stop:
	docker stop $(NAME)

remove:
	docker rm $(NAME)


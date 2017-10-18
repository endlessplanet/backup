#!/bin/sh

docker volume ls --quiet | while read VOLUME
do
    docker inspect ${VOLUME}
done
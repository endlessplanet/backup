#!/bin/sh

docker \
    container \
    create \
    --interactive \
    --tty \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    backup
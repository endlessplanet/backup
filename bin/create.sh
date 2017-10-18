#!/bin/sh

docker \
    container \
    create \
    --name backup \
    --interactive \
    --tty \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    backup
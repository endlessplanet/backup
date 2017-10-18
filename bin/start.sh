#!/bin/sh

docker \
    container \
    start \
    --interactive \
    --volume /var/run/docker.sock:/var/run/docker.sock:ro \
    backup
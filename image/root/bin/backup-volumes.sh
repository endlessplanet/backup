#!/bin/sh

WORK=$(mktemp -d) &&
    docker volume ls --quiet | head -n 1 | while read VOLUME
    do
        mkdir ${WORK}/${VOLUME} &&
            docker inspect ${VOLUME} > ${WORK}/${VOLUME}/inspect.txt &&
            mkdir ${WORK}/${VOLUME}/content &&
            docker container run --interactive --rm --volume ${VOLUME}:/vol:ro --workdir /vol alpine:3.4 tar --create --file - . | tar --extract --file - --directory ${WORK}/${VOLUME}/content &&
            tar --create --file ${WORK}/${VOLUME}.tar --directory ${WORK}/${VOLUME} . &&
            gzip -9 ${WORK}/${VOLUME}.tar &&
            gpg --encrypt --armor --recipient ${1} --output ${WORK}/${VOLUME}.tar.gz.gpg ${WORK}/${VOLUME}.tar.gz &&
            md5sum ${WORK}/${VOLUME}.tar.gz.gpg > ${WORK}/${VOLUME}.tar.gz.gpg.md5
    done
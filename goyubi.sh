#!/bin/bash
# starts the docker image that can be used to directly speak to yubico smart cards
# only capable of handling one smart card a t a time

YUBI_DEVICEFILE=$(lsusb -d 1050: | sed -e 's/Bus \([0-9][0-9][0-9]\) Device \([0-9][0-9][0-9]\):.*/ dev bus usb \1 \2/g' | tr ' ' '/')

if [ -z "$YUBI_DEVICEFILE" ]; then
    echo "no yubikey found. stopping."
    exit 1
else
    echo -n "building docker image..."
    DOCKER_IMAGE_ID=$(docker build . | grep 'Successfully built' | sed -e 's/[a-zA-Z ]\+\([0-9a-fA-F]\+\)/\1/')
    echo "done"

    echo "running docker with access to yubikey-devicefile $YUBI_DEVICEFILE..."
    docker run -it --privileged -v $YUBI_DEVICEFILE:$YUBI_DEVICEFILE $DOCKER_IMAGE_ID
fi

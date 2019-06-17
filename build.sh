#!/bin/sh -e

build() {
    docker plugin rm -f zimniy/$1 || true
    docker rmi -f rootfsimage || true
    docker build -t rootfsimage $1
    id=$(docker create rootfsimage -h) # id was cd851ce43a403 when the image was created
    rm -rf build/rootfs
    mkdir -p build/rootfs
    docker export "$id" | tar -x -C build/rootfs
    docker rm -vf "$id"
    cp $1/config.json build

    if [ -z "$2" ]
    then
        docker plugin create zimniy/$1 build
    else
        docker plugin create zimniy/$1:$2 build
        docker plugin push zimniy/$1:$2
    fi
}

build glusterfs-volume-plugin

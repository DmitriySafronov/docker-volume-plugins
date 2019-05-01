#!/bin/sh -e
TAG=$1
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
    if [ -z "$TAG" ]
    then
        docker plugin create zimniy/$1 build
    else
        docker plugin create zimniy/$1:$TAG build
        docker plugin push zimniy/$1:$TAG
    fi
}
build glusterfs-volume-plugin
#build cifs-volume-plugin
#build nfs-volume-plugin
#build centos-mounted-volume-plugin

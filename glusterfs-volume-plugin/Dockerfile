FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
    glusterfs-server \
    fuse \
    curl \
    git \
    attr \
    golang && \
    PATH=$PATH:/usr/lib/go/bin && \
    go get github.com/DmitriySafronov/docker-volume-plugins/glusterfs-volume-plugin && \
    mv $HOME/go/bin/glusterfs-volume-plugin / && \
    apt-get remove -q -y \
    git \
    gcc \
    curl \
    golang && \
    apt-get autoremove -q -y && \
    rm -rf $HOME/go /var/lib/apt/lists/* /etc/mtab /var/log/lastlog /var/log/tallylog && \
    apt-get clean all


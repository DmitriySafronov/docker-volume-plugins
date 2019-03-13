FROM debian:stable-backports
RUN apt-get update && apt-get install -y \
    glusterfs-server \
    fuse \
    curl \
    git \
    attr \
    golang-1.11 && \
    PATH=$PATH:/usr/lib/go-1.11/bin && \
    go get github.com/scrunter/docker-volume-plugins/glusterfs-volume-plugin && \
    mv $HOME/go/bin/glusterfs-volume-plugin / && \
    apt-get remove -q -y \
    git \
    gcc \
    curl \
    golang-1.11 && \
    apt-get autoremove -q -y && \
    rm -rf $HOME/go /var/lib/apt/lists/* /etc/mtab /var/log/lastlog /var/log/tallylog && \
    apt-get clean all


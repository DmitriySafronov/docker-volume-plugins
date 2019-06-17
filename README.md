Docker Managed Volume Plugins: GlusterFS
=============================

This project provides managed volume plugins for Docker to connect to [GlusterFS](https://github.com/trajano/docker-volume-plugins/tree/master/glusterfs-volume-plugin).

Along with a generic [CentOS Mounted Volume Plugin](https://github.com/trajano/docker-volume-plugins/tree/master/centos-mounted-volume-plugin) that allows for arbitrary packages to be installed and used by mount.

There are two key labels

* `dev` this is an unstable version primarily used for development testing, do not use it on production.
* `latest` this is the latest version that was built which should be ready for use in production systems.

**There is no robust error handling.  So garbage in -> garbage out**

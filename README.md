# Dockerized h2 database

This repository contains `H2 Database` image from `www.h2database.com`


### Installed versions:

 Latest H2 DB version 1.3.176 (h2-2014-04-05.zip). 

 Works with JBoss EAP 7.0

### Availability

The `Dockerfile` is available in the `master` branch and is built in the Docker HUB as `1000kit/h2:latest`.

### Info

- User `h2` in image is used for execution
- start script: `/opt/h2/bin/h2-start.sh`
- Volume `/opt/h2-data` can be used for persistance
- Ports: `8181` and `1521` are exposed 

## Build Image

Take a Dockerfile and build with the default arguments:

~~~~
$ docker build -t 1000kit/h2 .
~~~~

or simply use the `build.sh` script

## run

### docker
~~~~
$ docker run -it 1000kit/h2
~~~~
Alternative using persistent data:
~~~~
$ docker run -v <host_local_datadir>:/opt/h2-data -it 1000kit/h2
~~~~
### docker-compose
Download `docker-compose.yml` from github. If you need persistence uncomment the volume settings in `docker-compose.yml` file. 

~~~~
$ docker-compose up 
~~~~
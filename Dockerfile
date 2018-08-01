FROM ubuntu:16.04

MAINTAINER Derek Vance, <DACRepair@gmail.com>

RUN apt-get update \
  && apt-get -y install mono-runtime \
  && rm -rf /var/lib/apt/lists/*
  
RUN adduser -D -h /home/container container

USER        container
ENV         HOME=/home/container USER=container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]

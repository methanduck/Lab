FROM ubuntu:latest

MAINTAINER OHEUN_KWON <dhdms6512@gmail.com>


#install sudo , vim
RUN apt-get update && \
    apt-get install -y sudo && \
    apt-get install -y vim && \
    rm -rf /var/lib/apt/lists/*

#run as Sudoered user(Manager)
RUN useradd -ms /bin/bash -G sudo -p manager Manager && \
    echo "Manager ALL = NOPASSWD: /sbin/poweroff, /sbin/start, /sbin/stop" > /etc/sudoers

#install prerequisits
RUN apt-get update && \
    apt-get upgrade && \
    apt install -y git && \
    apt install -y curl && \
    apt install -y docker-compose && \
    apt install -y wget && \
    apt install -y docker.io && \
    apt install -y python && \
    apt install -y tar && \
    apt install -y npm && \
    apt install -y golang-1.9-go && \
    npm install npm@5.6.0 -g && \

    mkdir /home/Manager/prerequisits

    #install fabric
WORKDIR /home/Manager/prerequisits
RUN wget https://github.com/hyperledger/fabric/archive/v1.1.0.tar.gz && \
    tar xzf ./v1.1.0.tar.gz

#Environment setting
RUN mkdir /home/Manager/go
ENV GOPATH=/home/Manager/go
ENV PATH=/usr/lib/go-1.9/bin;$GOPATH/bin:$PATH



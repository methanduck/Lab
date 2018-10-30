#! /bin/bash
echo "!!Installation initiated!!"
apt-get update
apt-get upgrade
echo "########INSTALL : CURL########"
apt-get install curl -y
echo "########INSTALL : GIT########"
apt-get install git -y
echo "########INSTALL : DOCKER-COMPOSE########"
apt-get install docker-compose -y
echo "########INSTALL : DOCKER########"
apt-get install docker -y
echo "########INSTALL : ZOOKEEPER########"
apt-get install zookeeper -y
apt-get update

echo "########INSTALL : GOLANG########"
apt-get install golang-1.9-go -y
CHKER=$(dpkg -l | grep golang-1.9-go)
    if test -n "$CHKER"
    then
        echo "########Go Lang Env setting init########"    
        echo -e "GOPATH (ex: /home/kwon/go) : \c"
        read path
        echo "export GOPATH=$path" >> $HOME/.bashrc
        echo "export PATH=/usr/lib/go-1.9/bin:$GOPATH/bin:$PATH" >> $HOME/.bashrc
    fi
echo "########INSTALL : PYTHON########"
apt-get install python -y

apt-get update
echo "########INSTALL : NODEJS########"
apt-get install nodejs -y
echo "########INSTALL : NPM########"
apt install npm
echo "########INSTALL : NPM VERSION 5.6.0########"
npm install npm@5.6.0 -g

echo "########CHKING INSTALLED PKG########"S

echo "!!!!!!!!PYTHON!!!!!!!!"
python --version
echo "!!!!!!!!GOLANG!!!!!!!!"
go version
echo "!!!!!!!!DOCKER-COMPOSE!!!!!!!!"
docker-compose version
echo "!!!!!!!!DOCKER!!!!!!!!"
docker --version
echo "!!!!!!!!NODE.JS!!!!!!!!"
nodejs -v
echo "!!!!!!!!NPM!!!!!!!!"
npm -v


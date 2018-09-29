#!/bin/bash
echo "########RUNNING CONTAINERS########"
sudo docker stop $(sudo docker ps -aq)
sudo docker container rm $(sudo docker ps -aq)
#!/bin/bash
echo "########RUNNING CONTAINERS########"
containers=$(sudo docker ps -aq)
echo "########STOPPING########"
sudo docker stop ${containers}

containers=$(sudo docker ps -aq)
if [$containers];
then
echo "########CONTAINER REMOVE INIT########"
sudo docker container rm ${containers}
containers=$(sudo docker ps -aq)
    if [!$containers];
    then
    echo "########COMPLETE########"
    fi
else
echo "########COMPLETE########"
fi

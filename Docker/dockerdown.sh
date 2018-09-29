#!/bin/bash
if [$(id -u) -ne 0]
then
    echo "########RUNNING CONTAINERS########"
    containers=$(sudo docker ps -aq)
    if test -n "$containers"
        then
        echo ${containers}
        echo "########STOPPING########"
        sudo docker stop ${containers}
        containers=$(sudo docker ps -aq)
        #if it dosen't completely shutted down
        if test -n "$containers";
        then
        echo "########CONTAINER REMOVE INIT########"
        sudo docker container rm ${containers}
        containers=$(sudo docker ps -aq)
            if test -z "$containers";
            then
            echo "########COMPLETE########"
            fi
        else
        echo "########COMPLETE########"
        fi
        else
        echo "!!!!!!!!NO CONTAINER!!!!!!!!"
    fi
else
    echo "########RUNNING CONTAINERS########"
        containers=$(docker ps -aq)
        if test -n "$containers"
            then
            echo ${containers}
            echo "########STOPPING########"
            docker stop ${containers}
            containers=$(docker ps -aq)
            #if it dosen't completely shutted down
            if test -n "$containers";
            then
            echo "########CONTAINER REMOVE INIT########"
            docker container rm ${containers}
            containers=$(docker ps -aq)
                if test -z "$containers";
                then
                echo "########COMPLETE########"
                fi
            else
            echo "########COMPLETE########"
            fi
            else
            echo "!!!!!!!!NO CONTAINER!!!!!!!!"
        fi
fi
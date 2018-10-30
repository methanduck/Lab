#!/bin/bash
#maintainer KOE
if [ "$(id -u)" -ne 0 ]
then
    echo "!!!!!!!!PLEASE RUN AS ROOT(sudo)!!!!!!!!"
    exit
else
    echo "########RUNNING CONTAINERS########"
        containers=$(docker ps -aq)
        if test -n "$containers";
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

#! /bin/bash

if [ $(id -u) - ne 0 ]
then 
    echo "!!!!!!!!please run as root!!!!!!!!"
else
    for core in {$1...$2}
    do
     echo $3 | sudo tee /sys/devices/system/cpu/cpu$core/online
     done
fi     
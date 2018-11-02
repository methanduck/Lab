#! /bin/bash

if [ $(id -u) -ne 0 ]
then 
    echo "!!!!!!!!please run as root!!!!!!!!"
else
   if [ $# -lt 4 ] 
    then
    count=$1
    while [ $count -le $2 ]  
    do
     echo $3 | sudo tee /sys/devices/system/cpu/cpu$count/online
     echo "CPU CORE $count STATUS : $(sudo cat /sys/devices/system/cpu/cpu$count/online)"
     count=$((count + 1))
     done
   else
     echo "Require 3 Args [start core Num] [End core Num] [Active:1 Deactive:0]"
   fi
fi     

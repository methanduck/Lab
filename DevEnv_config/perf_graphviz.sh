#! /bin/bash
if ["$(id -u)" -ne 0]
then 
    echo "please run as sudo"
else
        if [ $# -eq 0 ]
        then   
            echo -n "Capture time [default:60]"
            read time
            if test -z $time
            then
            time = 60
            perf record -F 99 -a -g -- sleep $time
            else
            perf record -F 99 -a -g -- sleep $time
            fi
        else
            echo -n "Capture time [default:60]"
            read time
            if test -z $time
            then
            time = 60
            perf record -F 99 -p $1 -a -g -- sleep $time
            else
            perf record -F 99 -p $1 -a -g -- sleep $time
            fi
        fi
fi


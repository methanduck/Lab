#! /bin/bash
if [ "$(id -u)" -ne 0 ]
then 
    echo "please run as root(sudo)"
else
    monitor="INSTALLING PERF"
    echo_bot
    apt-get install -y linux-tools-common
    apt-get install -y linux-tools-4.15.0-29-generic
    apt-get install -y linux-cloud-tools-4.15.0-29-generic
    monitor="INSTALLING PYTHON3 AND GRAPHVIZ"
    echo_bot
    apt-get install python3 graphviz
    monitor="INSTALLING PIP"
    echo_bot
    apt-get install -y python-pip
    monitor="INSTALL GPROF2DOT"
    echo_bot
    pip install gprof2dot
fi    

echo_bot()
{
    echo "######## $monitor ########"
}
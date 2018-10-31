#! bin/bash
if ["$(id -u)" -ne 0]
then 
    echo "please run as root(sudo)"
else
    echo "####### INSTALLING PYTHON3 AND GRAPHVIZ ########"
    apt-get install python3 graphviz
    echo "####### INSTALLING PIP ########"
    apt-get install -y python-pip
fi    

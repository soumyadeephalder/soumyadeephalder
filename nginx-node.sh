#!/bin/bash

echo "Start Your Install ....."

if [ "$EUID" == 0 ]
then
    sudo apt install nginx -y

#     echo -ne '#####                     (33%)\r'
    sleep 1
    # node js install version
    cd ~
    curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh

    sudo bash /tmp/nodesource_setup.sh

    sudo apt-get install -y nodejs
    
#     echo -ne '#############             (66%)\r'
    sleep 1
    echo -ne '\n'
    echo -ne '\n'
    echo -ne '\n'
    node -v 
    echo -ne '\n'
    npm -v

    echo "Node Js install done !"

    sudo npm i pm2 -g
#     echo -ne '#######################   (100%)\r'
    echo -ne '\n'
    echo -ne 'Done all install'

    
else
    echo "pls use Sudo OR roon user"
fi
 

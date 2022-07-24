#!/bin/bash

echo "Start Your Install ....."

if [ "$EUID" -ne 0 ]
then
    sudo apt install nginx -y

    echo -ne '#####                     (33%)\r'
    sleep 1
    # node js install version
    cd ~
    curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh

    sudo bash /tmp/nodesource_setup.sh

    sudo apt-get install -y nodejs
    
    echo -ne '#############             (66%)\r'
    sleep 1

    node -v 
    npm -v

    echo "Node Js install done !"

    sudo npm i pm2 -g
    echo -ne '#######################   (100%)\r'
    echo -ne '\n'

    
else
    echo "pls use Sudo OR roon user"
fi
 
#!/usr/bin/env bash

if [ "$EUID" == 0 ]
then
    sudo apt update

    sleep 2

    sudo apt install apache2 -y
    
    sleep 2

    sudo apt install mysql-server -y

    sleep 2


    sudo apt install -y php8.1 libapache2-mod-php
    sudo apt-get install -y php8.1-cli php8.1-json php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

    sleep 2


    sudo chown -R $USER:$USER /var/www/html

    sudo nano /etc/apache2/mods-enabled/dir.conf


else
    echo "pls use Sudo OR roon user"
fi

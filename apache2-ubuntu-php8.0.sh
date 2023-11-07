#!/usr/bin/env bash

if [ "$EUID" == 0 ]
then
    sudo apt update

    sleep 2

    sudo apt install apache2 -y
    
    sleep 2

    sudo apt update
    sudo apt install mysql-server -y

    sleep 2
    
    sudo apt update && apt install -y software-properties-common 
    sudo add-apt-repository ppa:ondrej/php 
    sudo apt update

    sudo apt install -y php8.0 libapache2-mod-php
    sudo apt-get install -y php8.0-cli php8.0-common php8.0-mysql php8.0-zip php8.0-gd php8.0-mbstring php8.0-curl php8.0-xml php8.0-bcmath

    sleep 2


    sudo chown -R $USER:$USER /var/www/html
    
    
    wget https://files.phpmyadmin.net/phpMyAdmin/5.2.0/phpMyAdmin-5.2.0-all-languages.zip
    
    sleep 2
    
    sudo apt install unzip
    
    sleep 2
    
    unzip phpMyAdmin-5.2.0-all-languages.zip
    mv phpMyAdmin-5.2.0-all-languages phpmyadmin
    rm -rf /var/www/html/phpmyadmin
    mv ~/phpmyadmin /var/www/html
    rm -rf phpMyAdmin-5.2.0-all-languages.zip
    
    sudo chown -R $USER:$USER /var/www/html
    sudo phpenmod mbstring
    sudo systemctl restart apache2
    

    sudo nano /etc/apache2/mods-enabled/dir.conf


else
    echo "pls use Sudo OR roon user"
fi

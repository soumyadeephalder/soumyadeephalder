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

    sudo apt install -y php8.1 libapache2-mod-php
    sudo apt-get install -y php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath

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

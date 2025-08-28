#!/bin/bash

# Script simplifié pour installer WordPress
sudo apt update -y
sudo apt install apache2 php php-mysql mysql-client unzip wget -y

cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data:www-data /var/www/html

echo "WordPress installé avec succès."

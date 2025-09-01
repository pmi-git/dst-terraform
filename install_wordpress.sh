#!/bin/bash
set -e

# Variables (elles seront remplacées par Terraform)
DB_NAME="${db_name}"
DB_USER="${db_username}"
DB_PASSWORD="${db_password}"
DB_HOST="${db_host}"

# Mises à jour et paquets
sudo apt update -y
sudo apt install -y apache2 php php-mysql mysql-client unzip wget curl

# Supprimer la page par défaut Apache
sudo rm -f /var/www/html/index.html

# Installer WordPress
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -xzf latest.tar.gz
sudo mv wordpress/* .
sudo rm -rf wordpress latest.tar.gz
sudo chown -R www-data:www-data /var/www/html

# Créer le fichier wp-config.php automatiquement
sudo cp wp-config-sample.php wp-config.php

sudo sed -i "s/database_name_here/$DB_NAME/" wp-config.php
sudo sed -i "s/username_here/$DB_USER/" wp-config.php
sudo sed -i "s/password_here/$DB_PASSWORD/" wp-config.php
sudo sed -i "s/localhost/$DB_HOST/" wp-config.php

# Autoriser les uploads et fixer droits
sudo mkdir -p /var/www/html/wp-content/uploads
sudo chown -R www-data:www-data /var/www/html/wp-content/uploads

echo "✅ WordPress installé et configuré automatiquement !"

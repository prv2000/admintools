#!/bin/bash
# GLPI

# echo "---------------------------------------yum update && yum upgrade----------------------------------------"
# yum update && yum upgrade
# echo "--------------------------------------------yum install mc----------------------------------------------"
# yum install mc
echo "------------------------------------------yum install apache2-------------------------------------------"
yum install httpd
echo "--------------------------------------------yum install php---------------------------------------------"
yum install php
echo "---------------------------------------yum install mariadb-server---------------------------------------"
yum install mariadb-server
# echo "-----------------------------------------yum install phpmyadmin-----------------------------------------"
# yum install phpmyadmin
echo "--------------------------------------------mysql -u root -p--------------------------------------------"
mysql -u root -p -Bse "CREATE DATABASE glpidb;GRANT ALL PRIVILEGES ON glpidb.* TO 'glpiuser'@'localhost' IDENTIFIED BY 'glpipassword';FLUSH PRIVILEGES;"
echo "--------------------------------------------------wget--------------------------------------------------"
wget https://github.com/glpi-project/glpi/releases/download/9.5.7/glpi-9.5.7.tgz
echo "--------------------------------------------------tar---------------------------------------------------"
tar -xvf glpi-9.5.7.tgz
echo "---------------------------------------------------mv---------------------------------------------------"
mv glpi /var/www/html/
echo "-------------------------------------------------chmod--------------------------------------------------"
chmod 755 -R /var/www/html/
echo "-------------------------------------------------chown--------------------------------------------------"
chown www-data:www-data -R /var/www/html/
echo "--------------------------------------------------echo--------------------------------------------------"
echo "<VirtualHost *:80>
     ServerAdmin proschenkov_vm@spb.ckb-rubin.local
     DocumentRoot /var/www/html/glpi
     ServerName glpi.ckb-rubin.local
     <Directory /var/www/html/glpi>
          Options FollowSymlinks
          AllowOverride All
          Require all granted
     </Directory>
     ErrorLog \${APACHE_LOG_DIR}/glpi.ckb-rubin.local_error.log
     CustomLog \${APACHE_LOG_DIR}/glpi.ckb-rubin.local_access.log combined
</VirtualHost>" > /etc/httpd/conf/glpi.conf
# echo "---------------------------------------------------ln---------------------------------------------------"
# ln -s /etc/apache2/sites-available/glpi.conf /etc/apache2/sites-enabled/glpi.conf
# echo "------------------------------------------------a2enmod-------------------------------------------------"
# a2enmod rewrite
echo "-----------------------------------------------systemctl------------------------------------------------"
systemctl restart httpd

# По умолчанию логины / пароли:
#    glpi/glpi для учетной записи администратора
#    tech/tech для технической учетной записи
#    normal/normal для обычной учетной записи
#    post-only/postonly только для подачи заявок
# Вы можете изменить или удалить эти учетные записи.

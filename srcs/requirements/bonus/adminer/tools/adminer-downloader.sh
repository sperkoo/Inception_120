#!bin/bash

wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 

cd /var/www/html

php -S 0.0.0.0:1337
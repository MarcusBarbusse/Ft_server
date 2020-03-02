service mysql restart
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'hbuisser'@'localhost' IDENTIFIED BY 'hbuisser';"
mysql -u root -e "GRANT ALL ON wordpress.* TO 'hbuisser'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"
service nginx start && service php7.3-fpm start && service mysql restart
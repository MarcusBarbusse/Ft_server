# The services will be a WordPress website, phpMyAdmin and MySQL. 
# You will need to make sure your SQL database works with the WordPress and phpMyAdmin.
# Your server should be able to use the SSL protocol

# You will also need to make sure your server is running with an autoindex that must
# be able to be disabled

FROM debian:buster

MAINTAINER Henry Buisseret <hbuisser@student.s19.be>

RUN apt-get update -y \
&& apt update -y \
&& apt-get install sudo -y \
&& apt-get install curl -y \
&& apt-get install wget -y \
&& apt-get clean -y

# ------- Setting up a LEMP stack (Linux, Nginx, MariaDB, and PHP) ----------

# install nginx
RUN apt-get install nginx -y

# install mariadb / système de gestion de base de données. Il s'agit d'un fork communautaire de MySQL
RUN apt-get install mariadb-server mariadb-client -yq

# install php
RUN apt-get install php -yq \
&& apt-get install php-mysql -yq \
&& apt install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -yq \
&& apt install php-json php-mbstring -y

# install phpmyadmin
ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-all-languages.tar.gz ./
RUN	tar -zxzf phpMyAdmin-5.0.1-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.1-all-languages /var/www/html/phpMyAdmin \
	&& rm phpMyAdmin-5.0.1-all-languages.tar.gz \
	&& mkdir /var/www/html/phpMyAdmin/tmp \
	&& chmod 777 /var/www/html/phpMyAdmin/tmp

# install SSL
ADD https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 ./
RUN mv mkcert-v1.1.2-linux-amd64 mkcert \
	&& chmod +x /mkcert && /mkcert -install && /mkcert localhost.com

# install Wordpress
RUN cd /tmp \
&& curl -O https://wordpress.org/latest.tar.gz \
&& tar xzvf latest.tar.gz \
&& cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php \
&& mkdir /var/www/html/wordpress \
&& sudo cp -a /tmp/wordpress/. /var/www/html/wordpress \
&& sudo chown -R www-data:www-data /var/www/
COPY srcs/wp-config.php /var/www/html/wordpress



# Config nginx
ADD /srcs/nginx.conf /etc/nginx/sites-available/
ADD /srcs/nginx.conf /etc/nginx/sites-enabled/

# run html
RUN rm var/www/html/index.html \
	&& rm var/www/html/index.nginx-debian.html
ADD /srcs/index.html /var/www/html/

# Config mariadb
ADD /srcs/mysql_db_config.sh ./

#service start
RUN service nginx start \
&& service php7.3-fpm start \
&& service mysql start

# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute
# 443 c'est le https
EXPOSE 80 443

# placer en dernière ligne pour plus de compréhension
# permet à notre conteneur de savoir quelle commande il doit exécuter lors de son démarrage
#CMD nginx -g "daemon off;"
CMD /bin/bash ./mysql_db_config.sh && sleep infinity & wait

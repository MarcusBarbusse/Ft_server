# The services will be a WordPress website, phpMyAdmin and MySQL. 
# You will need to make sure your SQL database works with the WordPress and phpMyAdmin.
# Your server should be able to use the SSL protocol

# You will also need to make sure your server is running with an autoindex that must
# be able to be disabled

FROM debian:buster

MAINTAINER Henry Buisseret <hbuisser@student.s19.be>

RUN apt-get update -yq \
&& apt-get install sudo -yq \
&& apt-get install curl -yq \
&& apt-get install wget -yq \
&& apt-get clean -y 

# install nginx
RUN apt-get install nginx -yq

# run html
COPY /srcs/nginx.conf /etc/nginx/sites-available
RUN rm /var/www/html/index.nginx-debian.html
COPY ./srcs/index.html .
RUN mv index.html /var/www/html
RUN rm -rf /etc/nginx/sites-available/default 
RUN rm -rf /etc/nginx/sites-enabled/default 
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

# ------- Setting up a LEMP stack (Linux, Nginx, MariaDB, and PHP) ----------

# install mariadb / système de gestion de base de données. Il s'agit d'un fork communautaire de MySQL
RUN apt-get install mariadb-server mariadb-client -yq

# install SSL
RUN wget https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 \
&& mv mkcert-v1.1.2-linux-amd64 mkcert \
&& chmod +x /mkcert && /mkcert -install && /mkcert localhost.com

# install php
Run apt-get install php -yq \
&& sudo apt install apache2 php7.3 libapache2-mod-php7.3 php7.3-common php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-gd php7.3-xml php7.3-intl php7.3-mysql php7.3-cli php7.3-ldap php7.3-zip php7.3-curl -yq \
&& apt-get install php-mysql -yq

# install phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mkdir /var/www/html/phpMyAdmin/tmp \
&& chmod 777 /var/www/html/phpMyAdmin/tmp

# install Wordpress
RUN cd /tmp \
&& curl -LO https://wordpress.org/latest.tar.gz \
&& tar xzvf latest.tar.gz \
&& cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php \
&& sudo chown -R www-data:www-data /var/www/html/* \
&& sudo chmod 755 /var/www/html/*
ADD ./srcs/wp-config.php /tmp/wordpress/
RUN mv /tmp/wordpress /var/www/html/

# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute
# 443 c'est le https
EXPOSE 80 443

# start service
RUN service nginx restart

# placer en dernière ligne pour plus de compréhension
# permet à notre conteneur de savoir quelle commande il doit exécuter lors de son démarrage
CMD nginx -g "daemon off;"



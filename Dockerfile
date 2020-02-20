FROM debian:buster

MAINTAINER Henry Buisseret <hbuisser@student.s19.be>

RUN apt-get update -yq \
&& apt-get install sudo -yq \
&& apt-get clean -y 

# run html

RUN rm /var/www/html/index.nginx-debian.html
COPY ./srcs/index.html .
RUN mv index.html /var/www/html

# Setting up a LEMP stack (Linux, Nginx, MariaDB, and PHP) 

# install nginx
RUN apt-get install nginx -yq

# install mariadb / système de gestion de base de données. Il s'agit d'un fork communautaire de MySQL
RUN apt-get install mariadb-server -yq

# install php
RUN sudo apt install apache2 php7.3 libapache2-mod-php7.3 php7.3-common php7.3-mbstring php7.3-xmlrpc php7.3-soap php7.3-gd php7.3-xml php7.3-intl php7.3-mysql php7.3-cli php7.3-ldap php7.3-zip php7.3-curl -yq \
&& apt-get install php-mysql -yq

# install Wordpress

# install phpmyadmin
#RUN

# install SSL
#RUN 





# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute
# 443 c'est le https
EXPOSE 80 443

# start service
RUN service nginx restart

# placer en dernière ligne pour plus de compréhension
# permet à notre conteneur de savoir quelle commande il doit exécuter lors de son démarrage
CMD nginx -g "daemon off;"



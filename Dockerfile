FROM debian:buster

MAINTAINER Henry Buisseret <hbuisser@student.s19.be>

RUN apt-get update -yq \
&& apt-get clean -y \
#&& apt-get install sudo -yq 

# install nginx

RUN apt-get install nginx -yq

# run html

RUN rm /var/www/html/index.nginx-debian.html
COPY ./srcs/index.html .
RUN mv index.html /var/www/html

# install LAMP



# install php

#RUN apt-get install php -yq \
#&& apt-get install php-mysql -yq \

# install phpmyadmin

#RUN

# install SSL

#RUN 

# install Wordpress

#RUN 


# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute
#EXPOSE 2368

# placer en dernière ligne pour plus de compréhension
# permet à notre conteneur de savoir quelle commande il doit exécuter lors de son démarrage
CMD nginx -g "daemon off;"


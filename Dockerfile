FROM debian:buster

MAINTAINER Henry Buisseret <hbuisser@student.s19.be>

ENV NGINX_VERSION nginx:latest

RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

# install nginx

RUN apt-get install nginx -yq

# install php

RUN apt-get install php -yq \
&& apt-get install php-mysql -yq \

# install phpmyadmin

RUN

# install SSL

RUN 

# install Wordpress

RUN 

# others

ADD . /app/
WORKDIR /app
RUN npm install

# L'instruction EXPOSE permet d'indiquer le port sur lequel votre application écoute
EXPOSE 2368
# L'instruction VOLUME permet d'indiquer quel répertoire vous voulez partager avec votre host.
VOLUME /app/logs
# placer en dernière ligne pour plus de compréhension
# permet à notre conteneur de savoir quelle commande il doit exécuter lors de son démarrage
CMD npm run start

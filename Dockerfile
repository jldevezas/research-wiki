FROM debian:buster-slim

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install wget

RUN wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
RUN tar xvzf dokuwiki-stable.tgz
RUN mkdir -p /var/www/html
RUN mv -v dokuwiki*/* /var/www/html
RUN ls /var/www/html

#COPY ./skeleton /var/www/data/pages
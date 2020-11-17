FROM debian:buster-slim

RUN apt-get update && apt-get -y dist-upgrade
RUN apt-get -y install wget rsync unzip

COPY scripts scripts
COPY skeleton skeleton

CMD scripts/install_dokuwiki.sh
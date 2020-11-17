#!/bin/bash

INSTALL_DIR=/var/www/html

if [ ! -z "$(ls -A ${INSTALL_DIR})" ]
then
    echo "${INSTALL_DIR}: directory is not empty (delete files for a clean install;" \
        "otherwise the current files will be served)"
    exit 0
fi

echo "Performing a clean install of the latest DokuWiki"

wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
tar xvzf dokuwiki-stable.tgz
chown -R www-data:www-data dokuwiki*
chmod -R 0700 dokuwiki*/{data,conf,bin,inc,vendor}
mv dokuwiki*/* /var/www/html
rsync --ignore-existing -a skeleton/* /var/www/html/data/pages
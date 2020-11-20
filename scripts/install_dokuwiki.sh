#!/bin/bash

INSTALL_DIR=/var/www/html

read -d " " PLUGINS << EOF
https://github.com/selfthinker/dokuwiki_plugin_wrap/archive/stable.zip
https://github.com/leibler/dokuwiki-plugin-todo/archive/stable.zip
https://github.com/kn0/dokuwiki_timestamp/zipball/master
https://github.com/dwp-forge/tablewidth/archive/v.2016-10-13.zip
https://github.com/FyiurAmron/sortablejs/zipball/master
https://github.com/michitux/dokuwiki-plugin-saveandedit/zipball/master
https://github.com/dwp-forge/refnotes/archive/v.2020-08-10.zip
https://github.com/ssahara/dw-plugin-NumberedHeadings/archive/master.zip
https://github.com/gturri/nspages/zipball/master
https://github.com/michitux/dokuwiki-plugin-move/zipball/master
https://github.com/liffiton/dokuwiki-plugin-mathjax/archive/master.zip
https://github.com/flammy/imagebox/zipball/master
https://github.com/dokufreaks/plugin-folded/archive/master.zip
https://github.com/cosmocode/edittable/archive/master.zip
https://github.com/splitbrain/dokuwiki-plugin-dw2pdf/zipball/master
https://github.com/dokufreaks/plugin-blockquote/archive/master.zip
https://github.com/tatewake/dokuwiki-plugin-backup/archive/master.zip
https://github.com/mprins/dokuwiki-plugin-backlinks/archive/master.zip
EOF

if [ ! -z "$(ls ${INSTALL_DIR})" ]
then
    echo "${INSTALL_DIR}: directory is not empty (delete files for a clean install;" \
        "otherwise the current files will be served)"
    exit 0
fi

echo "Performing a clean install of the latest DokuWiki"

wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
tar xvzf dokuwiki-stable.tgz
wiki_dir=$(tar tzf dokuwiki-stable.tgz | grep -E '^[^/]+/?$')
rsync --ignore-existing -a skeleton/* ${wiki_dir}/data/pages
cp conf/*.php ${wiki_dir}/conf
mv ${wiki_dir}/* /var/www/html

echo "Installing DokuWiki extensions required for the research wiki"

for plugin in $PLUGINS
do
    wget $plugin -O plugin.zip
    unzip plugin.zip -d /var/www/html/lib/plugins
done

for plugin_info in $(find /var/www/html/lib/plugins -name plugin.info.txt)
do
    plugin_dir=$(dirname $plugin_info)
    new_plugin_dir=$(dirname $plugin_dir)/$(grep "^base" $plugin_info | awk '{ print $2 }')

    if [[ $plugin_dir != $new_plugin_dir ]]
    then
        mv -v $plugin_dir $new_plugin_dir
    fi
done

chown -R www-data:www-data /var/www/html/*
chmod -R 0700 /var/www/html/{data,conf,bin,inc,vendor}
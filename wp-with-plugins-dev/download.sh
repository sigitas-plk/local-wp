#!/bin/bash

wp_plugin_dir=/usr/src/wordpress/wp-content/plugins
file="plugin-list"

# ignore any lines not starting with https
lines=$(cat $file | grep ^https)
if [[ ! -d tmp ]]; then
    mkdir tmp
fi
cd tmp

while IFS= read -r line; do 
    echo "GET $line"
    curl --progress-bar --compressed "$line" -O
done <<<$lines


cp *.zip -t $wp_plugin_dir && cd $wp_plugin_dir

for file in *.zip; do 
    unzip -q "$file"
done

rm -rf akismet *.zip

chown -R www-data:www-data $wp_plugin_dir
chmod -R 777 $wp_plugin_dir
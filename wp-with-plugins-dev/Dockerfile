FROM wordpress:5.5.3-apache

RUN     mkdir /usr/local/get-plugins && \
        cd /usr/local/get-plugins

RUN     set -ex; \
        apt-get update && \
        apt-get install -y curl unzip

COPY    plugin-list download.sh /usr/local/get-plugins/

RUN     cd /usr/local/get-plugins/ && \
        chmod 700 download.sh && bash download.sh

RUN     rm -rf /usr/local/get-plugins /var/cache/apt/*
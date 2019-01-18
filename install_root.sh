#!/bin/bash
#Ment to be run as root after buildout is done. Will obtain cert and install on nginx debian

cd /etc/nginx
ln -s /home/voteit/srv/djurensratt_buildout/etc/nginx.conf ./sites-available/djurensratt.conf
cd sites-enabled
ln -s ../sites-available/djurensratt.conf

service nginx stop
certbot certonly --standalone -d djurensratt.voteit.se
service nginx start

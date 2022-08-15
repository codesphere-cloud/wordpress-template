#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p /tmp/log
mkdir -p /tmp/run

if [ ! -f "/tmp/run/php7.4-fpm.pid" ]; then
    echo "Start PHP FPM Service"
    php-fpm7.4 -y $SCRIPTPATH/php/php-fpm.conf
fi

echo "Start nginx on port 3000"
nginx -c $SCRIPTPATH/nginx.conf -g 'daemon off;'

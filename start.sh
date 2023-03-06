#!/bin/bash

set +e

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p /tmp/log
mkdir -p /tmp/run

export PHPRC=$SCRIPTPATH/php

function stop_php() {
    kill "$(cat /tmp/run/php7.4-fpm.pid)"
    rm /tmp/run/php7.4-fpm.pid
}

if [ -f "/tmp/run/php7.4-fpm.pid" ]; then
    stop_php
fi

echo "Start PHP FPM Service"
php-fpm7.4 -y $SCRIPTPATH/php/php-fpm.conf

trap stop_php EXIT

echo "Start nginx on port 3000"
nginx -c $SCRIPTPATH/nginx/nginx.conf -g 'daemon off;'

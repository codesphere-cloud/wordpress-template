#!/bin/bash

set +e

VERSION="${PHP_VERSION:-7.4}"

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p /tmp/log
mkdir -p /tmp/run

export PHPRC=$SCRIPTPATH/php

function stop_php() {
    kill "$(cat /tmp/run/php-fpm.pid)"
    rm /tmp/run/php-fpm.pid
}

if [ -f "/tmp/run/php-fpm.pid" ]; then
    stop_php
fi

echo "Start PHP FPM Service"
php-fpm${VERSION} -y $SCRIPTPATH/php/php-fpm.conf

trap stop_php EXIT

echo "Start nginx on port 3000"
nginx -c $SCRIPTPATH/nginx/nginx.conf -g 'daemon off;'

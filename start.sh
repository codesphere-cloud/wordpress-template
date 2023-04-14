#!/bin/bash

set +e

VERSION="${PHP_VERSION:-7.4}"

ENABLE_COMMIT_CRON=true

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

mkdir -p /tmp/log
mkdir -p /tmp/run

PHP_PID_FILE="/tmp/run/php-fpm.pid"
COMMIT_PID_FILE="/tmp/run/commit.pid"

export PHPRC=$SCRIPTPATH/php

function stop_php() {
    if [ -f "$PHP_PID_FILE" ]; then
        kill "$(cat $PHP_PID_FILE)"
        rm $PHP_PID_FILE
    fi
}

function stop_commit_cron() {
    if [ -f "$COMMIT_PID_FILE" ]; then
        kill "$(cat $COMMIT_PID_FILE)"
        rm $COMMIT_PID_FILE
    fi
}

function start_commit_cron() {
    echo "Start Commit Cron Service"
    sudo -u admin n install 16.13.2
    $SCRIPTPATH/.backup/cron-commit.js &
    COMMIT_CRON_PID=$!
    echo $COMMIT_CRON_PID > /tmp/run/cron.pid
}

stop_php
stop_commit_cron


echo "Start PHP FPM Service"
php-fpm${VERSION} -y $SCRIPTPATH/php/php-fpm.conf

trap stop_php EXIT

if $ENABLE_COMMIT_CRON then
    start_commit_cron
    trap stop_commit_cron EXIT
fi

echo "Start nginx on port 3000"
nginx -c $SCRIPTPATH/nginx/nginx.conf -g 'daemon off;'

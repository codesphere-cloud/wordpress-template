#!/bin/bash

SCRIPT=$(realpath "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

nginx -c $SCRIPTPATH/nginx.conf -s quit

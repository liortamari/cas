#!/bin/bash

echo "HI"
/usr/local/bin/docker-entrypoint.sh &
tail -F anything
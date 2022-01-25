#!/bin/bash

echo "HI"
cp -rf /etc_cassandra_orig/* /etc/cassandra/
/usr/local/bin/docker-entrypoint.sh &
tail -F anything
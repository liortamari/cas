#!/bin/bash

cp -rf /etc_cassandra_orig/* /etc/cassandra/
echo "starting entrypoint"
/docker-entrypoint.sh
echo "completed entrypoint"
tail -F anything
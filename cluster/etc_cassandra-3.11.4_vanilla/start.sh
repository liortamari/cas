ARG=`hostname -I` sed 's/REPLACE_ADDR/'"${ARG}"'/g' /etc/cassandra/cassandra.yaml
service cassandra start
tail -F anything
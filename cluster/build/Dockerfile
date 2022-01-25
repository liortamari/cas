FROM ubuntu:18.04
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update || echo
RUN apt-get install -y less vim curl wget gnupg2 iproute2 gosu | echo

RUN echo "deb http://www.apache.org/dist/cassandra/debian 311x main" | tee /etc/apt/sources.list.d/cassandra.sources.list
RUN curl curl https://downloads.apache.org/cassandra/KEYS  | apt-key add - && apt-get -y update

RUN apt-get install -y cassandra=3.11.11

ENTRYPOINT ["/start.sh"]

FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns
RUN apt-get update && apt-get install -y pdns-server pdns-backend-sqlite3 && apt-get clean

EXPOSE 53

ADD assets/ /app/
RUN sh /app/init.sh

CMD pdns_server --config-dir=/app



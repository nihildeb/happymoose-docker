FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns
RUN apt-get update && apt-get install -y postfix && apt-get clean

EXPOSE 25


ADD assets/main.cf /etc/postfix/main.cf
ADD assets/virtual /etc/postfix/virtual
RUN postmap /etc/postfix/virtual
CMD service postfix start && tail -f /var/log/*


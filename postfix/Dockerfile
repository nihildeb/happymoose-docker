FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns
RUN apt-get update && apt-get install -y postfix rsyslog supervisor && apt-get clean

EXPOSE 25


ADD assets/main.cf /etc/postfix/main.cf
ADD assets/virtual /etc/postfix/virtual
RUN postmap -o /etc/postfix/virtual
RUN service rsyslog start
CMD service postfix start && tail -f /var/log/mail.log


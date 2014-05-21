FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
	apt-get install -y nginx logrotate && \
	apt-get clean

ADD assets/ /app/
	


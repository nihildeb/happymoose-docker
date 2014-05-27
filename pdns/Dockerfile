FROM base
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns
RUN apt-get update && apt-get install -y pdns-server pdns-backend-pgsql dnsutils && apt-get clean

EXPOSE 53/udp

ADD root/ /
RUN chown root.root /etc/supervisor/conf.d/*.conf

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf


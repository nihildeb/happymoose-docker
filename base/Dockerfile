FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# Keep upstart from complaining
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -fs /bin/true /sbin/initctl

#
# Rsyslog and Supervisor
#
RUN apt-get update && apt-get -y upgrade && apt-get install -y rsyslog supervisor && apt-get clean
RUN sed -i 's/xconsole/console/g' /etc/rsyslog.d/*

ADD root/ /
RUN chown root.root /etc/supervisor/conf.d/*.conf

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

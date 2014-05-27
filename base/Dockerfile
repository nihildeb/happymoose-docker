FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# Keep upstart from complaining
# RUN dpkg-divert --local --rename --add /sbin/initctl
# RUN ln -fs /bin/true /sbin/initctl

#
# Rsyslog and Supervisor
#
RUN apt-get update && apt-get -y upgrade && apt-get install -y rsyslog supervisor vim-tiny openssh-server && apt-get clean
RUN sed -i 's/xconsole/console/g' /etc/rsyslog.d/*

# turn this on next build
#run apt-get install -q -y language-pack-en
#run update-locale LANG=en_US.UTF-8

RUN mkdir /var/run/sshd && mkdir /root/.ssh
ADD id_rsa.pub /root/.ssh/authorized_keys
RUN chmod 0700 /root/.ssh && chmod 0400 /root/.ssh/authorized_keys

# EXPOSE 22

ADD root/ /
RUN chown root.root /etc/supervisor/conf.d/*.conf

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf


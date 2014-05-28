FROM base
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns (syslog-ng because rsyslog/ubuntu is broken)
RUN apt-get update && apt-get install -y postfix syslog-ng-core && apt-get clean

# ubuntu sucks and the ubuntu package maintainers can kiss my ass
# use setperms with with file corrected from here:
# https://bugs.launchpad.net/ubuntu/+source/postfix/+bug/274108
ADD root/ /
RUN /usr/sbin/postfix set-permissions

RUN postmap -o /etc/postfix/virtual
# ec2 keys
RUN postmap hash:/etc/postfix/sasl_passwd
RUN postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt'

EXPOSE 25

CMD ["sh", "-c", "service syslog-ng start ; /usr/sbin/postfix start ; tail -F /var/log/mail.log"]


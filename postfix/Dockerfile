FROM base
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns
RUN apt-get update && apt-get install -y postfix && apt-get clean

# ubuntu sucks and the ubuntu package maintainers can kiss my ass
# https://bugs.launchpad.net/ubuntu/+source/postfix/+bug/274108
# use setperms with with file corrected here:
# https://bugs.launchpad.net/ubuntu/+source/postfix/+bug/274108
ADD root/ /
RUN /usr/sbin/postfix set-permissions

RUN postmap -o /etc/postfix/virtual

EXPOSE 25

CMD ["sh", "-c", "/usr/sbin/postfix start ; tail -F /var/log/mail.log"]


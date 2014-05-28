FROM base
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

# install sqlite pdns (syslog-ng because rsyslog/ubuntu is broken)
RUN apt-get update && apt-get install -y postfix syslog-ng-core && apt-get clean

# ubuntu sucks and the ubuntu package maintainers can kiss my ass
# use setperms with with file corrected from here:
# https://bugs.launchpad.net/ubuntu/+source/postfix/+bug/274108
ADD root/ /

EXPOSE 25

CMD /start.sh


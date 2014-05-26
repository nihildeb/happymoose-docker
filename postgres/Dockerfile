FROM base
MAINTAINER nick@happymoose.com

RUN apt-get update && apt-get install -y wget gpgv2

# install keys and repo for postgres 9.4
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main 9.4' |tee -a /etc/apt/sources.list.d/pgdg.list

# install 9.4
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
  apt-get install -qy postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 logrotate && \
  apt-get clean

# Set the default command to run when starting the container
ADD root/ /
RUN chown root.root /etc/supervisor/conf.d/*.conf
RUN chown -R postgres.postgres /var/run/postgresql

# VOLUME  ["/var/lib/postgresql/9.4/main"]
EXPOSE 5432
EXPOSE 22

CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf

# before first startup, run
# mkdir -p /pg/main
# chown -R postgres.postgres /pg/main
# su - postgres
# /usr/lib/postgresql/9.4/bin/initdb -D /pg/main --encoding UTF-8



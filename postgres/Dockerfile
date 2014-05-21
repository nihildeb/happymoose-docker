FROM ubuntu:14.04
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget gpgv2

# install keys and repo for postgres 9.4
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main 9.4' |tee -a /etc/apt/sources.list.d/pgdg.list

# install 9.4
RUN apt-get update
RUN apt-get install -y postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 logrotate
RUN apt-get clean


# the rest as postgres user
USER postgres

# Create a PostgreSQL role named ``docker`` with ``docker`` as the password and
# then create a database `docker` owned by the ``docker`` role.
# Note: here we use ``&&\`` to run commands one after the other - the ``\``
#       allows the RUN command to span multiple lines.
RUN    /etc/init.d/postgresql start &&\
    psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" &&\
    createdb -O docker docker

# Adjust PostgreSQL configuration so that remote connections to the
# database are possible. 
RUN echo "host all  all    0.0.0.0/0  md5" >> /etc/postgresql/9.4/main/pg_hba.conf

# And add ``listen_addresses`` to ``/etc/postgresql/9.4/main/postgresql.conf``
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.4/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Add VOLUMEs to allow backup of config, logs and databases
VOLUME  ["/etc/postgresql", "/var/log/postgresql", "/var/lib/postgresql"]

# Set the default command to run when starting the container
CMD ["/usr/lib/postgresql/9.4/bin/postgres", "-D", "/var/lib/postgresql/9.4/main", "-c", "config_file=/etc/postgresql/9.4/main/postgresql.conf"]

#ADD assets/ /app/



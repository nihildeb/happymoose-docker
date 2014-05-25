FROM base
MAINTAINER nick@happymoose.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y wget gpgv2

# install keys and repo for postgres 9.4
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN echo 'deb http://apt.postgresql.org/pub/repos/apt/ wheezy-pgdg main 9.4' |tee -a /etc/apt/sources.list.d/pgdg.list

# install 9.4
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
  apt-get install -qy postgresql-client-9.4 curl wget git pgadmin3 && \
  apt-get clean

EXPOSE 22

# CMD su - postgres
#CMD psql -h $DB_PORT_5432_TCP_ADDR -p $DB_PORT_5432_TCP_PORT -U pdns dns



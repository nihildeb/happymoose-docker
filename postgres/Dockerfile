FROM nihildeb/postgres_pre
MAINTAINER nick@happymoose.com

# Set the default command to run when starting the container
ADD root/ /
RUN chown root.root /etc/supervisor/conf.d/*.conf
RUN chown postgres.postgres /var/run/postgresql && chown -R postgres.postgres /etc/postgresql && chown -R postgres.postgres /var/lib/postgresql

#RUN    /etc/init.d/postgresql start &&\
    #psql --command "CREATE USER nihildeb WITH SUPERUSER PASSWORD 'docker';" &&\
        #createdb -O nihildeb docker

#VOLUME  ["/var/lib/postgresql/9.4/main"]
#EXPOSE 5432

#CMD /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf


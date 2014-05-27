#docker run -d --name=pdns01 -p 10.0.0.241:53:53/udp --link pg01:db pdns $@
docker run -d --name=pdns02 -p 10.0.2.85:53:53/udp --link pg01:db pdns $@

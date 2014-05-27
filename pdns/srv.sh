docker run -d --name=pdns -p 53:53/udp --link pg01:db pdns $@

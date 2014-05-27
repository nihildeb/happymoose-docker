docker run -d --name=pdns -P --link pg01:db pdns $@

#!/bin/bash
BALANCER='54.83.38.16'
DOMAINS=('happymoose.com' 'hildebrant.org' 'secropolis.com' 'unixfier.com' 'wickedgrog.com' 'willitping.com' 'opensoundengine.com' 'directfromgermany.com')
HOSTS=(
"localhost:127.0.0.1"
"www:$BALANCER"
"ns1:$BALANCER"
"mail:$BALANCER"
)
for domain in "${DOMAINS[@]}"; do
  echo "INSERT INTO domains (name, type) values ('$domain', 'NATIVE');"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','localhost nick@$domain 1','SOA',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns1.$domain','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns1.twisted4life.com','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','mail.$domain','MX',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','$BALANCER','A',120,NULL);"
  for host in "${HOSTS[@]}"; do
    KEY=${host%%:*}
    VALUE=${host#*:}
    echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$KEY.$domain','$VALUE','A',120,NULL);"
  done
done

#sqlite3 /var/lib/powerdns/pdns.sqlite3 .tables


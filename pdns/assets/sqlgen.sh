#!/bin/bash
BALANCER='54.83.38.16'
DOMAINS=('happymoose.com' 'secropolis.com' 'unixfier.com' 'wickedgrog.com' 'willitping.com' 'opensoundengine.com' 'directfromgermany.com' 'hildebrant.org')
HOSTS=(
"localhost:127.0.0.1"
"test:127.0.0.1"
"www:$BALANCER"
"mail:$BALANCER"
"git:$BALANCER"
)
for domain in "${DOMAINS[@]}"; do
  echo "INSERT INTO domains (name, type) values ('$domain', 'NATIVE');"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','localhost admin@$domain 1','SOA',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns1.willitping.com','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns2.willitping.com','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','mail.$domain','MX',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','$BALANCER','A',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','www.$domain','CNAME',120,NULL);"
  for host in "${HOSTS[@]}"; do
    KEY=${host%%:*}
    VALUE=${host#*:}
    echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$KEY.$domain','$VALUE','A',120,NULL);"
  done
done

echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='willitping.com'),'ns1.willitping.com','$BALANCER','A',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='willitping.com'),'ns2.willitping.com','$BALANCER','A',120,NULL);"

echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'nick.hildebrant.org','nihildeb.github.io','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'*.hildebrant.org','freezing-light-1632.herokuapp.com','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'www.hildebrant.org','ghs.google.com','CNAME',120,NULL);"


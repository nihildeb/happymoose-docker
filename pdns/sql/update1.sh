#!/bin/bash
EC2_IP_1='54.86.18.40'
EC2_IP_2='54.86.66.164'
DOMAINS=('happymoose.com' 'secropolis.com' 'unixfier.com' 'wickedgrog.com' 'willitping.com' 'opensoundengine.com' 'directfromgermany.com' 'gisimple.com')
HOSTS=(
"localhost:127.0.0.1"
"test:127.0.0.1"
"*:$EC2_IP_1"
"www:$EC2_IP_1"
"mail:$EC2_IP_1"
"git:$EC2_IP_1"
"ns1:$EC2_IP_1"
"ns2:$EC2_IP_2"
)

echo "-- DROP all records first"

for domain in "${DOMAINS[@]}"; do
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','localhost admin@$domain 1','SOA',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns1.$domain','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','ns2.$domain','NS',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','mail.$domain','MX',120,NULL);"
  echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','$EC2_IP_1','A',120,NULL);"
  #echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$domain','www.$domain','CNAME',120,NULL);"
  for host in "${HOSTS[@]}"; do
    KEY=${host%%:*}
    VALUE=${host#*:}
    echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='$domain'),'$KEY.$domain','$VALUE','A',120,NULL);"
  done
done

echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='willitping.com'),'ns1.willitping.com','$EC2_IP_1','A',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='willitping.com'),'ns2.willitping.com','$EC2_IP_1','A',120,NULL);"

echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'nick.hildebrant.org','nihildeb.github.io','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'*.hildebrant.org','freezing-light-1632.herokuapp.com','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='hildebrant.org'),'www.hildebrant.org','ghs.google.com','CNAME',120,NULL);"

echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='happymoose.com'),'_amazonses.happymoose.com','OA7DBjxUTHpQIk3cTwKE4WqD95eHYYxMs5aSoO3nlgY=','TXT',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='happymoose.com'),'m5a2bvdencl4mtv2atdlkkpr76kysp3r._domainkey.happymoose.com','m5a2bvdencl4mtv2atdlkkpr76kysp3r.dkim.amazonses.com','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='happymoose.com'),'be75y2ewbszhwwgahdivj4j744xo2dhy._domainkey.happymoose.com','be75y2ewbszhwwgahdivj4j744xo2dhy.dkim.amazonses.com','CNAME',120,NULL);"
echo "INSERT INTO records (domain_id,name,content,type,ttl,prio)VALUES((select id from domains where name='happymoose.com'),'vfdy7lwfsa6r3iamug2twldmw4t5k2ly._domainkey.happymoose.com','vfdy7lwfsa6r3iamug2twldmw4t5k2ly.dkim.amazonses.com','CNAME',120,NULL);"

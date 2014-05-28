#!/bin/bash
set -e

/usr/sbin/postfix set-permissions

postmap -o /etc/postfix/virtual
# ec2 keys
postmap hash:/etc/postfix/sasl_passwd
postconf -e 'smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt'

service syslog-ng start

cp /etc/resolv.conf /var/spool/postfix/etc/
/usr/sbin/postfix start

tail -f /var/log/mail.log

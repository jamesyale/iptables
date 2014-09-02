#!/bin/bash

hosts=(
"ports.putteh.com"
"edge.wildern.hants.sch.uk"
"tribute.wildern.org"
"91.225.19.225"
"217.20.18.49"
"arcadmin.pun.net"
"lightinthedark.dyndns.org"
"90.197.129.222"
"80.3.187.69"
)

for i in "${hosts[@]}"
do
/sbin/iptables -I INPUT -p tcp --dport 80 -s $i -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 443 -s $i -j ACCEPT
done

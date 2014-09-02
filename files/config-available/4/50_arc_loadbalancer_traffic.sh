#!/bin/bash

hosts=(
"5.79.36.144"
"10.190.254.0/24"
)

for i in "${hosts[@]}"
do
/sbin/iptables -I INPUT -p tcp --dport 80 -s $i -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 443 -s $i -j ACCEPT
done

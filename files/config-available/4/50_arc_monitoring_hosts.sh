#!/bin/bash

hosts=(
"85.92.86.205"
"217.20.18.49"
"10.177.15.43"
)

for i in "${hosts[@]}"
do
/sbin/iptables -I INPUT -s $i -p udp --dport 161 -j ACCEPT
/sbin/iptables -I INPUT -s $i -p udp --dport 162 -j ACCEPT
done

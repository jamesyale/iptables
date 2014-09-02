#!/bin/bash

hosts=(
"84.18.193.2"
"84.18.193.3"
"84.18.193.4"
"84.18.193.6"
"164.177.151.217"
"31.222.170.146"
"95.138.183.21"
)

for i in "${hosts[@]}"
do
/sbin/iptables -I INPUT -p all -s $i -j ACCEPT
done

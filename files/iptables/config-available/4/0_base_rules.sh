#!/bin/bash

/sbin/iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/iptables -I INPUT -p all -s 127.0.0.1 -j ACCEPT

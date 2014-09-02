#!/bin/bash

/sbin/ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
/sbin/ip6tables -I INPUT -p all -s 127.0.0.1 -j ACCEPT

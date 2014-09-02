#!/bin/bash

/sbin/iptables -I INPUT -p tcp --dport 1935 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 9123 -j ACCEPT

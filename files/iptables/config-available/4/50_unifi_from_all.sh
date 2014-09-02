#!/bin/bash

/sbin/iptables -I INPUT -p tcp --dport 80 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 443 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8081 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8443 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8880 -j ACCEPT
/sbin/iptables -I INPUT -p tcp --dport 8843 -j ACCEPT

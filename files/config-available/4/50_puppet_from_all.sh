#!/bin/bash

/sbin/iptables -I INPUT -p tcp --dport 8140 -j ACCEPT

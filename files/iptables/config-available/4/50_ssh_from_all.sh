#!/bin/bash

/sbin/iptables -I INPUT -p tcp --dport 22 -j ACCEPT

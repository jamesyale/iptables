#!/bin/bash

/sbin/iptables -I INPUT -p icmp -j ACCEPT

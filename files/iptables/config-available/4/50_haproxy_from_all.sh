#!/bin/bash

/sbin/iptables -I INPUT -p tcp --dport 1936 -j ACCEPT

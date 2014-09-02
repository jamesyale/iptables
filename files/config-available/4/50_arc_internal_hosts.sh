#!/bin/bash

hosts=(
"127.0.0.1"
"10.177.15.43"
"10.177.138.72"
"10.177.129.73"
"10.177.131.73"
"10.177.138.222"
"10.176.192.162"
"10.177.194.41"
"10.177.196.97"
"10.177.192.173"
"192.168.69.20"
"192.168.69.40"
"10.178.132.46"
"10.178.199.235"
"10.178.193.162"
"10.178.195.2"
"10.178.200.40"
"10.178.197.14"
"10.179.2.76"
"192.168.240.0/24"
"192.168.241.0/24"
"10.179.7.166"
"10.179.3.194"
"10.178.201.9"
"10.178.203.216"
"10.178.202.221"
"10.181.64.113"
)


for i in "${hosts[@]}"
do
/sbin/iptables -I INPUT -p all -s $i -j ACCEPT
done
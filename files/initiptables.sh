#!/bin/bash
	
    iptables=`/usr/bin/which iptables`
    ip6tables=`/usr/bin/which ip6tables`

    # we will iterate over this directory and run every script in it
    dir4=`ls /etc/iptables/config-enabled/4/`
    dir6=`ls /etc/iptables/config-enabled/6/`

    # but first, clear the existing iptables rules for a fresh slate
    $iptables -F
    $iptables -X

    $ip6tables -F
    $ip6tables -X

    # now iterate over each enabled config which will populate new iptables rules
    for file in $dir4
#    for file in $dir
    do
            /etc/iptables/config-enabled/4/$file
    done

    for file in $dir6
    do
            /etc/iptables/config-enabled/6/$file
    done

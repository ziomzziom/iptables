#!/bin/bash

#
    chmod +777 packet\ filtring\ iptables.bash

#Delete all existing rules
    iptables -F

#Granting access to the ports that we need
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#Drop traffics to firewall
    iptables -A INPUT -p tcp --dport 80 -j REJECT
    iptables -A INPUT -p tcp --dport 443 -j REJECT

#Allow inbound traffic
#    iptables -A OUTPUT -j ACCEPT

#Deny ping
    iptables -A INPUT -p icmp -j REJECT
#Allow ping
#    iptables -A INPUT -p icmp -j ACCEPT

#Revoke access from everything else
#    iptables -A INPUT -j DROP
#    iptables -A FORWARD -j DROP

#Block access from specific IP Addresses You can block total access from an IP Address using
#    iptables -A INPUT -s IP-ADDRESS -j DROP
#Example
#    iptables -A INPUT -s 87.53.42.120 -j DROP

##How Do I Unblock An IP Address
#    iptables -D INPUT -s xx.xxx.xx.xx -j DROP
#    iptables -D INPUT -s 87.53.42.120 -j DROP

echo "The following rules, strings, packets, and byte counters are currently active:" 
$ipt -t filter -L -v -n --line-numbers 
$ipt -t n at -L -v - - line-numbers 
$ipt -t mangle -L -v --line-numbers

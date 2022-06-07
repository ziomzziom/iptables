#!/bin/bash

#Granting access to the ports that we need
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT

#Allow unband traffic
    iptables -A OUTPUT -j ACCEPT

#Allow ping
    iptables -A INPUT -p icmp -j ACCEPT

#Rewoke access from everything else
    iptables -A INPUT -j DROP
    iptables -A FORWARD -j DROP

#Block access from specific IP Addresses You can block total access from an IP Address using:
#    iptables -A INPUT -s IP-ADDRESS -j DROP
#Example
#    iptables -A INPUT -s 87.53.42.120 -j DROP

##How Do I Unblock An IP Address
#    iptables -D INPUT -s xx.xxx.xx.xx -j DROP
#    iptables -D INPUT -s 87.53.42.120 -j DROP

service iptables save

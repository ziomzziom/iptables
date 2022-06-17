#!/bin/sh
# The program works by removing all rules and setting the default policies to ACCEPT.

echo "The firewall is now being closed. All policies are set to value 
ACCEPT, all rules and chains are removed, all counters are set to
zero value. "


ipt="/sbin/iptables"

# Setting default policies to ACCEPT
    $ipt -p INPUT ACCEPT 
    $ipt -p FORWARD ACCEPT 
    $ipt -p OUTPUT ACCEPT 
    $ipt -t nat -p OUTPUT ACCEPT 
    $ipt -t nat -p PREROUTING ACCEPT 
    $ipt -t nat -p POSTROUTING ACCEPT 
    $ipt -t mangle -p INPUT ACCEPT 
    $ipt -t mangle -p OUTPUT ACCEPT 
    $ipt -t mangle -p FORWARD ACCEPT 
    $ipt -t mangle -p PREROUTING ACCEPT 
    $ipt -t mangle -p POSTROUTING ACCEPT 

# Reset all counters
    $ipt -Z 
    $ipt -t nat -Z 
    $ipt -t mangle -Z

# Remove all rules and chains 
    $ipt -F 
    $ipt -X 
    $ipt -t nat -F 
    $ipt -t nat -X 
    $ipt -t mangle -F 
    $ipt -t mangle -X

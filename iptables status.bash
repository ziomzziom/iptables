#!/bin/sh
# Displaying all active rules and chains

ipt="/sbin/iptables"

echo "The following rules, strings, packets and byte counters are currently active :"

$ipt -t filter -L -v --line-numbers
$ipt -t nat -L -v --line-numbers
$ipt -t mangle -L -v --line-numbers

# -L stands for "display rules", and the --line-numbers option enables the display of line numbers. To display IP addresses instead of hostnames, use the -n option.

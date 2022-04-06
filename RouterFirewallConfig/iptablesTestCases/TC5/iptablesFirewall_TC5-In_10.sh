#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT DROP
${cmd} -P FORWARD DROP
${cmd} -P OUTPUT DROP
${cmd} -A FORWARD -p tcp -s 10.0.2.1/32 -d 30.0.5.2/32 --sport 2000:3000 --dport 0:1000 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.2.1/32 --sport 0:1000 --dport 2000:3000 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.2.2/32 -d 30.0.5.2/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 30.0.5.2/32 -d 10.0.2.2/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.2.3/32 -d 30.0.5.2/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.2.3/32 -d 30.0.5.2/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.2.3/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 30.0.5.2/32 -d 10.0.2.3/32 -j ACCEPT

#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT DROP
${cmd} -P FORWARD DROP
${cmd} -P OUTPUT DROP
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.1/32 --dport 80 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.1/32 --sport 80 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.1/32 --dport 443 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.1/32 --sport 443 -j DROP
${cmd} -A FORWARD -p tcp -s 0.0.0.0/0 -d 30.0.5.1/32 --dport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 0.0.0.0/0 --sport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 0.0.0.0/0 -d 30.0.5.1/32 --dport 443 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 0.0.0.0/0 --sport 443 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.0.0/24 -d 30.0.5.2/32 --dport 587 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.0.0/24 --sport 587 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 10.0.2.4/32 --sport 50000 --dport 53 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.2.4/32 -d 10.0.0.1/32 --sport 53 --dport 50000 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.0.1/32 -d 10.0.2.4/32 --sport 50001 --dport 53 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.2.4/32 -d 10.0.0.1/32 --sport 53 --dport 50001 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 10.0.2.1/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.2.1/32 -d 10.0.0.1/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.0.1/32 -d 10.0.2.1/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.2.1/32 -d 10.0.0.1/32 -j ACCEPT

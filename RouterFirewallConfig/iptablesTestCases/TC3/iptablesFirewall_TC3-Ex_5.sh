#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT ACCEPT
${cmd} -P FORWARD ACCEPT
${cmd} -P OUTPUT ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.0/24 -d 30.0.5.1/32 --dport 443 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.0/24 --sport 443 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.0/24 -d 30.0.5.1/32 --dport 400:500 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.0/24 --sport 400:500 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 30.0.5.1/32 --sport 2000 --dport 80 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.0.1/32 --sport 80 --dport 2000 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 30.0.5.2/32 --sport 2000 --dport 500:600 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.0.1/32 --sport 500:600 --dport 2000 -j DROP

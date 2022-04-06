#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT DROP
${cmd} -P FORWARD DROP
${cmd} -P OUTPUT DROP
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 30.0.5.1/32 --dport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.0.1/32 --sport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 30.0.5.2/32 --dport 500:600 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.0.1/32 --sport 500:600 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.0/24 -d 30.0.5.1/32 --dport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.0/24 --sport 80 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.0/24 -d 30.0.5.1/32 --dport 400:500 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.0/24 --sport 400:500 -j ACCEPT

#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT DROP
${cmd} -P FORWARD DROP
${cmd} -P OUTPUT DROP
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.1/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.1.1/32 -d 30.0.5.1/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.1/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 30.0.5.1/32 -d 10.0.1.1/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.2/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.1.1/32 -d 30.0.5.2/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.1.1/32 -j ACCEPT
${cmd} -A FORWARD -p udp -s 30.0.5.2/32 -d 10.0.1.1/32 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 10.0.2.0/24 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.0.1/32 -d 10.0.2.0/24 -j ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.0.0/24 -j ACCEPT
${cmd} -A FORWARD -p udp -s 10.0.2.0/24 -d 10.0.0.0/24 -j ACCEPT

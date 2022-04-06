#!/bin/sh
cmd="sudo iptables"
${cmd} -F
${cmd} -P INPUT ACCEPT
${cmd} -P FORWARD ACCEPT
${cmd} -P OUTPUT ACCEPT
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.1/32 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.1.1/32 -d 30.0.5.1/32 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.1/32 -d 10.0.1.1/32 -j DROP
${cmd} -A FORWARD -p udp -s 30.0.5.1/32 -d 10.0.1.1/32 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.1.1/32 -d 30.0.5.2/32 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.1.1/32 -d 30.0.5.2/32 -j DROP
${cmd} -A FORWARD -p tcp -s 30.0.5.2/32 -d 10.0.1.1/32 -j DROP
${cmd} -A FORWARD -p udp -s 30.0.5.2/32 -d 10.0.1.1/32 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.0.1/32 -d 10.0.2.0/24 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.0.1/32 -d 10.0.2.0/24 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.0.1/32 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.2.0/24 -d 10.0.0.1/32 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.1.0/24 -d 10.0.2.0/24 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.1.0/24 -d 10.0.2.0/24 -j DROP
${cmd} -A FORWARD -p tcp -s 10.0.2.0/24 -d 10.0.1.0/24 -j DROP
${cmd} -A FORWARD -p udp -s 10.0.2.0/24 -d 10.0.1.0/24 -j DROP

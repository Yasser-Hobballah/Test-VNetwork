FROM alpine:latest
# tcpdump is only for debugging purposes
RUN apk update
RUN apk add iptables sudo
RUN apk add tcpdump
ENV PS1='\h:\w\$ ' 

CMD ["/bin/sh"];

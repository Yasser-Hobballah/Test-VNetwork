FROM alpine:latest

RUN apk update
RUN apk add hping3 --update-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing
ENV PS1='\h:\w\$ '

CMD ["/bin/sh"];

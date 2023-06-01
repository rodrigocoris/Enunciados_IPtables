#!/bin/bash

#enunciado 8

#limpiar reglas
iptables -F
iptables -t nat -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP


iptables -A INPUT -p tcp -i enp3s0 -j ACCEPT
iptables -A FORWARD -p tcp -i enp3s0 -j ACCEPT
iptables -A FORWARD -p tcp -o enp3s0 -j ACCEPT
iptables -A OUTPUT -p tcp -O enp3s0 -j ACCEPT

#http
iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.3:80

#ftp
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 21 -j DNAT --to 10.0.0.2:21

#webdav
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.5:80

iptables -A FORWARD -p tcp -d 10.0.0.3 --dport 80 -j ACCEPT
#iptables -A FORWARD -p tcp -d 10.0.0.2 --dport 80 -j ACCEPT
#iptables -A FORWARD -p tcp -d 10.0.0.5 --dport 80 -j ACCEPT

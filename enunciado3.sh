#!/bin/bash

#limpiar reglas
iptables -F
iptables -t nat -F

#iptables -P INPUT ACCEPT
#iptables -P FORWARD ACCEPT
#iptables -P OUTPUT ACCEPT


#adaptadores wlp2s0 enp3s0

#enunciado3
#http
#iptables -t filter -A INPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A OUTPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A FORWARD -s 192.168.73.52 -j DROP
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.3:80

#ftp
#iptables -t filter -A INPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A OUTPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A FORWARD -s 192.168.73.52 -j DROP
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.2:21

#webdav
#iptables -t filter -A INPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A OUTPUT -s 192.168.73.52 -j DROP
#iptables -t filter -A FORWARD -s 192.168.73.52 -j DROP
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.5:80


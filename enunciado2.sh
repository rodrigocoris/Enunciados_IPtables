#!/bin/bash

#limpiar reglas
iptables -F
iptables -t nat -F

#iptables -P INPUT ACCEPT
#iptables -P FORWARD ACCEPT
#iptables -P OUTPUT ACCEPT



#adaptadores wlp2s0 enp3s0

#enunciado 2
#http
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.3:80

#ftp
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 21 -j DNAT --to 10.0.0.2:21

#webdav
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.5:80




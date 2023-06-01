#!/bin/bash

#Enunciado 7

#limpiar reglas
#iptables -F
#iptables -t nat -F

#iptables -P INPUT ACCEPT
#iptables -P OUTPUT ACCEPT
#iptables -P FORWARD ACCEPT

#iptables -A INPUT -p tcp --dport 22 -j DROP
#iptables -t nat -A PREROUTING -p tcp --dport 5522 -j DNAT --to-destination 10.0.0.3:22

#comando para ejecutar ssh nahomy@192.168.1.33 -p 5522

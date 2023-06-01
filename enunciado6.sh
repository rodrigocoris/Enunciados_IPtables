#!/bin/bash
#limpiar reglas
iptables -F
iptables -t nat -F
#politicas por defecto
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
#levantar adaptadores
ifconfig xenbr0 10.0.0.1 up
#activar forward
echo 1 > /proc/sys/net/ipv4/ip_forward
#reglas esta es la otra interfaz                wlp2s0 enp3s0
iptables -A FORWARD -i xenbr0 -j ACCEPT
iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE


#adaptadores wlp2s0 enp3s0
#enunciado 6
iptables -A INPUT -i enp3s0 -p icmp --icmp-type time-exceeded -j ACCEPT
iptables -A INPUT -i enp3s0 -p icmp --icmp-type echo-reply -j ACCEPT
iptables -A INPUT -i enp3s0 -p icmp -j DROP

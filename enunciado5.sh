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

#enunciado 5

iptables -t nat -A PREROUTING -p tcp -s 192.168.73.52 --dport 80 -j DNAT --to-destination 10.0.0.3:80
#iptables -t nat -A PREROUTING -p tcp -s 192.168.73.52 --dport 21 -j DNAT --to-destination 10.0.0.2:21
#iptables -t nat -A PREROUTING -p tcp -s 192.168.73.52 --dport 80 -j DNAT --to-destination 10.0.0.5:80
#la ip 192.168.73.35 es la ip de la maestra que puedo poner la que se

iptables -t nat -A PREROUTING -p tcp -j DNAT --to 192.168.73.35:80
#lo ultimo es la ip de otro companero

#iptables -t nat -A POSTROUTING -o enp3s0 -j MASQUERADE



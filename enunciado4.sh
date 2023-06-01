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


#enunciado 4
#http
iptables -t filter -A INPUT -s 192.168.73.52 -j ACCEPT
iptables -t filter -A OUTPUT -s 192.168.73.52 -j ACCEPT
iptables -t filter -A FORWARD -s 192.168.73.52 -j ACCEPT
iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.3:80
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#ftp
#iptables -t filter -A INPUT -s 192.168.73.52 -j ACCEPT
#iptables -t filter -A OUTPUT -s 192.168.73.52 -j ACCEPT
#iptables -t filter -A FORWARD -s 192.168.73.52 -j ACCEPT
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.2:21
#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP

#webdav
#iptables -t filter -A INPUT -s 192.168.73.52 -j ACCEPT
#iptables -t filter -A OUTPUT -s 192.168.73.52 -j ACCEPT
#iptables -t filter -A FORWARD -s 192.168.73.52 -j ACCEPT
#iptables -t nat -A PREROUTING -i enp3s0 -p tcp --dport 80 -j DNAT --to 10.0.0.5:80
#iptables -P INPUT DROP
#iptables -P OUTPUT DROP
#iptables -P FORWARD DROP

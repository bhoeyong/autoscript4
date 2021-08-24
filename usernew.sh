#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (days): " Date

IP=$(wget -qO- icanhazip.com);
echo Ping Host
echo Check Access Rights...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Create Account: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$Date days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Service"
echo -e "Account Information WS-SSH & WS-SSL/TLS"
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "IP Server         : $IP"
echo -e "OpenSSH           : 22, 500"
echo -e "WS-SSH            : 80"
echo -e "WS-SSH SSL/TLS    : 443"
echo -e "BadVPN/UDPGW      : 7100, 7200, 7300"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Actil Until      : $exp"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Payload Default WS:"
echo -e "GET / HTTP/1.1[crlf]Host: yourdns.com[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "Before or After Installing this script"
echo -e "Make sure you've converted your VPS IP to DNS"
echo -e ""

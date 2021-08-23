#!/bin/bash

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=$(wget -qO- icanhazip.com);
echo Script AutoCreate Akun SSH dan OpenVPN Mod By TuanYz
sleep 1
echo Ping Host
echo Cek Hak Akses...
sleep 0.5
echo Permission Accepted
clear
sleep 0.5
echo Membuat Akun: $Login
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Thank You For Using Our Service"
echo -e "Account Information WS-SSH & WS-SSL/TLS"
echo -e "Username          : $Login "
echo -e "Password          : $Pass"
echo -e "==============================="
echo -e "IP Server         : $IP"
echo -e ""
echo -e "OpenSSH           : 22, 500"
echo -e "WS-SSH            : 80"
echo -e "WS-SSH SSL/TLS    : 443"
echo -e "BadVPN/UDPGW      : 7100, 7200, 7300"
echo -e "==============================="
echo -e "Actil Until      : $exp"
echo -e "==============================="
echo -e "Payload Default WS:"
echo -e "GET / HTTP/1.1[crlf]Host: $domain[crlf]Connection: Keep-Alive[crlf]User-Agent: [ua][crlf]Upgrade: websocket[crlf][crlf]"
echo -e "Modified by: ノート"

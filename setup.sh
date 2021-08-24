if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);
echo "Checking VPS"
IZIN=$( curl https://raw.githubusercontent.com/darkrenz/myscript1/main/ipvps | grep $MYIP )
if [ $MYIP = $IZIN ]; then
echo -e "${green}Permission Accepted...${NC}"
else
echo -e "${green}Permission Accepted...${NC}"
fi
mkdir /var/lib/premium-script;
wget https://raw.githubusercontent.com/darkrenz/myscript1/main/ssh.sh && chmod +x ssh.sh && screen -S ssh.sh ./ssh.sh
wget https://raw.githubusercontent.com/darkrenz/myscript1/main/websocket-python/websocket.sh && chmod +x websocket.sh && screen -S websocket.sh ./websocket.sh
rm -f /root/ssh.sh
rm -f /root/ipsec.sh
history -c
echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "━━━━━━━━━━━━━━━━━━━━━━━━━🅰🆄🆃🅾🆂🅲🆁🅸🅿🆃 🅿🆁🅴🅼🅸🆄🅼━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕✕" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   🅂🄴🅁🅅🄸🄲🄴 🄰🄽🄳 🄿🄾🅁🅃"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH(Websocket)          : 80"  | tee -a log-install.txt
echo "   - SSL/TLS(WS)             : 443"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   🅂🄴🅁🅅🄴🅁 🄸🄽🄵🄾🅁🄼🄰🅃🄸🄾🄽 & 🄾🅃🄷🄴🅁 🄵🄴🄰🅃🅄🅁🄴🅂"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - Autoreboot              : 00.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━🅼🅾🅳🅸🅵🅸🅴🅳 🅱🆈 🅽🅾🆃🅴━━━━━━━━━━━━━━━━━━━━━━" | tee -a log-install.txt
echo ""
echo " Reboot 10 Sec"
sleep 10
reboot

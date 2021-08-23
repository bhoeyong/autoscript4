#!/bin/bash
clear
echo Installing Websocket-SSH Python
sleep 1
echo Cek Hak Akses...
sleep 0.5
cd
#Buat name user github dan nama folder
GitUser="darkrenz"
namafolder="websocket-python"
#wget https://github.com/${GitUser}/main/${namafolder}/

#Install system auto run
#System OpenSSH Websocket-SSH Python
cd
cd /etc/systemd/system/
wget -O /etc/systemd/system/ws-openssh.service https://raw.githubusercontent.com/${GitUser}/myscript1/main/${namafolder}/ws-openssh.service
#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/${GitUser}/myscript1/main/${namafolder}/ws-stunnel.service

#Install Script Websocket-SSH Python
cd
cd /usr/local/bin/
wget -O /usr/local/bin/ws-openssh https://raw.githubusercontent.com/${GitUser}/myscript1/main/${namafolder}/ws-openssh && chmod +x /home/admin/ws-openssh
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/${GitUser}/myscript1/main/${namafolder}/ws-stunnel && chmod +x /home/admin/ws-stunnel
#
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-openssh
chmod +x /usr/local/bin/ws-openssh
cd
#
cd
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
systemctl enable ws-openssh.service
systemctl start ws-openssh.service
systemctl restart ws-openssh.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

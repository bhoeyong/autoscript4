#!/bin/bash
# Mod By TuanYz
# 
# ==================================================

GitUser=""
#wget https://github.com/${GitUser}/
# initializing var
export DEBIAN_FRONTEND=noninteractive
MYIP=$(wget -qO- ipinfo.io/ip);
MYIP2="s/xxxxxxxxx/$MYIP/g";
NET=$(ip -o $ANU -4 route show to default | awk '{print $5}');
source /etc/os-release
ver=$VERSION_ID

#detail nama perusahaan
country=ID
state=Indonesia
locality=Indonesia
organization=REV
organizationalunit=REV
commonname=REV
email=

# simple password minimal
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/darkrenz/myscript1/main/password"
chmod +x /etc/pam.d/common-password

# go to root
cd

# Edit file /etc/systemd/system/rc-local.service
cat > /etc/systemd/system/rc-local.service <<-END
[Unit]
Description=/etc/rc.local
ConditionPathExists=/etc/rc.local
[Service]
Type=forking
ExecStart=/etc/rc.local start
TimeoutSec=0
StandardOutput=tty
RemainAfterExit=yes
SysVStartPriority=99
[Install]
WantedBy=multi-user.target
END

# nano /etc/rc.local
cat > /etc/rc.local <<-END
#!/bin/sh -e
# rc.local
# By default this script does nothing.
exit 0
END

# Ubah izin akses
chmod +x /etc/rc.local

# enable rc local
systemctl enable rc-local
systemctl start rc-local.service

# disable ipv6
echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
sed -i '$ i\echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6' /etc/rc.local

#update
apt update -y
apt upgrade -y
apt dist-upgrade -y

# install wget and curl
apt -y install wget curl

# set time GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

# set locale
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config

# install
apt-get --reinstall --fix-missing install -y bzip2 gzip coreutils wget screen rsyslog iftop htop net-tools zip unzip wget net-tools curl nano sed screen gnupg gnupg1 bc apt-transport-https build-essential dirmngr libxml-parser-perl neofetch git
echo "clear" >> .profile
echo "neofetch" >> .profile
echo "echo Modified by: PHC NOTE | Type: menu" >> .profile

# install badvpn
cd
wget -O /usr/bin/badvpn-udpgw "https://github.com/${GitUser}/test1/raw/main/badvpn-udpgw64"
chmod +x /usr/bin/badvpn-udpgw
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500' /etc/rc.local
sed -i '$ i\screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500' /etc/rc.local
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

apt-get -y update
# setting port ssh
cd
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g'
# /etc/ssh/sshd_config
sed -i '/Port 22/a Port 500' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 40000' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 51443' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 58080' /etc/ssh/sshd_config
sed -i '/Port 22/a Port 200' /etc/ssh/sshd_config
sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
/etc/init.d/ssh restart

echo "===  install Dropbear ==="
# install dropbear
apt-get -y install dropbear
sed -i 's/NO_START=1/NO_START=0/g' /etc/default/dropbear
sed -i 's/DROPBEAR_PORT=22/DROPBEAR_PORT=143/g' /etc/default/dropbear
sed -i 's/DROPBEAR_EXTRA_ARGS=/DROPBEAR_EXTRA_ARGS="-66 -p 50000 -p 109 -p 77 "/g' /etc/default/dropbear
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells
/etc/init.d/ssh restart
/etc/init.d/dropbear restart

# setting dan install vnstat debian 9 64bit
apt-get -y install vnstat
systemctl start vnstat
systemctl enable vnstat
chkconfig vnstat on
chown -R vnstat:vnstat /var/lib/vnstat

# install stunnel
apt install stunnel4 -y
cat > /etc/stunnel/stunnel.conf <<-END
cert = /etc/stunnel/stunnel.pem
client = no
socket = a:SO_REUSEADDR=1
socket = l:TCP_NODELAY=1
socket = r:TCP_NODELAY=1

[stunnelws]
accept = 443
connect = 700
END

echo "=================  membuat Sertifikat OpenSSL ======================"
echo "========================================================="
#membuat sertifikat
cd /etc/stunnel/
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 1095 \
-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email"
cat key.pem cert.pem >> /etc/stunnel/stunnel.pem
cd
# konfigurasi stunnel
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
cd
/etc/init.d/stunnel4 restart

# banner /etc/issue.net
wget -O /etc/issue.net "https://raw.githubusercontent.com/darkrenz/myscript1/main/banner.conf"
echo "Banner /etc/issue.net" >>/etc/ssh/sshd_config
sed -i 's@DROPBEAR_BANNER=""@DROPBEAR_BANNER="/etc/issue.net"@g' /etc/default/dropbear

# download script
cd /usr/bin
wget -O about "https://raw.githubusercontent.com/darkrenz/myscript1/main/about.sh"
wget -O menu "https://raw.githubusercontent.com/darkrenz/myscript1/main/menu.sh"
wget -O usernew "https://raw.githubusercontent.com/darkrenz/myscript1/main/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/darkrenz/myscript1/main/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/darkrenz/myscript1/main/hapus.sh"
wget -O member "https://raw.githubusercontent.com/darkrenz/myscript1/member.sh"
wget -O delete "https://raw.githubusercontent.com/darkrenz/myscript1/main/delete.sh"
wget -O cek "https://raw.githubusercontent.com/darkrenz/myscript1/main/cek.sh"
wget -O restart "https://raw.githubusercontent.com/darkrenz/myscript1/main/restart.sh"
wget -O speedtest "https://github.com/darkrenz/myscript1/raw/main/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/darkrenz/myscript1/main/info.sh"
wget -O ram "https://raw.githubusercontent.com/darkrenz/myscript1/main/ram.sh"
wget -O renew "https://raw.githubusercontent.com/darkrenz/myscript1/main/renew.sh"
wget -O autokill "https://raw.githubusercontent.com/darkrenz/myscript1/main/autokill.sh"
wget -O clear-log "https://raw.githubusercontent.com/darkrenz/myscript1/main/clear-log.sh"
wget -O banner "https://raw.githubusercontent.com/darkrenz/myscript1/main/banner.sh"

echo "0 5 * * * root clear-log && reboot" >> /etc/crontab

chmod +x menu
chmod +x usernew
chmod +x trial
chmod +x hapus
chmod +x member
chmod +x delete
chmod +x cek
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x autokill
chmod +x tendang
chmod +x ram
chmod +x renew
chmod +x clear-log
chmod +x banner

# remove unnecessary files
apt -y autoclean
apt -y remove --purge unscd
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove bind9*;
apt -y autoremove

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/ssh restart
/etc/init.d/stunnel4 restart
/etc/init.d/vnstat restart
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7100 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7200 --max-clients 500
screen -dmS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 500

history -c
echo "unset HISTFILE" >> /etc/profile

cd
rm -f /root/ssh-vpn.sh

# finihsing
clear
neofetch
netstat -nutlp

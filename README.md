
# Supported
Debian 9 & 10 /
Ubuntu 18 & 20

# Autoscript
Update first:
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot

# Features
Open SSH (NO SQUID)
WEBSOCKET Dropbear (REMOVED)
OVPN WEBSOCKET (REMOVED)

SSH WS Port: 80


SSL WS Port: 443

+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*+*

Install SSH WS / SSL WS:

apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/darkrenz/myscript1/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh

![Remini20210825235602285](https://user-images.githubusercontent.com/30442976/130884577-bf1c6bb5-a039-405c-b08a-218db37b6f08.jpg)


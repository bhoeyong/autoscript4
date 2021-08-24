# Supported
Debian 9 & 10
Ubuntu 18 & 20

# Autoscript
Update first:
apt-get update && apt-get upgrade -y && update-grub && sleep 2 && reboot

Install SSH WS / SSL WS:

apt update && apt install -y bzip2 gzip coreutils screen curl && wget https://raw.githubusercontent.com/darkrenz/myscript1/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh

![IMG_20210824_184225](https://user-images.githubusercontent.com/30442976/130624571-ed4a0a95-cabb-4c88-8fee-2334b060efd9.jpg)


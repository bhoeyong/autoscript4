#!/bin/bash
#Menu
merah="\e[1;31m"
kuning="\e[1;33m"
biru="\e[1;34m"
putih="\e[1;37m"
cyan="\e[1;36m"
clear
echo -e "$putih━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e ".......This Autoscript was modified by note......."
sleep 5
echo -e "$putih━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$merah━━━━━━━━━━━━━━$putih Welcome to my Script $merah━━━━━━━━━━━━━━"
echo -e "$kuning━━━━━━━━━━━━━━Modified: NOTE━━━━━━━━━━━━━━"
echo -e "$merah━━━━━━━━━━━━━━$putih Github: darkrenz $merah━━━━━━━━━━━━━━"
echo -e "$kuning━━━━━━━━━━━━━━M E N U ━━━━━━━━━━━━━━"
echo -e "$putih━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "$kuning━━━━━━━━━━━━━━$kuning OpenSSH & SSH/SSL WS━━━━━━━━━━━━━━━"
echo -e "$merah 1$putih. Create SSH & SSL Account $biru(usernew)"
echo -e "$merah 2$putih. Generate SSH & SSL Trial Account $biru(trial)"
echo -e "$merah 3$putih. Extending SSH & SSL Account Active Life $biru(renew)"
echo -e "$merah 4$putih. Delete SSH & SSL Account $biru(wipeout)"
echo -e "$merah 5$putih. Delete User Expired SSH & OpenVPN $biru(delete)"
echo -e "$merah 6$putih. Set up Autokill SSH $biru(autokill)"
echo -e "$merah 7$putih. Displays Users Who Do Multi Login SSH $biru(ceklim)"
echo -e "$putih━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e 
echo -e "$kuning ━━━━━━━━━━━━━━━━$kuning SYSTEM━━━━━━━━━━━━━━━━"
echo -e "$merah 8$putih.  Restart service SSH/SSL $biru(restart)"
echo -e "$merah 9$putih.  Reboot VPS $biru(reboot)"
echo -e "$merah 10$putih. Speedtest VPS $biru(speedtest)"
echo -e "$merah 11$putih. Display system information $biru(info)"
echo -e "$merah 12$putih. Info script auto install $biru(about)"
echo -e "$merah 13$putih. Customize your banner $biru(banner)"
echo -e 
echo -e ""
echo -e "$cyan To exit the menu press$merah CTRL + C"
echo -e "$putih==============================================================="
read -rp " Please Enter The Number [1-13] : " -e num
if [[ "$num" = "1" ]]; then
usernew
elif [[ "$num" = "2" ]]; then
trial
elif [[ "$num" = "3" ]]; then
renew
elif [[ "$num" = "4" ]]; then
hapus
elif [[ "$num" = "5" ]]; then
delete
elif [[ "$num" = "6" ]]; then
autokill
elif [[ "$num" = "7" ]]; then
ceklim
elif [[ "$num" = "8" ]]; then
restart
elif [[ "$num" = "9" ]]; then
reboot
elif [[ "$num" = "10" ]]; then
speedtest
elif [[ "$num" = "11" ]]; then
info
elif [[ "$num" = "12" ]]; then
about
elif [[ "$num" = "13" ]]; then
banner
echo -e ""
else
clear
menu
fi

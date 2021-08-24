#!/bin/bash
#Menu
merah="\e[1;31m"
kuning="\e[1;33m"
biru="\e[1;34m"
putih="\e[1;37m"
cyan="\e[1;36m"
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[40;1;36m             MENU              \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[44;1;37m           SSH/SSLWS            \E[0m"
echo -e "$merah 1$putih. Create SSH & SSL Account $biru(usernew)"
echo -e "$merah 2$putih. Generate SSH & SSL Trial Account $biru(trial)"
echo -e "$merah 3$putih. Extending SSH & SSL Account Active Life $biru(renew)"
echo -e "$merah 4$putih. Delete SSH & SSL Account $biru(hapus)"
echo -e "$merah 5$putih. Delete User Expired SSH & SSL $biru(delete)"
echo -e "$merah 6$putih. Set up Autokill SSH $biru(autokill)\E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo -e "\E[44;1;37m          SYSTEM NAVIGATOR        \E[0m"
echo -e "$merah 7$putih.  Restart service SSH/SSL $biru(restart)"
echo -e "$merah 8$putih.  Reboot VPS $biru(reboot)"
echo -e "$merah 9$putih.  Speedtest VPS $biru(speedtest)"
echo -e "$merah 10$putih. Display system information $biru(info)"
echo -e "$merah 11$putih. Info script auto install $biru(about)"
echo -e "$merah 12$putih. Customize your banner $biru(banner)"
echo -e ""
echo -rp " To exit the menu press CTRL + C "
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
read -rp " Please Enter The Number [1-12] : " -e num
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
restart
elif [[ "$num" = "8" ]]; then
reboot
elif [[ "$num" = "9" ]]; then
speedtest
elif [[ "$num" = "10" ]]; then
info
elif [[ "$num" = "11" ]]; then
about
elif [[ "$num" = "12" ]]; then
banner
else
clear
menu
fi

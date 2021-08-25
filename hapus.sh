#!/bin/bash
#Script to delete SSH & SSL WS

read -p "SSH username to delete : " User

if getent passwd $Users > /dev/null 2>&1; then
        userdel $Users
        echo -e "User $User has been deleted."
else
        echo -e "FAILED: User $User does not exist."
echo -e ""
read -rp "Press enter to return to Menu..."
menu
exit 0
fi

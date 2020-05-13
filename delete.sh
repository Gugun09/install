#!/bin/bash
#Script to remove SSH & OpenVPN users
echo "-------------------------------" | lolcat
echo "USERNAME          EXP DATE     " | lolcat
echo "-------------------------------" | lolcat
while read expired
do
        AKUN="$(echo $expired | cut -d: -f1)"
        ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
        exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
        if [[ $ID -ge 1000 ]]; then
        printf "%-17s %2s\n" "$AKUN" "$exp" | lolcat
        fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo "-------------------------------" | lolcat
echo "Account number: $JUMLAH user" | lolcat
echo "-------------------------------" | lolcat
echo -e ""

read -p "SSH user name will be deleted : " Users

if getent passwd $Users > /dev/null 2>&1; then
        userdel $Users
        echo -e "User $Users was removed."
else
        echo -e "FAILED: there is no User $Users ." | lolcat
fi

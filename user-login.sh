#!/bin/bash
#
# Script Copyright www.fornesia.com
# Mod by Gugun WD
# ==========================
# 

data=( `ps aux | grep -i dropbear | awk '{print $2}'`);

echo "-----------------------" | lolcat;
echo "Checking Dropbear login" | lolcat;
echo "-----------------------" | lolcat;

for PID in "${data[@]}"
do
	#echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $10}'`;
	IP=`cat /var/log/auth.log | grep -i dropbear | grep -i "Password auth succeeded" | grep "dropbear\[$PID\]" | awk '{print $12}'`;
	if [ $NUM -eq 1 ]; then
		echo "$PID - $USER - $IP";
	fi
done

echo "";

data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

echo "----------------------" | lolcat;
echo "Checking OpenSSH login" | lolcat;
echo "----------------------" | lolcat;

for PID in "${data[@]}"
do
        #echo "check $PID";
	NUM=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | wc -l`;
	USER=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $9}'`;
	IP=`cat /var/log/auth.log | grep -i sshd | grep -i "Accepted password for" | grep "sshd\[$PID\]" | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP" | lolcat;
        fi
done

echo "";
echo "===========================================" | lolcat;
echo " "
if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi

if [ -f "/etc/openvpn/openvpn-status.log" ]; then
	line=`cat /etc/openvpn/openvpn-status.log | wc -l`
	a=$((3+((line-8)/2)))
	b=$(((line-8)/2))
	echo " "
	echo "-----=[ OpenVPN User Login ]=-----" | lolcat;
	echo "Username  |  IP Address  |  Connected Since" | lolcat;
	echo "-------------------------------------" | lolcat;
 	 cat /etc/openvpn/openvpn-status.log | head -n $a | tail -n $b | cut -d "," -f 1,2,5 | sed -e 's/,/   /g' > /tmp/vpn-login-db.txt | lolcat
	 cat /tmp/vpn-login-db.txt | lolcat
fi

echo " "
echo "===========================================" | lolcat;
echo " ";

echo "------------------------------------------------" | lolcat
echo " Multi Login = kill " | lolcat
echo " Cara pakai : kill nomor PID " | lolcat
echo "------------------------------------------------" | lolcat

echo "";

echo " Mod by Gugun WD" | lolcat;

echo "";

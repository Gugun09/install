#!/bin/bash
#Menu
clear
echo "--------------------------- Configuration Setup Server -------------------------" | lolcat
echo "                         Copyright HostingTermurah.net                          " | lolcat
echo "                        https://www.hostingtermurah.net                         " | lolcat
echo "               Created By Nanda Gunawan(fb.com/nanda.convenat)                  " | lolcat
echo "                                Modified by Gugun09                             " | lolcat
echo "--------------------------------------------------------------------------------" | lolcat
	echo " "
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
	echo -e "\e[032;1mCPU Model:\e[0m $cname"
	echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
	echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
	echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
	echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
	echo -e "\e[032;1mSystem Uptime:\e[0m $up"
	echo -e "-----------------------------------------------------"
echo -e "* menu      : Displays a list of available commands" | lolcat
echo -e "* edit      : Edit ports" | lolcat
echo -e "* usernew   : Creating an SSH Account" | lolcat
echo -e "* trial     : Create a Trial Account" | lolcat
echo -e "* delete    : Clearing SSH and OpenVPN Account" | lolcat
echo -e "* cek       : Check User Login" | lolcat
echo -e "* member    : Check Member SSH and OpenVPN" | lolcat
echo -e "* restart   : Restart Service dropbear, webmin" | lolcat
echo -e "              squid3, OpenVPN and SSH" | lolcat
echo -e "* reboot    : reboot VPS" | lolcat
echo -e "* speedtest : speedtest VPS" | lolcat
echo -e "* info      : System Information" | lolcat
echo -e "* about     : Information about auto install script" | lolcat
echo -e "* exit      : exit Putty/Connecbot/" | lolcat
echo -e "              JuiceSSH" | lolcat
echo -e ""

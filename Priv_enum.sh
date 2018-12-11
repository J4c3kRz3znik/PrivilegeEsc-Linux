#!/bin/bash
#Made by J-R
#Inspired by g0tmi1k blog and my own experience
#I made this script 4fun

echo "It is Enumerate script for Security Auditor, Pentesters or anyone who wanna check security. If you look for exploit suggester find another tool Script Kiddie"
echo "I wrote it 4fun but maybe will be helpfull for somebody. It is my first script for privesc, always I wrote command manualy. I will be gratefull for any suggestion."
echo " "
echo " "
echo "Okey Let's start"
echo "Chose Option"
echo "All -> use all options"
echo "OS-check -> check OS version and kernel"
echo "envi -> for environmental variables and printers"
echo "apps -> check apps and services"
echo "config -> check services settings"
echo "SUID_GUID -> advanced linux secure settings"
echo "write -> noowner files, executable folders and witeable folders"
echo "lang -> development tools or languages "
echo "upload -> file transfer options"
echo "nothing -> QUIT"
echo "special -> special message from Me"
read r
echo "Enter Raport Name"
read b

case "$r" in
	"All")
	echo "#####OS and Kernel version#####"
	cat /etc/issue
	cat /etc/*-release
	cat /proc/version
	uname -a
	uname -mrs
	ls /boot | grep vmlinuz-
	dmesg | grep Linux
	echo ""
	echo "#####environmental variables#####"
	cat /etc/profile
	cat /etc/bashrc
	cat ~/.bashrc
	cat ~/.bash_profile
	cat ~/.bash_logout
	lpstat -a
	env
	echo ""
	echo "#####apps and services#####"
	echo "#####SERVICES#####"
	ps aux | grep root
	ps -ef | grep root
	cat /etc/services
	echo "#####Applications#####"
	ls -alh /usr/bin
	ls -alh /sbin/
	echo "check manualy dpkg -l"
	echo "check manualy rpm -qa"
	ls -alh /var/cache/apt/archiver0
	ls -alh /var/cache/yum/
	echo " "
	echo "#####CONFIG#####"
	cat /etc/syslog.conf
	cat /etc/chttp.conf
	cat /etc/lighttpd.conf
	cat /etc/cups/cupsd.conf
	cat /etc/inetd.conf
	cat /etc/apache2/apache2.conf
	cat /etc/my.conf
	cat /etc/httpd/conf/httpd.conf
	cat /opt/lampp/etc/httpd.conf
	ls -aR1 /etc/ | awk '$1 ~ /^.*r.*/'
	echo "who is able to reconfigure a service"
	echo "Anyone"
	ls -aR1 /etc/ | awk '$1 ` /^.*w.*/' 2>/dev/null
	echo "OWNER"
	ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null
	echo "Group"
	ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null
	echo "Other"
	ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null 
	echo "look for password in somefile manualy"
	echo "grep -i user/admin/administrator/username/password/pass [filename]"
	echo "similar command grep -C 5 password [filename]"
	echo ""
	echo "#####SUID_GUID#####"
	echo "##############file running as group##############"
	find / -perm -g=s -type f 2>/dev/null
	echo "##############file running as owner##############"
	find / -perm -u=s -type f 2>/dev/null
	echo "##############starting as root!!!!!##############"
	find / -perm -g=s -o -perm -4000 ! -type 1 -maxdepth 3 -exec 		ls -ld {} \; 2>/dev/null
	echo "Easy wins:"	
	echo " nmap --interactive step2: !sh"
	echo "vim.tiny
	# Press ESC key
	:set shell=/bin/sh
	:shell "
	echo "find test -exec whoami \; "
	echo "bash -p"
	echo "sudo more /etc/passwd !/bin/sh"
	echo "less /etc/passwd !/bin/sh"
	echo "nano"
	echo "cp"
	echo "exim"
	echo "pulseaudio"
	echo "#####word-writeable folders#####"
	find / -writable -type d 2>/dev/null
	echo "#####executable folders#####"
	find / -perm -o x -type d 2>/dev/null
	echo "#####noower files#####"
	find / -xdev \( -nouser -o -nogroup \) -print
	echo "#####development tools or languages#####"
	find / -name perl
	find / -name python
	find / -name ruby
	find / -name gcc
	find / -name cc
	echo "#####UPLOAD#####"
	find / -name wget
	find / -name nc
	find / -name netcat
	find / -name ncat
	find / -name tftp
	find / -name ftp
	echo "#####SPECIAL#####"
	echo "check https://www.hackersforcharity.org/"
	echo "Take off your hat, and help children Bro!"
	;;
	"OS-check")
	cat /etc/issue
	cat /etc/*-release
	cat /proc/version
	uname -a
	uname -mrs
	ls /boot | grep vmlinuz-
	dmesg | grep Linux
	;;
	"envi")
	cat /etc/profile
	cat /etc/bashrc
	cat ~/.bashrc
	cat ~/.bash_profile
	cat ~/.bash_logout
	lpstat -a
	env
	;;
	"apps")
	echo "#####SERVICES#####"
	ps aux | grep root
	ps -ef | grep root
	cat /etc/services
	echo "#####Applications#####"
	ls -alh /usr/bin
	ls -alh /sbin/
	echo "check dpkginfo.txt"
	dpkg -l > dpkginfo.txt
	echo "check rpminfo.txt"
	rpm -qa > rpminfo.txt
	ls -alh /var/cache/apt/archiver0
	ls -alh /var/cache/yum/
	;;
	"config")
	cat /etc/syslog.conf
	cat /etc/chttp.conf
	cat /etc/lighttpd.conf
	cat /etc/cups/cupsd.conf
	cat /etc/inetd.conf
	cat /etc/apache2/apache2.conf
	cat /etc/my.conf
	cat /etc/httpd/conf/httpd.conf
	cat /opt/lampp/etc/httpd.conf
	ls -aR1 /etc/ | awk '$1 ~ /^.*r.*/'
	echo "who is able to reconfigure a service"
	echo "Anyone"
	ls -aR1 /etc/ | awk '$1 ` /^.*w.*/' 2>/dev/null
	echo "OWNER"
	ls -aRl /etc/ | awk '$1 ~ /^..w/' 2>/dev/null
	echo "Group"
	ls -aRl /etc/ | awk '$1 ~ /^.....w/' 2>/dev/null
	echo "Other"
	ls -aRl /etc/ | awk '$1 ~ /w.$/' 2>/dev/null 
	echo "look for password in somefile manualy"
	echo "grep -i user/admin/administrator/username/password/pass [filename]"
	echo "similar command grep -C 5 password [filename]"
	;;
	"SUID_GUID")
	echo "##############file running as group##############"
	find / -perm -g=s -type f 2>/dev/null
	echo "##############file running as owner##############"
	find / -perm -u=s -type f 2>/dev/null
	echo "##############starting as root!!!!!##############"
	find / -perm -g=s -o -perm -4000 ! -type 1 -maxdepth 3 -exec ls -ld {} \; 2>/dev/null
	;;
	"write")
	echo "word-writeable folders"
	find / -writable -type d 2>/dev/null
	echo "executable folders"
	find / -perm -o x -type d 2>/dev/null
	echo "noower files"
	find / -xdev \( -nouser -o -nogroup \) -print
		echo "Easy wins:"	
	echo " nmap --interactive step2: !sh"
	echo "vim.tiny
	# Press ESC key
	:set shell=/bin/sh
	:shell "
	echo "find test -exec whoami \; "
	echo "bash -p"
	echo "sudo more /etc/passwd !/bin/sh"
	echo "less /etc/passwd !/bin/sh"
	echo "nano"
	echo "cp"
	echo "exim"
	echo "pulseaudio"
	;;
	"lang")
	find / -name perl
	find / -name python
	find / -name ruby
	find / -name gcc
	find / -name cc

	;;
	"upload")
	find / -name wget
	find / -name nc
	find / -name netcat
	find / -name ncat
	find / -name tftp
	find / -name ftp

	;;
	"nothing")
	
	;;
	"special")
	echo "check https://www.hackersforcharity.org/"
	echo "Take off your hat, and help children Bro!"
	;;
	*) echo "OMG you broke the system, GOT r00t... I'm kidding"
esac > $b

echo "Have a nice day"

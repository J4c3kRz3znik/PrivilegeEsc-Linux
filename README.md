# PrivilegeEsc-Linux
It is a simple script who can help Security Auditor, Pentesters or anyone who wanna check security for unix server.
I used it for OSCP course, and it's work well. It is only enumerate script, not a exploit suggester, so you can't get a false positive. 
If you use Web-shell or non interactive reverse shell is low chance to crash this.
To use this script you need to copy it on writable directory. To find it you can use a simply command

find / -writable -type d 2>/dev/null 

This script after execute save raport with results. In first step you need to chose the one of options

All -> use all options
OS-check -> check OS version and kernel
envi -> for environmental variables and printers
apps -> check apps and services
config -> check services settings
SUID_GUID -> advanced linux secure settings
write -> noowner files, executable folders and witeable folders
lang -> development tools or languages 
upload -> file transfer options
nothing -> QUIT
special -> special message

In second step you need to write a name of raport.

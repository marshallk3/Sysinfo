@echo off
rem ************************************
rem * Author : MarshallK 2020
rem * Title  : System Information Extractor
rem * Licence: Open Source MIT 
rem * 
rem * https://github.com/marshallk3/Sysinfo
rem ************************************

rem #########################

rem SET CurrentDir=%~dp0
set CurrentDir=%cd%
set Loot=%CurrentDir%\loot\
echo Save locations:
echo --------------------------------
echo Current: %CurrentDir%
echo Loot   : %Loot%
echo --------------------------------
rem #########################

mkdir %Loot%

rem #########################

rem System Information
echo System Information

systeminfo > %Loot%systeminfo.txt
ipconfig  > %Loot%ipconfig.txt
ipconfig /all > %Loot%ipconfig-all.txt
tasklist > %Loot%tasklist.txt
msinfo32 /nfo %Loot%msinfo32.nfo
net share > %Loot%net-share.txt

rem #########################

rem Active Directory Information
echo Active Directory Information

gpresult /h %Loot%gpresult.html

rem #########################

rem Group Information
echo Group Information

net group "Domain Admins" /domain > %Loot%domain-admin.txt
net group "Domain Users" /domain > %Loot%domain-users.txt
net group /domain > %Loot%net-group-all.txt

rem #########################

rem User Information
echo User Information
net user /domain %username% > %Loot%net_user_domain-%username%.txt
net user > %Loot%net-users.txt

rem #########################

rem Network Information
echo Network Information

net view  > %Loot%net-view.txt
hostname > %Loot%hostname.txt
netstat -aenors > %Loot%netstat-all.txt
netstat -ano > %Loot%netstat-ano.txt
netstat -ao > %Loot%netstat-ao.txt
tracert 1.1.1.1 > %Loot%tracert.txt
nslookup /exit > %Loot%nslookup.txt 
nslookup myip.opendns.com. resolver1.opendns.com > %Loot%PublicIP.txt 

rem #########################

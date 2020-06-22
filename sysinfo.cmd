rem ************************************
rem * Author : MarshallK 2020
rem * Title  : System Information Extractor
rem * Licence: Open Source MIT 
rem * 
rem * 
rem ************************************
@echo off
rem #########################

rem SET CurrentDir=%~dp0
set CurrentDir=%cd%
set Loot=%CurrentDir%\loot\
echo Current save location:
echo %CurrentDir%
echo %Loot%
echo --------------------------------
rem #########################

mkdir %Loot%

rem #########################

rem System Information
echo System Information

systeminfo > %Loot%systeminfo.txt
ipconfig > %Loot%ipconfig.txt
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
net group /domain > %Loot%net-group.txt

rem #########################

rem User Information
echo User Information
net user /domain %username% > %Loot%net-%username%.txt
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

rem #########################
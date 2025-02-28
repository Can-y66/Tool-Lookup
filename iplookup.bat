Source here
@echo off
chcp 65001
title Ip Lookup Tool - Can
color 4
:menu
cls
echo  ██╗      ██████╗  ██████╗ ██╗  ██╗██╗   ██╗██████╗     ████████╗ ██████╗  ██████╗ ██╗     
echo  ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝██║   ██║██╔══██╗    ╚══██╔══╝██╔═══██╗██╔═══██╗██║     
echo  ██║     ██║   ██║██║   ██║█████╔╝ ██║   ██║██████╔╝       ██║   ██║   ██║██║   ██║██║     
echo  ██║     ██║   ██║██║   ██║██╔═██╗ ██║   ██║██╔═══╝        ██║   ██║   ██║██║   ██║██║     
echo  ███████╗╚██████╔╝╚██████╔╝██║  ██╗╚██████╔╝██║            ██║   ╚██████╔╝╚██████╔╝███████╗
echo  ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝ ╚═╝            ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝
echo =================================================
echo 1) Exit
echo 2) Ip Geo Lookup
echo 3) Back To Main Menu
echo ================================================
set /p choice=Enter your choice:

if "%choice&"=="" goto menu
if "%choice&"=="1" goto end
if "%choice&"=="2" goto ip_geo_lookup
if "%choice&"=="3" goto menu

:ip_geo_lookup
cls
echo ███████╗███╗   ██╗████████╗███████╗██████╗     ██╗██████╗ 
echo ██╔════╝████╗  ██║╚══██╔══╝██╔════╝██╔══██╗    ██║██╔══██╗
echo █████╗  ██╔██╗ ██║   ██║   █████╗  ██████╔╝    ██║██████╔╝
echo ██╔══╝  ██║╚██╗██║   ██║   ██╔══╝  ██╔══██╗    ██║██╔═══╝ 
echo ███████╗██║ ╚████║   ██║   ███████╗██║  ██║    ██║██║     
echo ╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    ╚═╝╚═╝
echo. ================================================
echo Enter An IP address to lookup (or type back to return to the main menu):
set /p ip=
if "%ip%"=="back" goto menu

curl "https://ipinfo.io/%ip%/json" -o geolocation.json
echo ==================================
echo IP Geolocation for &`%ip%:
type geolocation.json
del gelocation.json
echo =================================
pause
goto ip_geo_lookup

:end

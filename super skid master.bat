@echo off
mode 200 200


REM                                          SETUP





color 
mode con cols=80 lines=40
chcp 65001 >nul
cls

CALL :LOGO
pause >nul



















REM           					LOGO

:home
:LOGO
echo 	        [96m═══════════════════════════════════[0m
echo			[95m███╗   ██╗ █████╗ ████████╗ ██████╗[0m 
echo			[96m████╗  ██║██╔══██╗╚══██╔══╝██╔═══██╗[0m
echo			[95m██╔██╗ ██║███████║   ██║   ██║   ██║[0m
echo			[96m██║╚██╗██║██╔══██║   ██║   ██║   ██║[0m
echo			[95m██║ ╚████║██║  ██║   ██║   ╚██████╔╝[0m
echo			[96m╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝    ╚═════╝[0m 
echo 		 [96m ═════════╗           ╔═══════
echo 			[96m   ║+netw-menu+║[0m             
echo 			[96m   ╚═══════════╝[0m
title nato hacking tool by: devtools-rar
setlocal
:menu
echo  Nato net - A Network Multi-Tool by = devtools-rar
echo  ---------------------------------------------------
echo  1. Scan a network range
echo  2. Resolve a domain to IP
echo  3. Ping a host
echo  4. Find the BSSID of a device
echo  5. Exit
echo.
set /p choice=Enter your choice: 

if %choice%==1 goto scan
if %choice%==2 goto resolve
if %choice%==3 goto ping
if %choice%==4 goto bssid
if %choice%==5 goto exit

:scan
set /p range=Enter the network range to scan (e.g., 192.168.1.0/24): 
for /l %%I in (1,1,254) do (
    ping -n 1 %range%.%%I >nul
    if %errorlevel%==0 echo %range%.%%I is online
)
pause
goto menu

:resolve
set /p domain=Enter the domain to resolve: 
for /f "tokens=2 delims=:" %%I in ('nslookup %domain% ^| find "Address" ^| find /v "Aliases"') do (
    echo %domain% resolves to: %%I
)
pause
goto menu

:ping
set /p host=Enter the host to ping: 
ping %host%
pause
goto menu

:bssid
set /p ip=Enter the IP address to find the BSSID: 
arp -a %ip%
pause
goto menu

:exit
exit /b 0
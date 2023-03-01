@echo off
title Moth Firewall Manager
:start
cls
echo.
echo   __    __     ______     ______   __  __    
echo  /\ "-./  \   /\  __ \   /\__  _\ /\ \_\ \   
echo  \ \ \-./\ \  \ \ \/\ \  \/_/\ \/ \ \  __ \  
echo   \ \_\ \ \_\  \ \_____\    \ \_\  \ \_\ \_\ 
echo    \/_/  \/_/   \/_____/     \/_/   \/_/\/_/                                            
echo.
echo.
IF NOT EXIST %SYSTEMROOT%\SYSTEM32\WDI\LOGFILES GOTO adminRequired
echo Please select an option:
echo.
echo press 1. To add Moth Firewall Rules / druecke 1. um Firewall Regeln zu installieren
echo press 2. To Remove Moth Firewall Rules / druecke 2. um Firewall Regeln zu loeschen
echo press 3. To Exit / druecke 3. um abzubrechen
echo.
set /p option=: 
if %option%==1 goto add
if %option%==2 goto remove
if %option%==3 goto exit
echo.
echo Invalid option. Please try again.
timeout /t 2 /nobreak >nul
goto start

:adminRequired
echo.
echo This script requires administrative privileges.
echo Please run this script as an administrator.
echo.
timeout /t 2 /nobreak >nul
exit

:add
netsh advfirewall firewall add rule name="TxAdmin-40120-TCP" dir=in action=allow protocol=TCP localport=40120
netsh advfirewall firewall add rule name="TxAdmin-40120-UDP" dir=in action=allow protocol=UDP localport=40120
netsh advfirewall firewall add rule name="FiveM-30120-TCP" dir=in action=allow protocol=TCP localport=30120
netsh advfirewall firewall add rule name="FiveM-30120-UDP" dir=in action=allow protocol=UDP localport=30120
goto start

:remove
netsh advfirewall firewall delete rule name="TxAdmin-40120-TCP" dir=in protocol=TCP localport=40120
netsh advfirewall firewall delete rule name="TxAdmin-40120-UDP" dir=in protocol=UDP localport=40120
netsh advfirewall firewall delete rule name="FiveM-30120-TCP" dir=in protocol=TCP localport=30120
netsh advfirewall firewall delete rule name="FiveM-30120-UDP" dir=in protocol=UDP localport=30120
goto start

:exit
echo.
echo Exiting...
timeout /t 1 /nobreak >nul
exit

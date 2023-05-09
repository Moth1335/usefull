@echo off
title Moth Firewall Manager
:start
cls
echo.
echo  __   __     ______     ______   ______     ______    
echo /\ "-.\ \   /\  ___\   /\__  _\ /\  ___\   /\  __ \   
echo \ \ \-.  \  \ \  __\   \/_/\ \/ \ \ \__ \  \ \ \/\ \  
echo  \ \_\\"\_\  \ \_____\    \ \_\  \ \_____\  \ \_____\ 
echo   \/_/ \/_/   \/_____/     \/_/   \/_____/   \/_____/                                            
echo.
echo.
IF NOT EXIST %SYSTEMROOT%\SYSTEM32\WDI\LOGFILES GOTO adminRequired
echo Please select an option:
echo.
echo Druecke 1. um ExcludeO365 REG hinzuzufuegen
echo Druecke 2. um ExcludeO365 REG zu loeschen
echo Druecke 3. um abzubrechen
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
echo Dieses Script benoetigt Administrator Rechte.
echo Bitte fuehre dieses Script als Administrator aus.
echo.
timeout /t 5 /nobreak >nul
exit

:add
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover"  /v ExcludeExplicitO365Endpoint /t REG_DWORD /d 00000001 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover"  /v ExcludeHttpsRootDomain /t REG_DWORD /d 00000001 /f
goto start

:remove
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover"  /v ExcludeExplicitO365Endpoint /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Outlook\AutoDiscover"  /v ExcludeHttpsRootDomain /f
goto start

:exit
echo.
echo Exiting...
timeout /t 1 /nobreak >nul
exit
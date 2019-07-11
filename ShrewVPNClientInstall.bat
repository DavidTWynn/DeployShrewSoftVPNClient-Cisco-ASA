@echo off
:: These commands set the source and dest for the Shrew configuration file 
:: Export your shrew config file by going to %APPDATA%\..\Local\Shrew Soft VPN\sites on a computer that has the site configured
:: Then copy that site configuration file to a file share
:: Change the source to your file server directory with just the config file in it
set source=\\SERVER\test1\
set destination="%APPDATA%\..\Local\Shrew Soft VPN\sites"

ECHO Installing and configuring chocolatey :) 
ECHO ---------------------------------------
::  install chocolatey via CMD - need .NET 4+ Win7+/SVR2003+ PSv2+ - https://chocolatey.org/install
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
:: this is a feature to ignore all prompts from choco 
choco feature enable -n=allowGlobalConfirmation

ECHO Installing ShrewSoft VPN Client
choco install shrewsoftvpn --installargs "/S /STANDARD"

ECHO Finished installing ShrewSoft VPN Client
ECHO ----------------------------------------
ECHO Copying the Shrew VPN Config file to APPDATA\LOCAL\Shrew Soft VPN\sites 
robocopy /sl %source% %destination% > nul
ECHO ----------------------------------------
ECHO Script is done! Open the VPN Access Manager to see the new site. (You may need to close if it was already open)

:: uninstall command ---
:: choco uninstall shrewsoftvpn --installargs "/S /STANDARD"

PAUSE
 

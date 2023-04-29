@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9012/DiscordSetup.exe

if exist "C:\Temp\Discord.exe" (
    echo Discord already downloaded
) else (
    echo Downloading Discord...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Discord.exe'"
    echo Finished Downloading...
)


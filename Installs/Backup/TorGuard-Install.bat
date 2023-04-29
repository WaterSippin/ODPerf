
@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
    echo Broken
    Timeout /t 5
    exit
) else (
    echo Script is not running with administrator privileges
    echo Broken
    Timeout /t 5
    exit
)


set url8=https://torguard.net/downloads/new/torguard-setup-latest.exe

if exist "C:\Temp\TorGuard.exe" (
    echo TorGuard already downloaded
) else (
    echo Downloading TorGuard...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\TorGuard.exe'"
    echo Finished Downloading...
)

echo Installing TorGuard...
C:\Temp\TorGuard.exe /VERYSILENT /D=C:\Temp\TorGuard /NORESTART
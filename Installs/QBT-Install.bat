@echo off

echo Broken
Timeout /t 5
exit

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://www.fosshub.com/qBittorrent.html?dwl=qbittorrent_4.5.2_x64_setup.exe
if exist "C:\Temp\QBT.exe" (
    echo QBT already downloaded
) else (
    echo Downloading QBT...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\QBT.exe'"
    echo Finished Downloading...
)

echo Installing QBT...
C:\Temp\QBT.exe /VERYSILENT /INSTALLDIR=C:\Temp\QBT
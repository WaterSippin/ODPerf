
@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/obsproject/obs-studio/releases/download/29.0.2/OBS-Studio-29.0.2-Full-Installer-x64.exe



if exist "C:\Temp\OBS.exe" (
    echo OBS already downloaded
) else (
    echo Downloading OBS...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\OBS.exe'"
    echo Finished Downloading...
)

echo Installing OBS...
C:\Temp\OBS.exe /S /DIR=C:\Temp\OBS
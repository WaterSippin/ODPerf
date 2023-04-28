@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://epicgames-download1.akamaized.net/Builds/UnrealEngineLauncher/Installers/Win32/EpicInstaller-14.6.2.msi?launcherfilename=EpicInstaller-14.6.2.msi

if exist "C:\Temp\Epic.msi" (
    echo Epic already downloaded
) else (
    echo Downloading Epic...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Epic.msi'"
    echo Finished Downloading...
)

msiexec /i C:\Temp\Epic.msi /quiet INSTALLDIR=C:\Temp\Epic
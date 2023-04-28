

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
    echo This Script is broken, it will not work
    timeout /t 5
    exit
) else (
    echo Script is not running with administrator privileges
    echo This Script is broken, it will not work
    Timeout /t 5
    exit
)


set url8=https://www.fosshub.com/Bulk-Crap-Uninstaller.html?dwl=BCUninstaller_5.5_setup.exe

if exist "C:\Temp\BCU.exe" (
    echo BCU already downloaded
) else (
    echo Downloading BCU...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\BCU.exe'"
    echo Finished Downloading...
)

echo Installing BCU...
C:\Temp\BCU.exe /S /D=C:\Temp\BCU
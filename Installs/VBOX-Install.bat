

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://download.virtualbox.org/virtualbox/7.0.8/VirtualBox-7.0.8-156879-Win.exe



if exist "C:\Temp\VBOX.exe" (
    echo VBOX already downloaded
) else (
    echo Downloading VBOX...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\VBOX.exe'"
    echo Finished Downloading...
)

echo Installing VBOX...
C:\Temp\VBOX.exe /S /DIR=C:\Temp\VBOX
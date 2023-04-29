https://zoom.us/client/latest/ZoomInstaller.exe



@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://cytranet.dl.sourceforge.net/project/wampserver/WampServer%203/WampServer%203.0.0/wampserver3.3.0_x64.exe




if exist "C:\Temp\zoom.exe" (
    echo zoom already downloaded
) else (
    echo Downloading zoom...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\zoom.exe'"
    echo Finished Downloading...
)

echo Installing zoom...
C:\Temp\zoom.exe /S /DIR=C:\Temp\zoom
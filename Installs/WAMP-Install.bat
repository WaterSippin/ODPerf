

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




if exist "C:\Temp\WAMP.exe" (
    echo WAMP already downloaded
) else (
    echo Downloading WAMP...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\WAMP.exe'"
    echo Finished Downloading...
)

echo Installing WAMP...
C:\Temp\WAMP.exe /S /DIR=C:\Temp\WAMP
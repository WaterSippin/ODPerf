


@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://www.speedguide.net/files/TCPOptimizer.exe




if exist "C:\Temp\TCPOptimizer.exe" (
    echo TCPOptimizer already downloaded
) else (
    echo Downloading TCPOptimizer...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\TCPOptimizer.exe'"
    echo Finished Downloading...
)

echo Installing TCPOptimizer...
C:\Temp\TCPOptimizer.exe /S /DIR=C:\Temp\TCPOptimizer
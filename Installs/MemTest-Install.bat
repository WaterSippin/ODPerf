


@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://us6-dl.techpowerup.com/files/5OC91bXk9RwozHDMNa97jA/1682249677/MemTest64.exe



if exist "C:\Temp\MemTest64.exe" (
    echo MT64 already downloaded
) else (
    echo Downloading MT64...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\MT64.exe'"
    echo Finished Downloading...
)

echo Installing MT64...
C:\Temp\MT64.exe /S /DIR=C:\Temp\MT64
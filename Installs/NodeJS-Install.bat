

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://nodejs.org/dist/v18.16.0/node-v18.16.0-x64.msi




if exist "C:\Temp\NodeJS.msi" (
    echo NodeJS already downloaded
) else (
    echo Downloading NodeJS...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\NodeJS.msi'"
    echo Finished Downloading...
)

echo Installing NodeJS...
msiexec /i C:\Temp\NodeJS.msi /quiet INSTALLDIR=C:\Temp\NodeJS
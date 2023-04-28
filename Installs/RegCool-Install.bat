

@echo off

echo Broken
/ Timeout /t 5
exit

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://kurtzimmermann.com/files/RegCool.exe
if exist "C:\Temp\RegCool.exe" (
    echo RegCool already downloaded
) else (
    echo Downloading RegCool...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\RegCool.exe'"
    echo Finished Downloading...
)

echo Installing RegCool...
C:\Temp\RegCool.exe /VERYSILENT /S /Q /D=C:\Temp\RegCool
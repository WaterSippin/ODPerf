@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://softpedia-secure-download.com/dl/3fd2fd85b9224c1c3bf3987412618825/64445b44/100078136/software/tweak/JoyToKeySetup_en.exe
if exist "C:\Temp\Joy2Key.exe" (
    echo J2K already downloaded
) else (
    echo Downloading Joy 2 Key...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Joy2Key.exe'"
    echo Finished Downloading...
)

echo Installing Joy 2 Key...
C:\Temp\Joy2Key.exe /VERYSILENT /INSTALLDIR=C:\Temp\Joy2Key
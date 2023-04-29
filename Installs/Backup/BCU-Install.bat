

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    echo This Script is broken, it will not work
    Timeout /t 5
    exit
)


set url8=https://github.com/Klocman/Bulk-Crap-Uninstaller/releases/download/v5.5/BCUninstaller_5.5_portable.zip

if exist "C:\Temp\BCU.zip" (
    echo BCU already downloaded
) else (
    echo Downloading BCU...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\BCU.zip'"
    echo Finished Downloading...
)



set ZIPFILE="C:\Temp\BCU.zip"
set DESTINATION=""


echo Installing BCU...
powershell -command Expand-Archive -LiteralPath "C:\Temp\BCU.zip" -DestinationPath "C:\Temp\BCU" -Force

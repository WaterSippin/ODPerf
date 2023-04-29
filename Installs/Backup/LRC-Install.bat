@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/little-apps/LittleRegistryCleaner/releases/download/1.6/Little_Registry_Cleaner_Portable_Edition_06_28_2013.zip

if exist "C:\Temp\LRC.zip" (
    echo LRC already downloaded
) else (
    echo Downloading LRC...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\LRC.zip'"
    echo Finished Downloading...
)

echo unzipping LRC...
powershell -command "Expand-Archive -Path 'C:\Temp\LRC.zip' -DestinationPath 'C:\Temp\LRC'"
rem C:\Temp\LRC.zip /S /D=C:\Temp\LRC
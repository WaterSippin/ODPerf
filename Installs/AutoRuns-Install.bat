

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://download.sysinternals.com/files/Autoruns.zip




if exist "C:\Temp\AR.zip" (
    echo AR already downloaded
) else (
    echo Downloading AR...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\AR.zip'"
    echo Finished Downloading...
)

echo unzipping AR...
powershell -command "Expand-Archive -Path 'C:\Temp\AR.zip' -DestinationPath 'C:\Temp\AR'"
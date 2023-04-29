
@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)

set url8=https://github.com/Ultimaker/Cura/releases/download/5.3.0/UltiMaker-Cura-5.3.0-win64.exe



if exist "C:\Temp\Cura.exe" (
    echo Cura already downloaded
) else (
    echo Downloading Cura...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Cura.exe'"
    echo Finished Downloading...
)

echo Installing Cura...
C:\Temp\Cura.exe /S /D=C:\Temp\Cura
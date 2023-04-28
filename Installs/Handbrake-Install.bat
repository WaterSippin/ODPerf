@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/HandBrake/HandBrake/releases/download/1.6.1/HandBrake-1.6.1-x86_64-Win_GUI.exe

if exist "C:\Temp\handbrake.exe" (
    echo Epic already downloaded
) else (
    echo Downloading HandBrake...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\handbrake.exe'"
    echo Finished Downloading...
)

echo Installing HandBrake...
C:\Temp\handbrake.exe /S /D=C:\Temp\HandBrake
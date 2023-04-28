

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
    echo This Script is broken, it will not work
    timeout /t 5
    exit
) else (
    echo Script is not running with administrator privileges
    echo This Script is broken, it will not work
    Timeout /t 5
    exit
)


set url8=https://github.com/cheat-engine/cheat-engine/releases/download/7.5/CheatEngine75.exe

if exist "C:\Temp\CheatEngine.exe" (
    echo CheatEngine already downloaded
) else (
    echo Downloading CheatEngine...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\CheatEngine.exe'"
    echo Finished Downloading...
)

echo Installing CheatEngine...
C:\Temp\CheatEngine.exe /S /D=C:\Temp\CheatEngine
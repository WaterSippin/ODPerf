@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://us.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe

if exist "C:\Temp\BattleNet.exe" (
    echo BattleNet already downloaded
) else (
    echo Downloading BattleNet...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\BattleNet.exe'"
    echo Finished Downloading...
)

echo Installing BattleNet...
C:\Temp\BattleNet.exe /S /D=C:\Temp\BattleNet
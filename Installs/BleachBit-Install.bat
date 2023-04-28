
@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://www.bleachbit.org/download/file/t?file=BleachBit-4.4.2-portable.zip

if exist "C:\Temp\Bleachbit.zip" (
    echo Bleachbit already downloaded
) else (
    echo Downloading Bleachbit...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Bleachbit.zip'"
    echo Finished Downloading...
)

echo unzipping Bleachbit...
powershell -command "Expand-Archive -Path 'C:\Temp\Bleachbit.zip' -DestinationPath 'C:\Temp\Bleachbit'"
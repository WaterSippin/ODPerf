

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/paintdotnet/release/releases/download/v5.0.3/paint.net.5.0.3.portable.x64.zip




if exist "C:\Temp\PaintN.zip" (
    echo Paint.Net already downloaded
) else (
    echo Downloading Paint.Net...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\PaintN.zip'"
    echo Finished Downloading...
)

echo unzipping Paint.Net...
powershell -command "Expand-Archive -Path 'C:\Temp\PaintN.zip' -DestinationPath 'C:\Temp\PaintN'"

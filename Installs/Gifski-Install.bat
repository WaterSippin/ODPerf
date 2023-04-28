@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/ImageOptim/gifski/releases/download/1.10.0/gifski_1.10.0_x64_en-US.msi

if exist "C:\Temp\gifski.msi" (
    echo Epic already downloaded
) else (
    echo Downloading Gifski...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\gifski.msi'"
    echo Finished Downloading...
)

echo Installing Gifski...
msiexec /i C:\Temp\gifski.msi /quiet INSTALLDIR=C:\Temp\Gifski
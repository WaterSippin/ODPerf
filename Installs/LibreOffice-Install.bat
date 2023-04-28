
@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://cfhcable.dl.sourceforge.net/project/libreoffice/libreoffice/stable/7.5.2/win/x86_64/LibreOffice_7.5.2_Win_x86-64.msi


if exist "C:\Temp\Libre.msi" (
    echo Libre already downloaded
) else (
    echo Downloading Libre...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\Libre.msi'"
    echo Finished Downloading...
)

echo Installing Libre...
msiexec /i C:\Temp\Libre.msi /quiet INSTALLDIR=C:\Temp\Libre
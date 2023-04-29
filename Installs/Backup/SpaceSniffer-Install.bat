

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=http://www.uderzo.it/main_products/space_sniffer/files/spacesniffer_1_3_0_2.zip

if exist "C:\Temp\SpaceSniffer.zip" (
    echo SpaceSniffer already downloaded
) else (
    echo Downloading SpaceSniffer...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\SpaceSniffer.zip'"
    echo Finished Downloading...
)

echo unzipping SpaceSniffer...
powershell -command "Expand-Archive -Path 'C:\Temp\SpaceSniffer.zip' -DestinationPath 'C:\Temp\SpaceSniffer'"
rem C:\Temp\LRC.zip /S /D=C:\Temp\LRC



@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://github.com/SamuelTulach/VirusTotalUploader/releases/download/0.2.1/vt_portable.zip

if exist "C:\Temp\VTUploader.zip" (
    echo VTUploader already downloaded
) else (
    echo Downloading VTUploader...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\VTUploader.zip'"
    echo Finished Downloading...
)

echo unzipping VTUploader...
powershell -command "Expand-Archive -Path 'C:\Temp\VTUploader.zip' -DestinationPath 'C:\Temp\VTUploader'"
rem C:\Temp\LRC.zip /S /D=C:\Temp\LRC
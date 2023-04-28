

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://2.na.dl.wireshark.org/win64/WiresharkPortable64_4.0.5.paf.exe
set url2=https://npcap.com/dist/npcap-1.74.exe


if exist "C:\Temp\NpCap.exe" (
    echo NPCap already downloaded
) else (
    echo Downloading NPCap...
    powershell -command "Invoke-WebRequest -Uri '%url2%' -OutFile 'C:\Temp\NpCap.exe'"
    echo Finished Downloading...
)

if exist "C:\Temp\WShark.exe" (
    echo WShark already downloaded
) else (
    echo Downloading WShark...
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\WShark.exe'"
    echo Finished Downloading...
)



echo Installing NPCap...
C:\Temp\NpCap.exe /S /DIR=C:\Temp\NpCap
echo Installing WShark...
C:\Temp\WShark.exe /S /DIR=C:\Temp\WShark
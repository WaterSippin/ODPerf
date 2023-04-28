

@echo off

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Script is running with administrator privileges
) else (
    echo Script is not running with administrator privileges
    Timeout /t 5
    exit
)


set url8=https://desktop.githubusercontent.com/github-desktop/releases/3.2.2-508c0b4d/GitHubDesktopSetup-x64.msi


if exist "C:\Temp\GithubDesktop.msi" (
    echo Github Desktop already downloaded
) else (
    echo Downloading Github Desktop
    powershell -command "Invoke-WebRequest -Uri '%url8%' -OutFile 'C:\Temp\GithubDesktop.msi'"
    echo Finished Downloading...
)

echo Installing Github Desktop
msiexec /i C:\Temp\GithubDesktop.msi /q
REM C:\Program Files (x86)\GitHub Desktop Deployment\GitHubDesktopDeploymentTool.exe /VERYSILENT /SUPPRESSMSGBOXES /NORESTART

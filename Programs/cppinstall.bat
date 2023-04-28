@echo off
echo Installing Direct X web installer...
start /wait "" "%cd%\Programs\dxwebsetup.exe" /Q
echo Direct X web installer has been installed.
pause
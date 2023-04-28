@echo off
echo Running PowerShell scripts...
echo %cd%

set "SCRIPTS_FOLDER=%CD%\MyChanges\QoL"

for %%i in ("%SCRIPTS_FOLDER%\*.ps1") do (
    echo Running script: %%i
    powershell -ExecutionPolicy Bypass -Command "Start-Process powershell.exe -Verb RunAs -ArgumentList '-File', '%%i'"
)
for %%n in ("%SCRIPTS_FOLDER%\*.reg") do (
    echo Merging reg file: %%n
    regedit /s "%%n"
)

echo Done.
pause
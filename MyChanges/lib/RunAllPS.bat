@echo off
echo Running PowerShell scripts...
echo %cd%

set "SCRIPTS_FOLDER=%CD%"

for %%i in ("%SCRIPTS_FOLDER%\*.ps1") do (
    echo Running script: %%i
    powershell -Command "Start-Process powershell -Verb runAs -ArgumentList '-File', '%%i'"
)
for %%n in ("%SCRIPTS_FOLDER%\*.reg") do (
    echo Merging reg file: %%n
    regedit /s "%%n"
)

echo Done.
pause
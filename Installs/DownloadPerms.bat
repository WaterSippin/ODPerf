rem get working directory
set WD=%~dp0
powershell -Command "Start-Process powershell -Verb runAs -ArgumentList '-File', '%WD%\DownloadPerms.ps1'"

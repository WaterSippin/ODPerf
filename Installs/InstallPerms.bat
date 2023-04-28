msiexec /i C:\Perm\7zip.msi /quiet
C:\Perm\DiscordSetup.exe -s
C:\Perm\BitwardenInstaller.exe /S
msiexec /i C:\Perm\ChatGPT.msi /quiet
C:\Perm\ISLC.exe /VERYSILENT
C:\Perm\EverythingSetup.exe /S
C:\Perm\VSCodeUserSetup.exe /NORESTART=1 /MERGETASKS=!runcode /VERYSILENT
C:\Perm\vlc.exe /L=1033 /S

powershell -command "Expand-Archive -LiteralPath 'C:\Perm\ProcessMonitor.zip' -DestinationPath 'C:\Perm\ProcessMonitor'"


C:\Perm\AHK.exe /S
powershell -command "New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders' -Name 'Process Monitor' -Value 'C:\Perm\ProcessMonitor' -PropertyType String -Force"
powershell -command "New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.avi\UserChoice' -Name 'Progid' -Value 'VLC.avi' -Force | Out-Null"
powershell -command "New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mp4\UserChoice' -Name 'Progid' -Value 'VLC.mp4' -Force | Out-Null"
powershell -command "New-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.mkv\UserChoice' -Name 'Progid' -Value 'VLC.mkv' -Force | Out-Null"
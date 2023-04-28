Set-ExecutionPolicy Bypass
#Run Optimizer
Write-Output "Adjust settings, DONT REBOOT"
Start-Process -FilePath $PSScriptRoot\HellZergOptimize.bat -Wait runAs
Write-Output "Finished Optimizing"
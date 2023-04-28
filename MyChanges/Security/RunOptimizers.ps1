Set Execution-Policy Unrestricted
#Run Optimizer
Write-Output "Adjust settings, DONT REBOOT"
Start-Process -FilePath $PSScriptRoot\HellZergOptimize.bat -Wait runAs
Write-Output "Finished Optimizing"

#Run TCPoptimizer 
Write-Output "Optimizing Network"
Start-Process -FilePath $PSScriptRoot\OptimizeNetwork.bat -Wait runAs
Write-Output "Network Optimized"
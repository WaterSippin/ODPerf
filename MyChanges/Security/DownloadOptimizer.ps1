Set-ExecutionPolicy Unrestricted

#Create Temp Folder
Write-Output "Creating Folder..."
New-Item -ItemType Directory -Path "C:\Temp"
Write-Output "Folder Created..."

#Download TCPoptimizer
$url2 = "https://www.speedguide.net/files/TCPOptimizer.exe"
$outputFile2 = "C:\Temp\TCPoptimizer.exe"
Write-Output "Downloading TCP Optimizer"
Invoke-WebRequest -Uri $url2 -OutFile $outputFile2
Write-Output "Finished Downloading..."

#Download Optimizer
$url = "https://github.com/hellzerg/optimizer/releases/download/15.0/Optimizer-15.0.exe"
$outputFile = "C:\Temp\optimizer.exe"
Write-Output "Downloading HellZerg Optimizer..."
Invoke-WebRequest -Uri $url -OutFile $outputFile




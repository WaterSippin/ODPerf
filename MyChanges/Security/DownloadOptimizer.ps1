Set-ExecutionPolicy Bypass

#Create Temp Folder
Write-Output "Creating Folder..."
New-Item -ItemType Directory -Path "C:\Temp"
Write-Output "Folder Created..."

#Download Optimizer
$url = "https://github.com/hellzerg/optimizer/releases/download/15.0/Optimizer-15.0.exe"
$outputFile = "C:\Temp\optimizer.exe"
Write-Output "Downloading HellZerg Optimizer..."
Invoke-WebRequest -Uri $url -OutFile $outputFile




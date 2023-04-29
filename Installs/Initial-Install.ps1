Set-ExecutionPolicy Bypass
$MemTest = https://us6-dl.techpowerup.com/files/5OC91bXk9RwozHDMNa97jA/1682249677/MemTest64.exe

if (Test-Path "C:\Perm\MT64.msi") {
    Write-Output "MT64 already downloaded"
} else {
    Write-Output "Downloading MT64..."
    $outputFile = "C:\Perm\MT64.msi"
    Invoke-WebRequest -Uri $MemTest -OutFile $outputFile
   
}



choco install chocolateygui --pre -y
choco install autoruns -y -ia "/InstallLocation=C:\Temp\"
choco install bulk-crap-uninstaller -y -ia "/InstallLocation=C:\Temp\"
choco install tcpoptimizer -y -ia "/InstallLocation=C:\Temp\"
choco install plasso -y -ia "/InstallLocation=C:\Temp\"
choco install ddu -y -ia "/InstallLocation=C:\Temp\"
choco install vcredist140 -y -ia "/InstallLocation=C:\Temp\"
choco install geforce-experience -y -ia "/InstallLocation=C:\Temp\"
choco install directx -y -ia "/InstallLocation=C:\Temp\"

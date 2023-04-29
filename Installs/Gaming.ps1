Set-ExecutionPolicy Bypass
$BNet = "https://us.battle.net/download/getInstaller?os=win&installer=Battle.net-Setup.exe"

if (Test-Path "C:\Perm\BNet.msi") {
    Write-Output "BNet already downloaded"
} else {
    Write-Output "Downloading BNet..."
    $outputFile = "C:\Perm\BNet.msi"
    Invoke-WebRequest -Uri $BNet -OutFile $outputFile
   
}



choco install joytokey -y -ia "/InstallLocation=C:\Temp\" --params "/VERYSILENT"
choco install epicgameslauncher -y --params "/quiet"
choco install steam -y 
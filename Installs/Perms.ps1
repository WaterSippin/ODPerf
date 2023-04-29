$GPT = "https://github.com/lencx/ChatGPT/releases/download/v0.12.0/ChatGPT_0.12.0_windows_x86_64.msi"
$VSC = "https://az764295.vo.msecnd.net/stable/704ed70d4fd1c6bd6342c436f1ede30d1cff4710/VSCodeSetup-x64-1.77.3.exe"
$BW = "https://github.com/bitwarden/clients/releases/download/desktop-v2023.3.2/Bitwarden-Installer-2023.3.2.exe"


if (Test-Path "C:\Perm") {
    Write-Output "Perm folder already exists"
} else {
    Write-Output "Creating Perm folder..."
    New-Item -ItemType Directory -Path "C:\Perm"
}

if (Test-Path "C:\Perm\GPT.msi") {
    Write-Output "GPT already downloaded"
} else {
    Write-Output "Downloading GPT..."
    $outputFile = "C:\Perm\GPT.msi"
    Invoke-WebRequest -Uri $GPT -OutFile $outputFile
   
}
if (Test-Path "C:\Perm\BW.msi") {
    Write-Output "BW already downloaded"
} else {
    Write-Output "Downloading BW..."
    $outputFile = "C:\Perm\BW.msi"
    Invoke-WebRequest -Uri $BW -OutFile $outputFile
   
}
if (Test-Path "C:\Perm\VSC.msi") {
    Write-Output "VSC already downloaded"
} else {
    Write-Output "Downloading VSC..."
    $outputFile = "C:\Perm\VSC.msi"
    Invoke-WebRequest -Uri $VSC -OutFile $outputFile
   
}

C:\Perm\BW.exe /S
C:\Perm\VSC.exe /NORESTART=1 /MERGETASKS=!runcode /VERYSILENT
msiexec /i C:\Perm\GPT.msi /quiet

choco install discord -y --params "-s"
choco install everything -y --params "/S"
choco install vlc-nightly -y --params "/L=1033 /S"
choco install autohotkey.install -y 
choco install autohotkey.portable -y
choco install github-desktop -y
choco install 7zip -y


# download Discord
$url = "https://dl.discordapp.net/distro/app/stable/win/x86/1.0.9012/DiscordSetup.exe"
# download Bitwarden
$url2 = "https://github.com/bitwarden/clients/releases/download/desktop-v2023.3.2/Bitwarden-Installer-2023.3.2.exe"
# download ChatGPT
$url3 = "https://github.com/lencx/ChatGPT/releases/download/v0.12.0/ChatGPT_0.12.0_windows_x86_64.msi"
# download ISLC
$url4 = "https://www.wagnardsoft.com/ISLC/ISLC%20v1.0.2.8.exe"
# download Everything Search
$url5 = "https://www.voidtools.com/Everything-1.4.1.1022.x86.Lite-Setup.exe"
# download VSCode
$url6 = "https://az764295.vo.msecnd.net/stable/704ed70d4fd1c6bd6342c436f1ede30d1cff4710/VSCodeSetup-x64-1.77.3.exe"
# download VLC
$url7 = "https://ftp.osuosl.org/pub/videolan/vlc/3.0.18/win64/vlc-3.0.18-win64.exe"
#download 7zip
$url8 = "https://7-zip.org/a/7z2201-x64.msi"
#download Process Monitor
$url9 = "https://download.sysinternals.com/files/ProcessMonitor.zip"
#download Autoit
$url10 = "https://www.autohotkey.com/download/ahk-v2.exe"




#Check if Perm folder exists, if not, create it
if (Test-Path "C:\Perm") {
    Write-Output "Perm folder already exists"
} else {
    Write-Output "Creating Perm folder..."
    New-Item -ItemType Directory -Path "C:\Perm"
}


#Check if 7zip is already downloaded
if (Test-Path "C:\Perm\7zip.msi") {
    Write-Output "7zip already downloaded"
} else {
    Write-Output "Downloading 7zip..."
    $outputFile = "C:\Perm\7zip.msi"
    Invoke-WebRequest -Uri $url8 -OutFile $outputFile
   
}

#Check if Discord is already downloaded
if (Test-Path "C:\Perm\DiscordSetup.exe") {
    Write-Output "Discord already downloaded"
} else {
    Write-Output "Downloading Discord..."
    $outputFile = "C:\Perm\DiscordSetup.exe"
    Invoke-WebRequest -Uri $url -OutFile $outputFile
   
}

#Check if Bitwarden is already downloaded
if (Test-Path "C:\Perm\BitwardenInstaller.exe") {
    Write-Output "Bitwarden already downloaded"
} else {
    Write-Output "Downloading Bitwarden..."
    $outputFile = "C:\Perm\BitwardenInstaller.exe"
    Invoke-WebRequest -Uri $url2 -OutFile $outputFile
   
}

#Check if ChatGPT is already downloaded
if (Test-Path "C:\Perm\ChatGPT.msi") {
    Write-Output "ChatGPT already downloaded"
} else {
    Write-Output "Downloading ChatGPT..."
    $outputFile = "C:\Perm\ChatGPT.msi"
    Invoke-WebRequest -Uri $url3 -OutFile $outputFile
   
}

#Check if ISLC is already downloaded
if (Test-Path "C:\Perm\ISLC.exe") {
    Write-Output "ISLC already downloaded"
} else {
    Write-Output "Downloading ISLC..."
    $outputFile = "C:\Perm\ISLC.exe"
    Invoke-WebRequest -Uri $url4 -OutFile $outputFile
   
}

#Check if Everything Search is already downloaded
if (Test-Path "C:\Perm\EverythingSetup.exe") {
    Write-Output "Everything Search already downloaded"
} else {
    Write-Output "Downloading Everything Search..."
    $outputFile = "C:\Perm\EverythingSetup.exe"
    Invoke-WebRequest -Uri $url5 -OutFile $outputFile
   
}

#Check if VSCode is already downloaded
if (Test-Path "C:\Perm\VSCodeUserSetup.exe") {
    Write-Output "VSCode already downloaded"
} else {
    Write-Output "Downloading VSCode..."
    $outputFile = "C:\Perm\VSCodeUserSetup.exe"
    Invoke-WebRequest -Uri $url6 -OutFile $outputFile
   
}

#Check if VLC is already downloaded
if (Test-Path "C:\Perm\vlc.exe") {
    Write-Output "VLC already downloaded"
} else {
    Write-Output "Downloading VLC..."
    $outputFile = "C:\Perm\vlc.exe"
    Invoke-WebRequest -Uri $url7 -OutFile $outputFile
   
}
#Check if Process Monitor is already downloaded
if (Test-Path "C:\Perm\ProcessMonitor.zip") {
    Write-Output "Process Monitor already downloaded"
} else {
    Write-Output "Downloading Process Monitor..."
    $outputFile = "C:\Perm\ProcessMonitor.zip"
    Invoke-WebRequest -Uri $url9 -OutFile $outputFile
   
}
#Check if AHK is already downloaded
if (Test-Path "C:\Perm\AHK.exe") {
    Write-Output "AHK already downloaded"
} else {
    Write-Output "Downloading AHK..."
    $outputFile = "C:\Perm\AHK.exe"
    Invoke-WebRequest -Uri $url10 -OutFile $outputFile
   
}




#Start-Process -FilePath "$PSScriptRoot\InstallPerms.bat" -Verb RunAs



Start-Sleep -s 5


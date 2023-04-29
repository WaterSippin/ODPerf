WorkingDir := A_WorkingDir

RegRead, IterationData, HKEY_CURRENT_USER, Software\ODPerf, Iteration
ButtonTxt := "Click Me! " . IterationData

; Add the button to the GUI with the concatenated text
Gui, Add, Button, x50 y50 w100 h30 gButtonClicked, %ButtonTxt%
Gui, Add, Button, x50 y100 w100 h30 gButtonClicked2, Reset Reg
Gui, Add, Button, x50 y150 w100 h30 gDownloadPerms, Download Perms
Gui, Add, Button, x50 y200 w100 h30 gInstallPerms, Install Perms
Gui, Show, w300 h300, My Window
Return



ButtonClicked:
RegRead, IterationData, HKEY_CURRENT_USER, Software\ODPerf, Iteration
if (IterationData = "" || IterationData = 0)
{
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\ODPerf, Iteration, 1
    IterationData := 1
}
else
{
    IterationData++
    RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\ODPerf, Iteration, %IterationData%
}

if (IterationData = 1)
{
    RunWait, *RunAs regedit.exe /s "%WorkingDir%\MyChanges\Security\FuckSecurity.reg"
    RunWait, *RunAs powershell.exe -ExecutionPolicy Bypass -File "%WorkingDir%\MyChanges\Security\DownloadOptimizer.ps1"
    RunWait, "%WorkingDir%\MyChanges\QOL\RunAllPS.bat"
    RunWait, "%WorkingDir%\MyChanges\Performance\RunAllPS.bat"
    RunWait, *RunAs powershell.exe "%WorkingDir%\Installs\InstallChoco.ps1"
    RunWait, *RunAs powershell.exe "%WorkingDir%\Installs\Initial-Install.ps1"
    RunWait, *RunAs powershell.exe -ExecutionPolicy Bypass -File "%WorkingDir%\MyChanges\Security\DisableSecuritySettings.ps1"
    Shutdown, 2
}
if (IterationData = 2)
{
    RunWait, *RunAs regedit.exe /s "%WorkingDir%\MyChanges\Security\FuckSecurity.reg"
    RunWait, "%WorkingDir%\MyChanges\QOL\RunAllPS.bat"
    RunWait, "%WorkingDir%\MyChanges\Performance\RunAllPS.bat"
    RunWait, *RunAs powershell.exe "%WorkingDir%\MyChanges\Security\RunOptimizers.ps1"
    Shutdown, 2

    RunWait, *RunAs powershell.exe -ExecutionPolicy Bypass -File "%WorkingDir%\MyChanges\Security\DisableSecuritySettings.ps1"
}
if(IterationData = 3)
{

}

Return

ButtonClicked2:
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\ODPerf, Iteration, 0
Return

DownloadPerms:
RunWait, "%WorkingDir%\Installs\DownloadPerms.bat"
Return

InstallPerms:
RunWait, *RunAs "%WorkingDir%\Installs\InstallPerms.bat"
return


#   Description:
# This script blocks telemetry related domains via the hosts file and related
# IPs via Windows Firewall.
#
# Please note that adding these domains may break certain software like iTunes
# or Skype. As this issue is location dependent for some domains, they are not
# commented by default. The domains known to cause issues marked accordingly.
# Please see the related issue:
# <https://github.com/W4RH4WK/Debloat-Windows-10/issues/79>


Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1

Write-Output "Disabling telemetry via Group Policies"
New-FolderForced -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0

# Entries related to Akamai have been reported to cause issues with Widevine
# DRM.

Write-Output "Adding telemetry domains to hosts file"
$hosts_file = "$env:systemroot\System32\drivers\etc\hosts"
$domains = @(
    "184-86-53-99.deploy.static.akamaitechnologies.com"
    "a-0001.a-msedge.net"
    "a-0002.a-msedge.net"
    "a-0003.a-msedge.net"
    "a-0004.a-msedge.net"
    "a-0005.a-msedge.net"
    "a-0006.a-msedge.net"
    "a-0007.a-msedge.net"
    "a-0008.a-msedge.net"
    "a-0009.a-msedge.net"
    "a1621.g.akamai.net"
    "a1856.g2.akamai.net"
    "a1961.g.akamai.net"
    #"a248.e.akamai.net"            # makes iTunes download button disappear (#43)
    "a978.i6g1.akamai.net"
    "a.ads1.msn.com"
    "a.ads2.msads.net"
    "a.ads2.msn.com"
    "ac3.msn.com"
    "ad.doubleclick.net"
    "adnexus.net"
    "adnxs.com"
    "ads1.msads.net"
    "ads1.msn.com"
    "ads.msn.com"
    "aidps.atdmt.com"
    "aka-cdn-ns.adtech.de"
    "a-msedge.net"
    "any.edge.bing.com"
    "a.rad.msn.com"
    "az361816.vo.msecnd.net"
    "az512334.vo.msecnd.net"
    "b.ads1.msn.com"
    "b.ads2.msads.net"
    "bingads.microsoft.com"
    "b.rad.msn.com"
    "bs.serving-sys.com"
    "c.atdmt.com"
    "cdn.atdmt.com"
    "cds26.ams9.msecn.net"
    "choice.microsoft.com"
    "choice.microsoft.com.nsatc.net"
    "compatexchange.cloudapp.net"
    "corpext.msitadfs.glbdns2.microsoft.com"
    "corp.sts.microsoft.com"
    "cs1.wpc.v0cdn.net"
    "db3aqu.atdmt.com"
    "df.telemetry.microsoft.com"
    "diagnostics.support.microsoft.com"
    "e2835.dspb.akamaiedge.net"
    "e7341.g.akamaiedge.net"
    "e7502.ce.akamaiedge.net"
    "e8218.ce.akamaiedge.net"
    "ec.atdmt.com"
    "fe2.update.microsoft.com.akadns.net"
    "feedback.microsoft-hohm.com"
    "feedback.search.microsoft.com"
    "feedback.windows.com"
    "flex.msn.com"
    "g.msn.com"
    "h1.msn.com"
    "h2.msn.com"
    "hostedocsp.globalsign.com"
    "i1.services.social.microsoft.com"
    "i1.services.social.microsoft.com.nsatc.net"
    #"ipv6.msftncsi.com"                    # Issues may arise where Windows 10 thinks it doesn't have internet
    #"ipv6.msftncsi.com.edgesuite.net"      # Issues may arise where Windows 10 thinks it doesn't have internet
    "lb1.www.ms.akadns.net"
    "live.rads.msn.com"
    "m.adnxs.com"
    "msedge.net"
    #"msftncsi.com"
    "msnbot-65-55-108-23.search.msn.com"
    "msntest.serving-sys.com"
    "oca.telemetry.microsoft.com"
    "oca.telemetry.microsoft.com.nsatc.net"
    "onesettings-db5.metron.live.nsatc.net"
    "pre.footprintpredict.com"
    "preview.msn.com"
    "rad.live.com"
    "rad.msn.com"
    "redir.metaservices.microsoft.com"
    "reports.wes.df.telemetry.microsoft.com"
    "schemas.microsoft.akadns.net"
    "secure.adnxs.com"
    "secure.flashtalking.com"
    "services.wes.df.telemetry.microsoft.com"
    "settings-sandbox.data.microsoft.com"
    #"settings-win.data.microsoft.com"       # may cause issues with Windows Updates
    "sls.update.microsoft.com.akadns.net"
    #"sls.update.microsoft.com.nsatc.net"    # may cause issues with Windows Updates
    "sqm.df.telemetry.microsoft.com"
    "sqm.telemetry.microsoft.com"
    "sqm.telemetry.microsoft.com.nsatc.net"
    "ssw.live.com"
    "static.2mdn.net"
    "statsfe1.ws.microsoft.com"
    "statsfe2.update.microsoft.com.akadns.net"
    "statsfe2.ws.microsoft.com"
    "survey.watson.microsoft.com"
    "telecommand.telemetry.microsoft.com"
    "telecommand.telemetry.microsoft.com.nsatc.net"
    "telemetry.appex.bing.net"
    "telemetry.microsoft.com"
    "telemetry.urs.microsoft.com"
    "vortex-bn2.metron.live.com.nsatc.net"
    "vortex-cy2.metron.live.com.nsatc.net"
    "vortex.data.microsoft.com"
    "vortex-sandbox.data.microsoft.com"
    "vortex-win.data.microsoft.com"
    "cy2.vortex.data.microsoft.com.akadns.net"
    "watson.live.com"
    "watson.microsoft.com"
    "watson.ppe.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com.nsatc.net"
    "wes.df.telemetry.microsoft.com"
    "win10.ipv6.microsoft.com"
    "www.bingads.microsoft.com"
    "www.go.microsoft.akadns.net"
    #"www.msftncsi.com"                         # Issues may arise where Windows 10 thinks it doesn't have internet
    "client.wns.windows.com"
    #"wdcp.microsoft.com"                       # may cause issues with Windows Defender Cloud-based protection
    #"dns.msftncsi.com"                         # This causes Windows to think it doesn't have internet
    #"storeedgefd.dsx.mp.microsoft.com"         # breaks Windows Store
    "wdcpalt.microsoft.com"
    "settings-ssl.xboxlive.com"
    "settings-ssl.xboxlive.com-c.edgekey.net"
    "settings-ssl.xboxlive.com-c.edgekey.net.globalredir.akadns.net"
    "e87.dspb.akamaidege.net"
    "insiderservice.microsoft.com"
    "insiderservice.trafficmanager.net"
    "e3843.g.akamaiedge.net"
    "flightingserviceweurope.cloudapp.net"
    #"sls.update.microsoft.com"                 # may cause issues with Windows Updates
    "static.ads-twitter.com"                    # may cause issues with Twitter login
    "www-google-analytics.l.google.com"
    "p.static.ads-twitter.com"                  # may cause issues with Twitter login
    "hubspot.net.edge.net"
    "e9483.a.akamaiedge.net"

    #"www.google-analytics.com"
    #"padgead2.googlesyndication.com"
    #"mirror1.malwaredomains.com"
    #"mirror.cedia.org.ec"
    "stats.g.doubleclick.net"
    "stats.l.doubleclick.net"
    "adservice.google.de"
    "adservice.google.com"
    "googleads.g.doubleclick.net"
    "pagead46.l.doubleclick.net"
    "hubspot.net.edgekey.net"
    "insiderppe.cloudapp.net"                   # Feedback-Hub
    "livetileedge.dsx.mp.microsoft.com"

    # extra
    "fe2.update.microsoft.com.akadns.net"
    "s0.2mdn.net"
    "statsfe2.update.microsoft.com.akadns.net"
    "survey.watson.microsoft.com"
    "view.atdmt.com"
    "watson.microsoft.com"
    "watson.ppe.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com"
    "watson.telemetry.microsoft.com.nsatc.net"
    "wes.df.telemetry.microsoft.com"
    "m.hotmail.com"

    # can cause issues with Skype (#79) or other services (#171)
    "apps.skype.com"
    "c.msn.com"
    # "login.live.com"                  # prevents login to outlook and other live apps
    "pricelist.skype.com"
    "s.gateway.messenger.live.com"
    "ui.skype.com"
)
Write-Output "" | Out-File -Encoding ASCII -Append $hosts_file
foreach ($domain in $domains) {
    if (-Not (Select-String -Path $hosts_file -Pattern $domain)) {
        Write-Output "0.0.0.0 $domain" | Out-File -Encoding ASCII -Append $hosts_file
    }
}

Write-Output "Adding telemetry ips to firewall"
$ips = @(
    # Windows telemetry
    "134.170.30.202"
    "137.116.81.24"
    "157.56.106.189"
    "184.86.53.99"
    "2.22.61.43"
    "2.22.61.66"
    "204.79.197.200"
    "23.218.212.69"
    "65.39.117.230"
    "65.52.108.33"   # Causes problems with Microsoft Store
    "65.55.108.23"
    "64.4.54.254"

    # NVIDIA telemetry
    "8.36.80.197"
    "8.36.80.224"
    "8.36.80.252"
    "8.36.113.118"
    "8.36.113.141"
    "8.36.80.230"
    "8.36.80.231"
    "8.36.113.126"
    "8.36.80.195"
    "8.36.80.217"
    "8.36.80.237"
    "8.36.80.246"
    "8.36.113.116"
    "8.36.113.139"
    "8.36.80.244"
    "216.228.121.209"
)
Remove-NetFirewallRule -DisplayName "Block Telemetry IPs" -ErrorAction SilentlyContinue
New-NetFirewallRule -DisplayName "Block Telemetry IPs" -Direction Outbound `
    -Action Block -RemoteAddress ([string[]]$ips)

# Block scheduled telemetry tasks
# See reference: https://answers.microsoft.com/en-us/windows/forum/windows_10-performance/permanently-disabling-windows-compatibility/6bf71583-81b0-4a74-ae2e-8fd73305aad1
$tasks = @(
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
    "\Microsoft\Windows\Application Experience\StartupAppTask"
    "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
)

foreach ($task in $tasks) {
   Disable-ScheduledTask -TaskName $task
}



# disable Memory Compression (requires SysMain (service))
Disable-MMAgent -mc
#Get-MMAgent

Write-Output "Now you can also disable service SysMain (former Superfetch) in case it's not used."
#Get-Service "SysMain" | Set-Service -StartupType Disabled -PassThru | Stop-Service




Disable-MMAgent -ApplicationPreLaunch
#Get-MMAgent

# disable Prefetch
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d "0" /f
# disable (Edge) Prelaunch
reg add "HKLM\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main" /v AllowPrelaunch /t REG_DWORD /d "0" /f


#   Description:
# This script will disable certain scheduled tasks. Work in progress!


$tasks = @(
    # Windows base scheduled tasks
    "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319"
    "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64"
    "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 64 Critical"
    "\Microsoft\Windows\.NET Framework\.NET Framework NGEN v4.0.30319 Critical"

    #"\Microsoft\Windows\Active Directory Rights Management Services Client\AD RMS Rights Policy Template Management (Automated)"
    #"\Microsoft\Windows\Active Directory Rights Management Services Client\AD RMS Rights Policy Template Management (Manual)"

    #"\Microsoft\Windows\AppID\EDP Policy Manager"
    #"\Microsoft\Windows\AppID\PolicyConverter"
    "\Microsoft\Windows\AppID\SmartScreenSpecific"
    #"\Microsoft\Windows\AppID\VerifiedPublisherCertStoreCheck"

    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
    #"\Microsoft\Windows\Application Experience\StartupAppTask"

    #"\Microsoft\Windows\ApplicationData\CleanupTemporaryState"
    #"\Microsoft\Windows\ApplicationData\DsSvcCleanup"

    #"\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup"

    "\Microsoft\Windows\Autochk\Proxy"

    #"\Microsoft\Windows\Bluetooth\UninstallDeviceTask"

    #"\Microsoft\Windows\CertificateServicesClient\AikCertEnrollTask"
    #"\Microsoft\Windows\CertificateServicesClient\KeyPreGenTask"
    #"\Microsoft\Windows\CertificateServicesClient\SystemTask"
    #"\Microsoft\Windows\CertificateServicesClient\UserTask"
    #"\Microsoft\Windows\CertificateServicesClient\UserTask-Roam"

    #"\Microsoft\Windows\Chkdsk\ProactiveScan"

    #"\Microsoft\Windows\Clip\License Validation"

    "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"

    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"

    #"\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan"
    #"\Microsoft\Windows\Data Integrity Scan\Data Integrity Scan for Crash Recovery"

    #"\Microsoft\Windows\Defrag\ScheduledDefrag"

    #"\Microsoft\Windows\Diagnosis\Scheduled"

    #"\Microsoft\Windows\DiskCleanup\SilentCleanup"

    "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
    #"\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"

    #"\Microsoft\Windows\DiskFootprint\Diagnostics"

    "\Microsoft\Windows\Feedback\Siuf\DmClient"

    #"\Microsoft\Windows\File Classification Infrastructure\Property Definition Sync"

    #"\Microsoft\Windows\FileHistory\File History (maintenance mode)"

    #"\Microsoft\Windows\LanguageComponentsInstaller\Installation"
    #"\Microsoft\Windows\LanguageComponentsInstaller\Uninstallation"

    #"\Microsoft\Windows\Location\Notifications"
    #"\Microsoft\Windows\Location\WindowsActionDialog"

    #"\Microsoft\Windows\Maintenance\WinSAT"

    #"\Microsoft\Windows\Maps\MapsToastTask"
    #"\Microsoft\Windows\Maps\MapsUpdateTask"

    #"\Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
    #"\Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"

    "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"

    #"\Microsoft\Windows\MUI\LPRemove"

    #"\Microsoft\Windows\Multimedia\SystemSoundsService"

    #"\Microsoft\Windows\NetCfg\BindingWorkItemQueueHandler"

    #"\Microsoft\Windows\NetTrace\GatherNetworkInfo"

    #"\Microsoft\Windows\Offline Files\Background Synchronization"
    #"\Microsoft\Windows\Offline Files\Logon Synchronization"

    #"\Microsoft\Windows\PI\Secure-Boot-Update"
    #"\Microsoft\Windows\PI\Sqm-Tasks"

    #"\Microsoft\Windows\Plug and Play\Device Install Group Policy"
    #"\Microsoft\Windows\Plug and Play\Device Install Reboot Required"
    #"\Microsoft\Windows\Plug and Play\Plug and Play Cleanup"
    #"\Microsoft\Windows\Plug and Play\Sysprep Generalize Drivers"

    #"\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"

    #"\Microsoft\Windows\Ras\MobilityManager"

    #"\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE"

    #"\Microsoft\Windows\Registry\RegIdleBackup"

    #"\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask"

    #"\Microsoft\Windows\RemovalTools\MRT_HB"

    #"\Microsoft\Windows\Servicing\StartComponentCleanup"

    #"\Microsoft\Windows\SettingSync\NetworkStateChangeTask"

    #"\Microsoft\Windows\Shell\CreateObjectTask"
    #"\Microsoft\Windows\Shell\FamilySafetyMonitor"
    #"\Microsoft\Windows\Shell\FamilySafetyRefresh"
    #"\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"

    #"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTask"
    #"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskLogon"
    #"\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork"

    #"\Microsoft\Windows\SpacePort\SpaceAgentTask"

    #"\Microsoft\Windows\Sysmain\HybridDriveCachePrepopulate"
    #"\Microsoft\Windows\Sysmain\HybridDriveCacheRebalance"
    #"\Microsoft\Windows\Sysmain\ResPriStaticDbSync"
    #"\Microsoft\Windows\Sysmain\WsSwapAssessmentTask"

    #"\Microsoft\Windows\SystemRestore\SR"

    #"\Microsoft\Windows\Task Manager\Interactive"

    #"\Microsoft\Windows\TextServicesFramework\MsCtfMonitor"

    #"\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime"
    #"\Microsoft\Windows\Time Synchronization\SynchronizeTime"

    #"\Microsoft\Windows\Time Zone\SynchronizeTimeZone"

    #"\Microsoft\Windows\TPM\Tpm-HASCertRetr"
    #"\Microsoft\Windows\TPM\Tpm-Maintenance"

    #"\Microsoft\Windows\UpdateOrchestrator\Maintenance Install"
    #"\Microsoft\Windows\UpdateOrchestrator\Policy Install"
    #"\Microsoft\Windows\UpdateOrchestrator\Reboot"
    #"\Microsoft\Windows\UpdateOrchestrator\Resume On Boot"
    #"\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
    #"\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_Display"
    #"\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker_ReadyToReboot"

    #"\Microsoft\Windows\UPnP\UPnPHostConfig"

    #"\Microsoft\Windows\User Profile Service\HiveUploadTask"

    #"\Microsoft\Windows\WCM\WiFiTask"

    #"\Microsoft\Windows\WDI\ResolutionHost"

    "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
    "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
    "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
    "\Microsoft\Windows\Windows Defender\Windows Defender Verification"

    "\Microsoft\Windows\Windows Error Reporting\QueueReporting"

    #"\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange"

    #"\Microsoft\Windows\Windows Media Sharing\UpdateLibrary"

    #"\Microsoft\Windows\WindowsColorSystem\Calibration Loader"

    #"\Microsoft\Windows\WindowsUpdate\Automatic App Update"
    #"\Microsoft\Windows\WindowsUpdate\Scheduled Start"
    #"\Microsoft\Windows\WindowsUpdate\sih"
    #"\Microsoft\Windows\WindowsUpdate\sihboot"

    #"\Microsoft\Windows\Wininet\CacheTask"

    #"\Microsoft\Windows\WOF\WIM-Hash-Management"
    #"\Microsoft\Windows\WOF\WIM-Hash-Validation"

    #"\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization"
    #"\Microsoft\Windows\Work Folders\Work Folders Maintenance Work"

    #"\Microsoft\Windows\Workplace Join\Automatic-Device-Join"

    #"\Microsoft\Windows\WS\License Validation"
    #"\Microsoft\Windows\WS\WSTask"

    # Scheduled tasks which cannot be disabled
    #"\Microsoft\Windows\Device Setup\Metadata Refresh"
    #"\Microsoft\Windows\SettingSync\BackgroundUploadTask"
)

foreach ($task in $tasks) {
    $parts = $task.split('\')
    $name = $parts[-1]
    $path = $parts[0..($parts.length-2)] -join '\'

    Disable-ScheduledTask -TaskName "$name" -TaskPath "$path" -ErrorAction SilentlyContinue
}

#   Description:
# This script disables unwanted Windows services. If you do not want to disable
# certain services comment out the corresponding lines below.


$services = @(
    "diagnosticshub.standardcollector.service" # Microsoft (R) Diagnostics Hub Standard Collector Service
    "DiagTrack"                                # Diagnostics Tracking Service
    "dmwappushservice"                         # WAP Push Message Routing Service (see known issues)
    "lfsvc"                                    # Geolocation Service
    "MapsBroker"                               # Downloaded Maps Manager
    "NetTcpPortSharing"                        # Net.Tcp Port Sharing Service
    "RemoteAccess"                             # Routing and Remote Access
    "RemoteRegistry"                           # Remote Registry
    "SharedAccess"                             # Internet Connection Sharing (ICS)
    "TrkWks"                                   # Distributed Link Tracking Client
    "WbioSrvc"                                 # Windows Biometric Service (required for Fingerprint reader / facial detection)
    #"WlanSvc"                                 # WLAN AutoConfig (Disabling this can cause issues with wifi connectivity)
    "WMPNetworkSvc"                            # Windows Media Player Network Sharing Service
    #"wscsvc"                                  # Windows Security Center Service
    #"WSearch"                                 # Windows Search
    "XblAuthManager"                           # Xbox Live Auth Manager
    "XblGameSave"                              # Xbox Live Game Save Service
    "XboxNetApiSvc"                            # Xbox Live Networking Service
    "ndu"                                      # Windows Network Data Usage Monitor
    # Services which cannot be disabled
    #"WdNisSvc"
)

foreach ($service in $services) {
    Write-Output "Trying to disable $service"
    Get-Service -Name $service | Set-Service -StartupType Disabled
}

#   Description:
# This script optimizes Windows updates by disabling automatic download and
# seeding updates to other computers.
#


Import-Module -DisableNameChecking $PSScriptRoot\..\lib\New-FolderForced.psm1

Write-Output "Disable automatic download and installation of Windows updates"
New-FolderForced -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "NoAutoUpdate" 1
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "AUOptions" 2
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "ScheduledInstallDay" 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\WindowsUpdate\AU" "ScheduledInstallTime" 3

Write-Output "Disable seeding of updates to other computers via Group Policies"
New-FolderForced -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" "DODownloadMode" 0

#echo "Disabling automatic driver update"
#sp "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" "SearchOrderConfig" 0

$objSID = New-Object System.Security.Principal.SecurityIdentifier "S-1-1-0"
$EveryOne = $objSID.Translate( [System.Security.Principal.NTAccount]).Value


Write-Output "Disable 'Updates are available' message"

takeown /F "$env:WinDIR\System32\MusNotification.exe"
icacls "$env:WinDIR\System32\MusNotification.exe" /deny "$($EveryOne):(X)"
takeown /F "$env:WinDIR\System32\MusNotificationUx.exe"
icacls "$env:WinDIR\System32\MusNotificationUx.exe" /deny "$($EveryOne):(X)"


# SSD life improvement


fsutil behavior set DisableLastAccess 1
fsutil behavior set EncryptPagingFile 0


@echo off
title Hybrid Performance Tweaks
echo Applying hybrid performance tweaks...

:: Requires Admin
net session >nul 2>&1 || (echo This script requires administrator privileges. Please run as admin. & pause & exit)

:: FAST STARTUP & HYBRID SLEEP
powercfg /hibernate on
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 1 /f

:: DISABLE CORE ISOLATION MEMORY INTEGRITY (causes performance issues on some devices)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f

:: Remove Bing Search from Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxNetApiSvc start= disabled
sc config XboxGipSvc start= disabled

:: Turn off suggestions in Start
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f

:: Disable "Tailored experiences"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f

:: Disable Clipboard Sync Across Devices
reg add "HKCU\Software\Microsoft\Clipboard" /v EnableClipboardHistory /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Clipboard" /v EnableCloudClipboard /t REG_DWORD /d 0 /f

:: ENABLE HARDWARE GPU SCHEDULING (if supported)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f

:: ENABLE GAME MODE
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f

:: DISABLE EXCESSIVE TELEMETRY
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc config DiagTrack start=disabled
sc config dmwappushservice start=disabled
sc config TabletInputService start=disabled
sc config MapsBroker start=disabled
sc config RetailDemo start=disabled
sc config RemoteRegistry start=disabled REM Security enhancement
sc config WerSvc start=disabled REM Windows Error Reporting
sc config WMPNetworkSvc start=disabled
sc config XblAuthManager start=disabled REM Xbox services
sc config XblGameSave start=disabled
sc config XboxNetApiSvc start=disabled
sc config Fax start=disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f

:: DISABLE DELIVERY OPTIMIZATION (optional bandwidth saver)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f

:: SMOOTHER UI - REDUCE LATENCY (Desktop & DWM tweaks)
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f
reg add "HKCU\Control Panel\Mouse" /v MouseHoverTime /t REG_SZ /d 10 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

:: REDUCE DRIVER STORE CLEANUP INTERVAL (optional)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f

:: TASK SCHEDULER OPTIMIZATION (non-critical only)
schtasks /Change /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "\Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClient" /Disable
schtasks /Change /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /Disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable


:: NETWORK STACK OPTIMIZATION (TCP tweaks)
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global rsc=enabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled

:: ENABLE DNS CACHE FOR FASTER BROWSING
sc config Dnscache start= auto
net start Dnscache

:: DISABLE NCSI ACTIVE PROBE (to reduce background traffic)
reg add "HKLM\System\CurrentControlSet\Services\NlaSvc\Parameters\Internet" /v EnableActiveProbing /t REG_DWORD /d 0 /f

:: CLEAR EVENT LOGS (optional - speeds up Event Viewer)
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (wevtutil.exe cl "%%G")

echo Performance Tweaks applied!
pause
exit

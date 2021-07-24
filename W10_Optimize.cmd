NET SESSION
if %errorlevel% NEQ 0 (
echo This script needs to be run
echo with Administrator rights.
goto end
)
echo .

echo Windows Error Reporting Service
net stop WerSvc
sc config WerSvc start= disabled
net stop Spooler
sc config Spooler start= disabled
net stop DiagTrack
sc config DiagTrack start= disabled
net stop diagnosticshub.standardcollector.service
sc config diagnosticshub.standardcollector.service start= disabled
net stop "IEEtwCollectorService"
sc config "IEEtwCollectorService" start= disabled
net stop dmwappushservice
sc config dmwappushservice start= disabled
net stop Fax
sc config Fax start= disabled
net stop MapsBroker
sc config MapsBroker start= disabled
net stop RemoteRegistry
sc config RemoteRegistry start= disabled
net stop SysMain
sc config SysMain start= disabled
net stop PhoneSvc
sc config PhoneSvc start= disabled
net stop TrkWks
sc config TrkWks start= disabled
net stop "wercplsupport"
sc config "wercplsupport" start= disabled
net stop "NvTelemetryContainer"
sc config "NvTelemetryContainer" start= disabled

sc config xbgm start=disabled
sc stop xbgm
sc config XboxGipSvc start=disabled
sc stop XboxGipSvc

sc config ClickToRunSvc start= demand
sc config BITS start= demand
sc stop NvTelemetryContainer
sc config NvTelemetryContainer start= disabled
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmMon"') do schtasks /Change /TN "%%~t" /Disable
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmRep"') do schtasks /Change /TN "%%~t" /Disable
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvTmRepOnLogon"') do schtasks /Change /TN "%%~t" /Disable
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvProfileUpdaterDaily"') do schtasks /Change /TN "%%~t" /Disable
for /f "tokens=1 delims=," %%t in ('schtasks /Query /FO CSV ^| find /v "TaskName" ^| find "NvProfileUpdaterOnLogon"') do schtasks /Change /TN "%%~t" /Disable

schtasks /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack"
schtasks /Change /DISABLE /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn"
schtasks /Change /TN "Microsoft\Windows\Defrag\ScheduledDefrag" /disable
schtasks /Change /TN "Microsoft\Windows\ErrorDetails\EnableErrorDetailsUpdate" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\RecommendedTroubleshootingScanner" /Disable
schtasks /Change /TN "Microsoft\Windows\Diagnosis\Scheduled" /Disable
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /Disable
schtasks /Change /DISABLE /TN "\Microsoft\Windows\AppID\SmartScreenSpecific"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\ApplicationData\DsSvcCleanup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\AppxDeploymentClient\Pre-staged app cleanup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Autochk\Proxy"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\CertificateServicesClient\UserTask-Roam"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Chkdsk\ProactiveScan"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Clip\License Validation"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Defrag\ScheduledDefrag"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Diagnosis\Scheduled"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\DiskCleanup\SilentCleanup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\DiskFootprint\Diagnostics"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\DiskFootprint\StorageSense"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Feedback\Siuf\DmClient"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\File Classification Infrastructure\Property Definition Sync"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\HelloFace\FODCleanupTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\InstallService\ScanForUpdates"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\InstallService\ScanForUpdatesAsUser"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\InstallService\SmartRetry"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\LanguageComponentsInstaller\ReconcileLanguageResources"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Location\Notifications"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Location\WindowsActionDialog"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Maintenance\WinSAT"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Maps\MapsToastTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Maps\MapsUpdateTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Mobile Broadband Accounts\MNO Metadata Parser"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\MUI\LPRemove"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Multimedia\SystemSoundsService"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\PI\Sqm-Tasks"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Plug and Play\Device Install Reboot Required"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Printing\EduPrintProv"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Ras\MobilityManager"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\RecoveryEnvironment\VerifyWinRE"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Registry\RegIdleBackup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\RemoteAssistance\RemoteAssistanceTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\SettingSync\BackgroundUploadTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\SettingSync\NetworkStateChangeTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Setup\SetupCleanupTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Shell\FamilySafetyMonitor"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Shell\FamilySafetyRefreshTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Shell\IndexerAutomaticMaintenance"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskLogon"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\SoftwareProtectionPlatform\SvcRestartTaskNetwork"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Speech\HeadsetButtonPress"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Speech\SpeechModelDownloadTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Sysmain\ResPriStaticDbSync"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Sysmain\WsSwapAssessmentTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan Static Task"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\UpdateOrchestrator\Schedule Scan"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\UpdateOrchestrator\UpdateModelTask"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\UpdateOrchestrator\USO_UxBroker"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\USB\Usb-Notifications"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WDI\ResolutionHost"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Cleanup"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Defender\Windows Defender Verification"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Windows Filtering Platform\BfeOnServiceStartTypeChange"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\Scheduled Start"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WindowsUpdate\sih"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WOF\WIM-Hash-Management"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WOF\WIM-Hash-Validation"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Work Folders\Work Folders Logon Synchronization"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\Work Folders\Work Folders Maintenance Work"
schtasks /Change /DISABLE /TN "\Microsoft\Windows\WS\WSTask"
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Uploader" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyUpload" /Disable
schtasks /Change /TN "Microsoft\Office\Office Automatic Updates 2.0" /Disable
schtasks /Change /TN "Microsoft\Office\Office ClickToRun Service Monitor" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates" /Disable
schtasks /Change /TN "Microsoft\Office\Office Feature Updates Logon" /Disable
schtasks /Change /TN "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack" /DISABLE
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn" /DISABLE
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentFallBack2016" /DISABLE
schtasks /change /TN "\Microsoft\Office\OfficeTelemetryAgentLogOn2016" /DISABLE
schtasks /change /TN "\Microsoft\Office\Office 15 Subscription Heartbeat" /DISABLE
schtasks /change /TN "\Microsoft\Office\Office 16 Subscription Heartbeat" /DISABLE

reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d 100
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeOut /t REG_SZ /d 2000 /f
reg add "HKCU\SOFTWARE\Classes\.bmp" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.gif" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.ico" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.jpeg" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.jpg" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.png" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Classes\.tiff" /ve /t REG_SZ /d "PhotoViewer.FileAssoc.Tiff" /f
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\15.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common" /v "QMEnable" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Common\Feedback" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Calendar" /v "EnableCalendarLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Outlook\Options\Mail" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\16.0\Word\Options" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "DisableTelemetry" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Office\Common\ClientTelemetry" /v "VerboseLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "NumberOfSIUFInPeriod" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Siuf\Rules" /v "PeriodInNanoSeconds" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "SmartScreenEnabled" /t "REG_SZ" /d "Off" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SeparateProcess" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\NVIDIA Corporation\NVControlPanel2\Client" /v "OptInOrOutPreference" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Assistance\Client\1.0" /v "NoExplicitFeedback" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\15.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Notepad" /v "StatusBar" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "Startupdelayinmsec" /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSuperHidden" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\FontCache3.0.0.0" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\PhoneSvc" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\TapiSrv" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SOFTWARE\Microsoft\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" /v "value" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "DontRetryOnError" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "IsCensusDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\ClientTelemetry" /v "TaskEnableRun" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "Max Cached Icons" /t REG_SZ /d "4096" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Program-Telemetry" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v "AllowGameDVR" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v AutoEndTasks /t REG_SZ /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v HungAppTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v "Start" /t reg_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v "Start" /t reg_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Policies" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 20 /f
for /F %%r in ('reg query "HKLM\SYSTEM\ControlSet001\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}" /f "PCI\VEN" /d /s^|Findstr HKEY') do (
reg add "%%r" /v "*EEE" /t REG_SZ /d "0" /f
reg add "%%r" /v "*FlowControl" /t REG_SZ /d "0" /f
reg add "%%r" /v "*InterruptModeration" /t REG_SZ /d "0" /f
reg add "%%r" /v "*LsoV1IPv4" /t REG_SZ /d "1" /f
reg add "%%r" /v "*LsoV2IPv4" /t REG_SZ /d "1" /f
reg add "%%r" /v "*LsoV2IPv6" /t REG_SZ /d "1" /f
reg add "%%r" /v "*ModernStandbyWoLMagicPacket" /t REG_SZ /d "0" /f
reg add "%%r" /v "*NumRssQueues" /t REG_SZ /d "1" /f
reg add "%%r" /v "*PMARPOffload" /t REG_SZ /d "0" /f
reg add "%%r" /v "*PMNSOffload" /t REG_SZ /d "0" /f
reg add "%%r" /v "*PriorityVLANTag" /t REG_SZ /d "0" /f
reg add "%%r" /v "*RSS" /t REG_SZ /d "2" /f
reg add "%%r" /v "*RssBaseProcNumber" /t REG_SZ /d "1" /f
reg add "%%r" /v "*RssMaxProcNumber" /t REG_SZ /d "1" /f
reg add "%%r" /v "*SpeedDuplex" /t REG_SZ /d "0" /f
reg add "%%r" /v "*TCPChecksumOffloadIPv4" /t REG_SZ /d "0" /f
reg add "%%r" /v "*TCPChecksumOffloadIPv6" /t REG_SZ /d "0" /f
reg add "%%r" /v "*WakeOnMagicPacket" /t REG_SZ /d "0" /f
reg add "%%r" /v "*WakeOnPattern" /t REG_SZ /d "0" /f
reg add "%%r" /v "AdvancedEEE" /t REG_SZ /d "0" /f
reg add "%%r" /v "AutoDisableGigabit" /t REG_SZ /d "0" /f
reg add "%%r" /v "EEELinkAdvertisement" /t REG_SZ /d "0" /f
reg add "%%r" /v "EnableGreenEthernet" /t REG_SZ /d "0" /f
reg add "%%r" /v "EnablePME" /t REG_SZ /d "0" /f
reg add "%%r" /v "EnableTss" /t REG_SZ /d "0" /f
reg add "%%r" /v "GigaLite" /t REG_SZ /d "0" /f
reg add "%%r" /v "ITR" /t REG_SZ /d "0" /f
reg add "%%r" /v "LogLinkStateEvent" /t REG_SZ /d "51" /f
reg add "%%r" /v "MasterSlave" /t REG_SZ /d "0" /f
reg add "%%r" /v "PowerSavingMode" /t REG_SZ /d "0" /f
reg add "%%r" /v "ReduceSpeedOnPowerDown" /t REG_SZ /d "0" /f
reg add "%%r" /v "S5WakeOnLan" /t REG_SZ /d "0" /f
reg add "%%r" /v "TxIntDelay" /t REG_SZ /d "5" /f
reg add "%%r" /v "ULPMode" /t REG_SZ /d "0" /f
reg add "%%r" /v "WaitAutoNegComplete" /t REG_SZ /d "0" /f
reg add "%%r" /v "WakeOnLink" /t REG_SZ /d "0" /f
reg add "%%r" /v "WakeOnSlot" /t REG_SZ /d "0" /f
reg add "%%r" /v "WolShutdownLinkSpeed" /t REG_SZ /d "2" /f
)

for /F %%n in ('wmic path win32_networkadapter get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "AssignmentSetOverride" /t REG_BINARY /d "04" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Enum\%%n\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePolicy" /t REG_DWORD /d "4" /f
)
PowerShell -Command "Get-AppxPackage 3DBuilder | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *bingfinance* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *BubbleWitch3Saga* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Duolingo* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Flipboard* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Paint3D* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *PandoraMediaInc* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *ScreenSketch* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *UbuntuonWindows* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Wunderlist* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zunevideo* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage CommsPhone | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage ConnectivityStore | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage Getstarted | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage Microsoft.Messaging | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage WindowsAlarms | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage WindowsPhone | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Drawboard PDF* | Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *zune* | Remove-AppxPackage"
PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'Internet-Explorer-Optional-amd64' -NoRestart"
PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SmbDirect' -NoRestart"
PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart"
PowerShell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'Microsoft-Windows-Client-EmbeddedExp-Package' -NoRestart"

echo  Tweaking Network (Be Patient...)
netsh winsock reset
netsh interface teredo set state disabled
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int ip set global neighborcachelimit=4096
netsh int ip set global taskoffload=disabled
netsh int tcp set global autotuninglevel=disable
netsh int tcp set global chimney=disabled
netsh int tcp set global dca=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global netdma=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global rss=enabled
netsh int tcp set heuristics disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int tcp set global initialRto=3000
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics=disabled
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set supplemental Internet congestionprovider=CTCP

PowerShell Disable-NetAdapterChecksumOffload -Name "*"
PowerShell Disable-NetAdapterLso -Name "*"
PowerShell Disable-NetAdapterRsc -Name "*"
PowerShell Disable-NetAdapterIPsecOffload -Name "*"
PowerShell Disable-NetAdapterPowerManagement -Name "*"
PowerShell Disable-NetAdapterQos -Name "*"
PowerShell Disable-MMAgent -MemoryCompression
PowerShell Set-NetTCPSetting -SettingName internet -MinRto 300 -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterLso -Name "*" -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterRsc -Name "*" -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterIPsecOffload -Name "*" -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterPowerManagement -Name "*" -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterChecksumOffload -Name "*" -ErrorAction SilentlyContinue
PowerShell Disable-NetAdapterEncapsulatedPacketTaskOffload -Name "*" -ErrorAction SilentlyContinue

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "10" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "18" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\kbdclass\Parameters" /v "KeyboardDataQueueSize" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouclass\Parameters" /v "MouseDataQueueSize" /t REG_DWORD /d "20" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 255 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v "EnableICSIPv6" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\MSMQ\Parameters" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "MaxOutstandingSends" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Psched" /v "TimerResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "explorer.exe" /t REG_DWORD /d "10" /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER" /v "iexplore.exe" /t REG_DWORD /d "10" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultReceiveWindow" /t REG_DWORD /d "16384" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DefaultSendWindow" /t REG_DWORD /d "16384" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DisableRawSecurity" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "DynamicSendBufferDisable" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastCopyReceiveThreshold" /t REG_DWORD /d "16384" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "FastSendDatagramThreshold" /t REG_DWORD /d "16384" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "IgnorePushBitOnReceives" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\AFD\Parameters" /v "NonBlockingSendSpecialBuffering" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d "255" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUBHDetect" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "5840" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "5840" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TCPNoDelay" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpAckFrequency" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%i" /v "TcpDelAckTicks" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MaxSockAddrLength" /t REG_DWORD /d "16" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "MinSockAddrLength" /t REG_DWORD /d "16" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\Parameters\Winsock" /v "UseDelayedAcceptance" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f

echo NTFS Tweaks
fsutil behavior set disablelastaccess 3
fsutil behavior set encryptpagingfile 0
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\FileHistory" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "IoBlockLegacyFsFilters" /t REG_DWORD /d 1 /f

setlocal ENABLEDELAYEDEXPANSION
set WHITELIST=ACPI AcpiDev AcpiPmi AFD AMDPCIDev amdgpio2 amdgpio3 AmdPPM amdpsp amdsata amdsbs amdxata asmtxhci atikmdag BasicDisplay BasicRender dc1-controll Disk DXGKrnl e1iexpress e1rexpress genericusbfn hwpolicy IntcAzAudAdd kbdclass kbdhid MMCSS monitor mouclass mouhid mountmgr mt7612US MTConfig NDIS nvdimm nvlddmkm pci PktMon Psched rt640x64 RTCore64 RzCommon RzDev_0244 Tcpip usbehci usbhub USBHUB3 USBXHCI Wdf01000 xboxgip xinputhid
for /f %%i in ('driverquery ^| findstr "!WHITELIST!"') do set "DRIVERLIST=!DRIVERLIST!%%i\0"
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "LargePageDrivers" /t REG_MULTI_SZ /d "!DRIVERLIST!" /f

:: Some settings are managed by organization
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Policies" /F
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies" /F
REG DELETE "HKEY_CURRENT_USER\Software\Policies" /F
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies" /F

for /F %%a in ('WMIC PATH Win32_USBHub GET DeviceID^| FINDSTR /L "VID_"') DO (
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "EnhancedPowerManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "AllowIdleIrpInD3" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "DeviceSelectiveSuspended" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "SelectiveSuspendOn" /t REG_DWORD /d "0" /f	
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D1Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D2Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Enum\%%a\Device Parameters" /v "fid_D3Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D1Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D2Latency" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\usbflags" /v "fid_D3Latency" /t REG_DWORD /d "0" /f
)
for /F "tokens=*" %%a in ('reg query "HKLM\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
reg add "%%a" /v "EnableIdlePowerManagement" /t REG_DWORD /d "0" /f
)
:: Remove Metadata Tracking
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /f
:: Remove Storage Sense
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\StorageSense" /f
:: Constantly pool interrupts, dynamic tick was implemented as a power saving feature for laptops
bcdedit /deletevalue useplatformclock
bcdedit /set disabledynamictick yes
:: Disable synthetic tick
bcdedit /set useplatformtick Yes
:: Enhanced Sync Policy
bcdedit /set tscsyncpolicy Enhanced
:: Disable Data Execution Prevention Security Feature
bcdedit /set nx AlwaysOff
:: Disable Emergency Management Services
bcdedit /set ems No
bcdedit /set bootems No
:: Disable code integrity services
bcdedit /set integrityservices disable
:: Disable TPM Boot Entropy policy Security Feature
bcdedit /set tpmbootentropy ForceDisable
:: Change bootmenupolicy to be able to F8
bcdedit /set bootmenupolicy Legacy
:: Disable kernel ddebugger
bcdedit /set debug No
:: Disable Virtual Secure Mode from Hyper-V
bcdedit /set hypervisorlaunchtype Off
:: Disable the Controls the loading of Early Launch Antimalware (ELAM) drivers
bcdedit /set disableelamdrivers Yes
:: Disable some of the kernel memory mitigations, gamers dont use SGX under any possible circumstance
bcdedit /set isolatedcontext No
bcdedit /set allowedinmemorysettings 0x0
:: Disable DMA memory protection and cores isolation
bcdedit /set vm No
bcdedit /set vsmlaunchtype Off
:: Enable X2Apic and enable Memory Mapping for PCI-E devices
:: (for best results, further more enable MSI mode for all devices using MSI utility or manually)
bcdedit /set x2apicpolicy Enable
bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No

echo | set /p=Restarting Explorer... 
taskkill /f /im explorer.exe >nul & explorer.exe
schtasks /delete /tn "CreateExplorerShellUnelevatedTask" /f > nul
wmic computersystem where name=”%computername%” set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=400,MaximumSize=16384
echo OK.

echo Deleting spyware tasks...
set spy_tasks=^
	"Microsoft\Office\Office 15 Subscription Heartbeat"^
	"Microsoft\Office\OfficeTelemetryAgentFallBack2016"^
	"Microsoft\Office\OfficeTelemetryAgentLogOn2016"^
	"Microsoft\Windows\AppID\SmartScreenSpecific"^
	"Microsoft\Windows\Application Experience\AitAgent"^
	"Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"^
	"Microsoft\Windows\Application Experience\ProgramDataUpdater"^
	"Microsoft\Windows\Application Experience\StartupAppTask"^
	"Microsoft\Windows\Autochk\Proxy"^
	"Microsoft\Windows\Clip\License Validation"^
	"Microsoft\Windows\CloudExperienceHost\CreateObjectTask"^
	"Microsoft\Windows\Customer Experience Improvement Program\BthSQM"^
	"Microsoft\Windows\Customer Experience Improvement Program\Consolidator"^
	"Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"^
	"Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"^
	"Microsoft\Windows\Device Information\Device"^
	"Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"^
	"Microsoft\Windows\Feedback\Siuf\DmClient"^
	"Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"^
	"Microsoft\Windows\License Manager\TempSignedLicenseExchange"^
	"Microsoft\Windows\Location\Notifications"^
	"Microsoft\Windows\Location\WindowsActionDialog"^
	"Microsoft\Windows\Maps\MapsToastTask"^
	"Microsoft\Windows\Maps\MapsUpdateTask"^
	"Microsoft\Windows\Media Center\ActivateWindowsSearch"^
	"Microsoft\Windows\Media Center\ConfigureInternetTimeService"^
	"Microsoft\Windows\Media Center\DispatchRecoveryTasks"^
	"Microsoft\Windows\Media Center\ehDRMInit"^
	"Microsoft\Windows\Media Center\InstallPlayReady"^
	"Microsoft\Windows\Media Center\mcupdate"^
	"Microsoft\Windows\Media Center\MediaCenterRecoveryTask"^
	"Microsoft\Windows\Media Center\ObjectStoreRecoveryTask"^
	"Microsoft\Windows\Media Center\OCURActivate"^
	"Microsoft\Windows\Media Center\OCURDiscovery"^
	"Microsoft\Windows\Media Center\PBDADiscovery"^
	"Microsoft\Windows\Media Center\PBDADiscoveryW1"^
	"Microsoft\Windows\Media Center\PBDADiscoveryW2"^
	"Microsoft\Windows\Media Center\PvrRecoveryTask"^
	"Microsoft\Windows\Media Center\PvrScheduleTask"^
	"Microsoft\Windows\Media Center\RegisterSearch"^
	"Microsoft\Windows\Media Center\ReindexSearchRoot"^
	"Microsoft\Windows\Media Center\SqlLiteRecoveryTask"^
	"Microsoft\Windows\Media Center\UpdateRecordPath"^
	"Microsoft\Windows\Maintenance\WinSAT"^
	"Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"^
	"Microsoft\Windows\RetailDemo\CleanupOfflineContent"^
	"Microsoft\Windows\SettingSync\BackgroundUploadTask"^
	"Microsoft\Windows\SettingSync\BackupTask"^
	"Microsoft\Windows\SettingSync\NetworkStateChangeTask"^
	"Microsoft\Windows\Shell\FamilySafetyMonitor"^
	"Microsoft\Windows\Shell\FamilySafetyMonitorToastTask"^
	"Microsoft\Windows\Shell\FamilySafetyRefresh"^
	"Microsoft\Windows\Shell\FamilySafetyRefreshTask"^
	"Microsoft\Windows\Speech\SpeechModelDownloadTask"^
	"Microsoft\Windows\Windows Defender\Windows Defender Cache Maintenance"^
	"Microsoft\Windows\Windows Defender\Windows Defender Cleanup"^
	"Microsoft\Windows\Windows Defender\Windows Defender Scheduled Scan"^
	"Microsoft\Windows\Windows Defender\Windows Defender Verification"^
	"Microsoft\Windows\Windows Error Reporting\QueueReporting"^
	"Microsoft\Windows\WindowsUpdate\Automatic App Update"^
	"Microsoft\Windows\WindowsUpdate\sih"^
	"Microsoft\Windows\WindowsUpdate\sihboot"^
	"Microsoft\Windows\WS\License Validation"^
	"Microsoft\Windows\WS\WSTask"^
	"Microsoft\XblGameSave\XblGameSaveTask"^
	"Microsoft\XblGameSave\XblGameSaveTaskLogon"
set tasks_dir=%SystemRoot%\System32\Tasks
for %%i in (%spy_tasks%) do (
	schtasks /query /tn %%i > nul 2>&1
	if not errorlevel 1 (
		echo | set /p=%%i
		schtasks /delete /tn %%i /f > nul
		set item=%%i
		set dir_path="%tasks_dir%\!item:~1!
		mkdir !dir_path!
		icacls !dir_path! /deny "Everyone:(OI)(CI)W" > nul
		set spy_task_deleted=1
		echo  [OK]
	)
)
if not defined spy_task_deleted (
	echo Spyware tasks already deleted.
)

del /F /Q "%WINDIR%\SYSTEM32\drivers\etc\hosts"
echo 127.0.0.1 localhost>>%windir%\SYSTEM32\drivers\etc\hosts
echo 127.0.0.1 localhost.localdomain>>%windir%\SYSTEM32\drivers\etc\hosts
echo 255.255.255.255 broadcasthost>>%windir%\SYSTEM32\drivers\etc\hosts
echo ::1 localhost>>%windir%\SYSTEM32\drivers\etc\hosts
echo 127.0.0.1 local>>%windir%\SYSTEM32\drivers\etc\hosts
echo ::1 ip6-localhost ip6-loopback>>%windir%\SYSTEM32\drivers\etc\hosts
echo fe00::0 ip6-localnet>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff00::0 ip6-mcastprefix>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::1 ip6-allnodes>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::2 ip6-allrouters>>%windir%\SYSTEM32\drivers\etc\hosts
echo ff02::3 ip6-allhosts>>%windir%\SYSTEM32\drivers\etc\hosts
echo. >>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.21.16.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.21.236.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.70.61>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.71.158>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.75.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.77.127>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.87.71>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 2.22.245.247>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.253.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.253.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 4.27.254.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.12.223.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.12.223.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.206.252>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.207.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.209.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.26.210.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.56.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.233.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.240.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 8.254.248.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 13.107.4.50>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.2.16.8>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.2.16.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.3.59.68>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.3.59.213>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.25.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.31.59>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.33.106.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.46.18.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.46.19.158>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.73.138.65>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.96.212.225>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.98.49.14>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.16.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.21.236>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.58.89>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 23.202.61.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 31.13.65.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 31.13.69.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 40.114.54.223>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 40.117.88.112>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 46.33.76.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 46.33.76.57>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 54.243.135.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.70>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.88>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.95>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.97>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.148.207.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.241.108.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.241.108.124>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.35>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.48>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.49>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.58>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 63.243.243.67>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.6.100>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.18>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.22>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.32>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.98>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.153>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.4.54.165>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.233.185.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 64.233.185.149>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.7>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.9>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.93>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.100.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.27>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.52>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.59>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.90>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.153>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.154>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.163>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.251>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.108.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.52.161.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.192.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.225.167>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.54.226.187>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.2.2>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.29.238>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.39.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.82>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.85>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.108>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.44.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.52.23>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.11>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.12>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.113.13>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.128.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.128.81>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.138.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.138.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.149.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.227.188>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.43>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.63>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.71>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.93>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 65.55.252.190>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.144.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.147.131>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.119.152.205>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.193>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.194>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.138.195>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.17>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.18>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.19>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.205>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.206>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 66.235.139.207>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.58>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.61>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.92>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.97>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.103>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.110>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.111>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.112>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.113>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.120>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.129>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.131>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.132>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.172>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.173>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.174>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.215>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.218>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.235>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.236>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.152.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.37>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.39>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.41>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.44>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.87>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.89>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.173>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.180>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.183>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.188>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.208>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.209>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.244>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.251>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.153.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.16>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.47>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.50>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.51>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.63>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.68>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.126>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.129>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.132>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.145>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 68.67.176.152>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.9>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.16>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.25>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.26>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.33>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.40>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.48>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.56>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 72.246.43.128>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 74.125.21.148>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 74.125.21.149>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 93.184.215.200>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.177>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.178>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 94.245.121.179>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 95.101.128.137>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 95.101.128.195>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 96.17.204.25>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 96.17.204.167>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.45.136.42>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.113.196>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.140.179>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.69.140.181>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.70.210.203>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.211.105>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.211.159>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.215.154>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.217.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.73.220.170>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 104.107.13.214>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 107.20.234.199>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 107.21.246.114>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.107.113.238>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.76>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.121>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.14.194>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.34.230>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.47>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.53>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.64>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 131.253.40.109>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.30.221>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.51.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.52.151>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.53.29>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.53.30>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.121>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.123>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.58.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.107.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.109.200>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.119.140>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.184.133>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.185.125>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.188.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 134.170.188.248>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 137.117.100.176>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.55.129.21>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.23.91>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.77.139>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.54>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.96.208>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.100.83>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 157.56.106.189>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 165.254.114.10>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 165.254.114.34>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.61.24.141>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.62.11.145>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 168.62.21.207>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 174.129.244.227>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.28.167.143>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.29.134.49>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.29.137.155>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.30.37.150>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 184.31.242.141>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.232.139.210>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.232.140.76>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.236.16.12>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 191.238.241.80>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.229.163.249>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.243.250.72>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 192.243.250.88>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 198.78.206.253>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.7.252>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.202.114>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.46.223.94>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 207.68.166.254>>%windir%\SYSTEM32\drivers\etc\hosts
echo 0.0.0.0 216.38.170.128>>%windir%\SYSTEM32\drivers\etc\hosts

ipconfig /flushdns

PAUSE
echo Final step, press any key to continue...

powercfg /h off
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61

del /s /f /q %windir%\temp\*.*    
rd /s /q %windir%\temp    
md %windir%\temp    
del /s /f /q %windir%\Prefetch\*.*    
rd /s /q %windir%\Prefetch    
md %windir%\Prefetch    
del /s /f /q %windir%\system32\dllcache\*.*    
rd /s /q %windir%\system32\dllcache    
md %windir%\system32\dllcache    
del /s /f /q "%SysteDrive%\Temp"\*.*    
rd /s /q "%SysteDrive%\Temp"    
md "%SysteDrive%\Temp"    
del /s /f /q %temp%\*.*    
rd /s /q %temp%    
md %temp%    
del /s /f /q "%USERPROFILE%\Local Settings\History"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\History"    
md "%USERPROFILE%\Local Settings\History"    
del /s /f /q "%USERPROFILE%\Local Settings\Temporary Internet Files"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files"    
md "%USERPROFILE%\Local Settings\Temporary Internet Files"    
del /s /f /q "%USERPROFILE%\Local Settings\Temp"\*.*    
rd /s /q "%USERPROFILE%\Local Settings\Temp"    
md "%USERPROFILE%\Local Settings\Temp"    
del /s /f /q "%USERPROFILE%\Recent"\*.*    
rd /s /q "%USERPROFILE%\Recent"    
md "%USERPROFILE%\Recent"    
del /s /f /q "%USERPROFILE%\Cookies"\*.*    
rd /s /q "%USERPROFILE%\Cookies"    
md "%USERPROFILE%\Cookies"
echo Select Ultimate performance scheme from Power options, All set!
PAUSE

    param([switch]$Elevated)

function Test-Admin {
    $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
    $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) {
        # tried to elevate, did not work, aborting
    } else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
    }
    exit
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "IRPStackSize" -Type DWord -Value 32
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" -Name "SizReqBuf" -Type DWord -Value 17424
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "DefaultTTL" -Type DWord -Value 64
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "TCP1323Opts" -Type DWord -Value 1
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxFreeTcbs" -Type DWord -Value 65536
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "MaxUserPort" -Type DWord -Value 65534
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name "GlobalMaxTcpWindowSize" -Type DWord -Value 65535
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettings" -Type DWord -Value 1
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Type DWord -Value 3
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Type DWord -Value 3
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" -Name "value" -Type DWord -Value 0
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" -Name "HibernateEnabled" -Type DWord -Value 0
    New-Item -Path "HKLM:SYSTEM\CurrentControlSet\Control\Power" -Name "PowerThrottling" -ItemType "directory"
    New-ItemProperty -Path "HKLM:SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -Name "PowerThrottlingOff" -Type DWord -Value 1
    Set-ItemProperty -Path "HKEY_CURRENT_USER\System\GameConfigStore" -Name "GameDVR_DXGIHonorFSEWindowsCompatible" -Type DWord -Value 1
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "SFIO Priority" -Type DWord -Value High
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Scheduling Category" -Type DWord -Value High
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "Priority" -Type DWord -Value 6
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -Name "GPU Priority" -Type DWord -Value 8
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "NetworkThrottlingIndex" -Type DWord -Value ffffffff
    Set-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -Name "SystemResponsiveness" -Type DWord -Value 00000000
    Set-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Desktop" -Name "MenuShowDelay" -Type DWord -Value 0
    Set-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Accessibility\MouseKeys" -Name "Flags" -Type DWord -Value 0
    Set-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" -Name "Flags" -Type DWord -Value 0
    Set-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response" -Name "Flags" -Type DWord -Value 0
    Set-ItemProperty -Path "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys" -Name "Flags" -Type DWord -Value 0
    New-ItemProperty -Path "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" -Name "MaintenanceDisabled" -Type DWord -Value 1
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR ") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR " -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\System\GameConfigStore") -ne $true) {  New-Item "HKCU:\System\GameConfigStore" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR ") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR " -force -ea SilentlyContinue };	
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\GameBar") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\GameBar" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\DirectX\UserGpuPreferences") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\MouseKeys") -ne $true) {  New-Item "HKCU:\Control Panel\Accessibility\MouseKeys" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\StickyKeys") -ne $true) {  New-Item "HKCU:\Control Panel\Accessibility\StickyKeys" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\Keyboard Response") -ne $true) {  New-Item "HKCU:\Control Panel\Accessibility\Keyboard Response" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Accessibility\ToggleKeys") -ne $true) {  New-Item "HKCU:\Control Panel\Accessibility\ToggleKeys" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\International\User Profile") -ne $true) {  New-Item "HKCU:\Control Panel\International\User Profile" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Personalization\Settings") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\InputPersonalization") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Siuf\Rules") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System") -ne $true) {  New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search") -ne $true) {  New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" -force -ea SilentlyContinue };
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync' -Name 'SyncPolicy' -Value 5 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'EnableTransparency' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Name 'value' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR' -Name 'AllowGameDVR' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR' -Name 'AppCaptureEnabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AllowAutoGameMode' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AutoGameModeEnabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' -Name 'HwSchMode' -Value 2 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\DirectX\UserGpuPreferences' -Name 'DirectXUserGlobalSettings' -Value 'VRROptimizeEnable=0;' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Accessibility\MouseKeys' -Name 'Flags' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Accessibility\StickyKeys' -Name 'Flags' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Accessibility\Keyboard Response' -Name 'Flags' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Accessibility\ToggleKeys' -Name 'Flags' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\International\User Profile' -Name 'HttpAcceptLanguageOptOut' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_TrackProgs' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353694Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353696Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy' -Name 'HasAccepted' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Personalization\Settings' -Name 'AcceptedPrivacyPolicy' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitInkCollection' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization' -Name 'RestrictImplicitTextCollection' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore' -Name 'HarvestContacts' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack' -Name 'ShowedToastAtLevel' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy' -Name 'TailoredExperiencesWithDiagnosticDataEnabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey' -Name 'EnableEventTranscript' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	Remove-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'PublishUserActivities' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\System' -Name 'UploadUserActivities' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener' -Name 'Value' -Value 'Deny' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location' -Name 'Value' -Value 'Deny' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics' -Name 'Value' -Value 'Deny' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation' -Name 'Value' -Value 'Deny' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search' -Name 'BackgroundAppGlobalToggle' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\System\GameConfigStore") -ne $true) {  New-Item "HKCU:\System\GameConfigStore" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Desktop") -ne $true) {  New-Item "HKCU:\Control Panel\Desktop" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Control" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance") -ne $true) {  New-Item "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "HKLM:\SYSTEM\CurrentControlSet\Control\Power") -ne $true) {  New-Item "HKLM:\SYSTEM\CurrentControlSet\Control\Power" -force -ea SilentlyContinue };
	New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling' -Name 'PowerThrottlingOff' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'NetworkThrottlingIndex' -Value 10 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile' -Name 'SystemResponsiveness' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Affinity' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Background Only' -Value 'False' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Clock Rate' -Value 10000 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'GPU Priority' -Value 8 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Priority' -Value 6 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'Scheduling Category' -Value 'High' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games' -Name 'SFIO Priority' -Value 'High' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehaviorMode' -Value 2 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_HonorUserFSEBehaviorMode' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_DXGIHonorFSEWindowsCompatible' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\System\GameConfigStore' -Name 'GameDVR_EFSEFeatureFlags' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'AutoEndTasks' -Value '1' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'HungAppTimeout' -Value '1000' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'WaitToKillAppTimeout' -Value '2000' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'LowLevelHooksTimeout' -Value '1000' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Desktop' -Name 'MenuShowDelay' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control' -Name 'WaitToKillServiceTimeout' -Value '2000' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance' -Name 'MaintenanceDisabled' -Value 1 -PropertyType DWord -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKLM:\SYSTEM\CurrentControlSet\Control\Power' -Name 'HibernateEnabled' -Value 0 -PropertyType DWord -Force -ea SilentlyContinue;
	
	if((Test-Path -LiteralPath "HKCU:\Control Panel\Mouse") -ne $true) {  New-Item "HKCU:\Control Panel\Mouse" -force -ea SilentlyContinue };
	if((Test-Path -LiteralPath "Registry::\HKEY_USERS\.DEFAULT\Control Panel\Mouse") -ne $true) {  New-Item "Registry::\HKEY_USERS\.DEFAULT\Control Panel\Mouse" -force -ea SilentlyContinue };
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Mouse' -Name 'MouseSensitivity' -Value '10' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Mouse' -Name 'SmoothMouseXCurve' -Value ([byte[]](0x	00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x	C0,0xCC,0x0C,0x00,0x00,0x00,0x00,0x00,0x	80,0x99,0x19,0x00,0x00,0x00,0x00,0x00,0x	40,0x66,0x26,0x00,0x00,0x00,0x00,0x00,0x	00,0x33,0x33,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'HKCU:\Control Panel\Mouse' -Name 'SmoothMouseYCurve' -Value ([byte[]](0x	00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x	00,0x00,0x38,0x00,0x00,0x00,0x00,0x00,0x	00,0x00,0x70,0x00,0x00,0x00,0x00,0x00,0x	00,0x00,0xA8,0x00,0x00,0x00,0x00,0x00,0x	00,0x00,0xE0,0x00,0x00,0x00,0x00,0x00)) -PropertyType Binary -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'Registry::\HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseSpeed' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'Registry::\HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseThreshold1' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
	New-ItemProperty -LiteralPath 'Registry::\HKEY_USERS\.DEFAULT\Control Panel\Mouse' -Name 'MouseThreshold2' -Value '0' -PropertyType String -Force -ea SilentlyContinue;
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettings" -Type DWord -Value 1
	New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverride" -Type DWord -Value 3
	New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" -Name "FeatureSettingsOverrideMask" -Type DWord -Value 3
	
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name "AllowTelemetry" -Type DWord -Value 0
	
	Write-Host "Disabling Wi-Fi Sense..."
	If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting")) {
		New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowWiFiHotSpotReporting" -Name "Value" -Type DWord -Value 0
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\WiFi\AllowAutoConnectToWiFiSenseHotspots" -Name "Value" -Type DWord -Value 0
	
	Write-Host "Disabling SmartScreen Filter..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" -Name "SmartScreenEnabled" -Type String -Value "Off"
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" -Name "EnableWebContentEvaluation" -Type DWord -Value 0
	$edge = (Get-AppxPackage -AllUsers "Microsoft.MicrosoftEdge").PackageFamilyName
	If (!(Test-Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\$edge\MicrosoftEdge\PhishingFilter")) {
		New-Item -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\$edge\MicrosoftEdge\PhishingFilter" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\$edge\MicrosoftEdge\PhishingFilter" -Name "EnabledV9" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\$edge\MicrosoftEdge\PhishingFilter" -Name "PreventOverride" -Type DWord -Value 0
	
	Write-Host "Disabling Application suggestions..."
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "ContentDeliveryAllowed" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "OemPreInstalledAppsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "PreInstalledAppsEverEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SilentInstalledAppsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338389Enabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SystemPaneSuggestionsEnabled" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name "SubscribedContent-338388Enabled" -Type DWord -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name "DisableWindowsConsumerFeatures" -Type DWord -Value 1
	
	If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules")) {
		New-Item -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Siuf\Rules" -Name "NumberOfSIUFInPeriod" -Type DWord -Value 0
	
	Write-Host "Disabling Error reporting..."
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Type DWord -Value 1
	Write-Host "Removing AutoLogger file and restricting directory..."
	$autoLoggerDir = "$env:PROGRAMDATA\Microsoft\Diagnosis\ETLLogs\AutoLogger"
	If (Test-Path "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl") {
		Remove-Item "$autoLoggerDir\AutoLogger-Diagtrack-Listener.etl"
	}
	icacls $autoLoggerDir /deny SYSTEM:`(OI`)`(CI`)F | Out-Null
	
	Write-Host "Stopping and disabling Diagnostics Tracking Service..."
	Stop-Service "DiagTrack" -WarningAction SilentlyContinue
	Set-Service "DiagTrack" -StartupType Disabled
	Write-Host "Stopping and disabling WAP Push Service..."
	Stop-Service "dmwappushservice" -WarningAction SilentlyContinue
	Set-Service "dmwappushservice" -StartupType Disabled
	Write-Host "Disabling Windows Defender..."
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Force | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Type DWord -Value 1
	Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "SecurityHealth" -ErrorAction SilentlyContinue
	Write-Host "Disabling Windows Defender Cloud..."
    If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet")) {
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Force | Out-Null
    }
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SpynetReporting" -Type DWord -Value 0
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" -Name "SubmitSamplesConsent" -Type DWord -Value 2
	Stop-Service "SysMain" -WarningAction SilentlyContinue
	Set-Service "SysMain" -StartupType Disabled
	Stop-Service "WSearch" -WarningAction SilentlyContinue
	Set-Service "WSearch" -StartupType Disabled
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "DragFullWindows" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "MenuShowDelay" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Type Binary -Value ([byte[]](0x90,0x12,0x03,0x80,0x10,0x00,0x00,0x00))
	Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Type String -Value 0
	Set-ItemProperty -Path "HKCU:\Control Panel\Keyboard" -Name "KeyboardDelay" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewAlphaSelect" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ListviewShadow" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarAnimations" -Type DWord -Value 0
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" -Name "VisualFXSetting" -Type DWord -Value 3
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\DWM" -Name "EnableAeroPeek" -Type DWord -Value 0
	Write-Host "Disabling creation of Thumbs.db..."
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbnailCache" -Type DWord -Value 1
	Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "DisableThumbsDBOnNetworkFolders" -Type DWord -Value 1
	Write-Host "Disabling Xbox features..."
	Get-AppxPackage "Microsoft.XboxApp" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxIdentityProvider" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxSpeechToTextOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.XboxGameOverlay" | Remove-AppxPackage
	Get-AppxPackage "Microsoft.Xbox.TCUI" | Remove-AppxPackage
	Set-ItemProperty -Path "HKCU:\System\GameConfigStore" -Name "GameDVR_Enabled" -Type DWord -Value 0
	If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR")) {
		New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" | Out-Null
	}
	Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Type DWord -Value 0
	 $services = @(
        "diagnosticshub.standardcollector.service"	# Microsoft (R) Diagnostics Hub Standard Collector Service
        "MapsBroker"								# Downloaded Maps Manager
        "NetTcpPortSharing"                     	# Net.Tcp Port Sharing Service
        "TrkWks"                                   	# Distributed Link Tracking Client
        "WbioSrvc"                               	# Windows Biometric Service
		"WMPNetworkSvc" 							# Windows Media Player Network Sharing Service
        "AppVClient"
        "RemoteRegistry"
        "CDPSvc"
        "shpamsvc"
        "SCardSvr"
        "UevAgentService"
        "PeerDistSvc"
        "lfsvc"
        "HvHost"
        "vmickvpexchange"
        "vmicguestinterface"
        "vmicshutdown"
        "vmicheartbeat"
        "vmicvmsession"
        "vmicrdv"
        "vmictimesync"
        "vmicvss"
        "irmon"
        "SharedAccess"
        "SmsRouter"
        "CscService"
        "SEMgrSvc"
        "PhoneSvc"
        "RpcLocator"
        "RetailDemo"
        "SensorDataService"
        "SensrSvc"
        "SensorService"
        "ScDeviceEnum"
        "SCPolicySvc"
        "SNMPTRAP"
        "WFDSConSvc"
        "FrameServer"
        "wisvc"
        "icssvc"
        "WwanSvc"
    )

    foreach ($service in $services) {
        if (Get-Service $service -ErrorAction SilentlyContinue)
        {
            Write-Host "Stopping and disabling $service"
            Stop-Service -Name $service
            Get-Service -Name $service | Set-Service -StartupType Disabled
        } else {
            Write-Host "Skipping $service (does not exist)"
        }
    }

 Write-Host "Cleaning up temporary files..."
    $tempfolders = @("C:\Windows\Temp\*", "C:\Windows\Prefetch\*", "C:\Documents and Settings\*\Local Settings\temp\*", "C:\Users\*\Appdata\Local\Temp\*")
    Remove-Item $tempfolders -force -recurse 2>&1 | Out-Null
	Write-Host "Cleaning WinSXS folder, this may take a while, please wait..."
    Dism.exe /online /Cleanup-Image /StartComponentCleanup
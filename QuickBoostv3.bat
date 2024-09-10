@echo off
setlocal EnableDelayedExpansion

:: Check for admin rights
NET SESSION >nul 2>&1
if %ERRORLEVEL% neq 0 (
    echo This script requires administrator privileges.
    echo Please run this script as an administrator.
    pause
    exit /b 1
)

echo Windows 10/11 Optimization Script
echo ================================
echo.
echo This script will optimize your Windows system for better performance.
echo It will disable some services and features while preserving essential functionality.
echo.
echo IMPORTANT: Please read through the script and understand what it does before running.
echo It's recommended to create a system restore point before proceeding.
echo.
pause

:: Disable unnecessary services
echo Disabling unnecessary services...
for %%s in (
    DiagTrack dmwappushservice MapsBroker PcaSvc RemoteRegistry RetailDemo TrkWks
    WerSvc XblAuthManager XblGameSave XboxNetApiSvc WSearch WMPNetworkSvc W32Time
    CDPSvc CDPUserSvc lfsvc geolocation SysMain wuauserv
) do (
    sc config %%s start= disabled
    sc stop %%s
)

:: Disable unnecessary scheduled tasks
echo Disabling unnecessary scheduled tasks...
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /DISABLE
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /DISABLE
schtasks /Change /TN "Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /DISABLE
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /DISABLE

:: Ensure essential services remain enabled
echo Ensuring essential services remain enabled...
for %%s in (spooler fdphost fdrespub LanmanServer LanmanWorkstation) do (
    sc config %%s start= auto
    sc start %%s
)

:: Disable telemetry and other features
echo Disabling telemetry and other features...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v DisableFileSyncNGSC /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v DisableWindowsConsumerFeatures /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

:: Optimize visual settings
echo Optimizing visual settings...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

:: Optimize system settings
echo Optimizing system settings...
powercfg /h off
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v ServicesPipeTimeout /t REG_DWORD /d 3000 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreen /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f

:: Clean up temp files
echo Cleaning up temporary files...
del /q/f/s %TEMP%\*
del /q/f/s C:\Windows\Temp\*

:: Optimize SSD if present
echo Optimizing SSD if present...
for /f "tokens=2 delims==" %%a in ('wmic logicaldisk where "DriveType=3" get DeviceID /value') do (
    fsutil behavior set DisableLastAccess 1 %%a
    fsutil behavior set EncryptPagingFile 0 %%a
)

echo.
echo System optimization complete. Some changes require a reboot to take effect.
echo Please review the changes and reboot your system when ready.
pause
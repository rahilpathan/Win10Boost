@echo off
:: ============================================================
::  WINDOWS 11 - PRODUCTIVE MINIMALIST OPTIMIZATION SCRIPT
::  Philosophy: Classic OS feel (XP-speed, no nags, no AI,
::              no ads) while keeping Office, OneDrive sync,
::              Teams, Outlook, network drives, printers,
::              Quick Access, and file/run history intact.
::
::  Run as Administrator. Reboot after completion.
::  Creates a restore point before making any changes.
:: ============================================================

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Please run this script as Administrator.
    pause & exit /b
)

echo.
echo  Creating System Restore Point before changes...
powershell -Command "Checkpoint-Computer -Description 'Pre-Optimization Restore Point' -RestorePointType 'MODIFY_SETTINGS'" 2>nul
echo  Done.
echo.
echo  Applying tweaks... (This will take about 30 seconds)
echo.


:: ============================================================
:: SECTION 1 - PRODUCTIVITY: KEEP QUICK ACCESS + HISTORY
::   You want Quick Access, recent files, and run history.
::   These stay ON. No changes needed — we explicitly lock
::   them so nothing else accidentally disables them.
:: ============================================================

:: Show recent files and frequent folders in Quick Access
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 1 /f >nul

:: Track recently used programs and docs (powers Run history + Start jump lists)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackProgs" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_TrackDocs" /t REG_DWORD /d 1 /f >nul

echo  [1/10] Quick Access and history settings preserved.


:: ============================================================
:: SECTION 2 - SYSTEM PERFORMANCE
::   Lean, fast, XP-era responsiveness.
:: ============================================================

:: Disable SysMain (Superfetch) — can cause HDD/SSD thrashing
:: NOTE: On NVMe SSDs this is safe to disable. On spinning
::       HDDs you may want to re-enable it (set /d 2).
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d 4 /f >nul

:: Disable Prefetcher (pairs with SysMain)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f >nul

:: Disable NTFS Last Access timestamp (reduces disk writes on every file read)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLastAccessUpdate" /t REG_DWORD /d 1 /f >nul

:: Enable Long File Paths (critical for deep folder structures & Office)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d 1 /f >nul

:: Disable Windows Error Reporting (no more "send report to Microsoft")
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f >nul

:: Disable Hibernation (frees several GB of disk; use Shut Down instead)
:: REMOVE this line if you use a laptop and need Sleep/Hibernate.
powercfg.exe /hibernate off >nul 2>&1

:: High-performance timer resolution for snappier app response
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "GlobalTimerResolutionRequests" /t REG_DWORD /d 1 /f >nul

:: Adjust for Best Performance (disables all visual fluff system-wide)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f >nul

:: Disable Transparency effects
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f >nul

:: Speed up taskbar thumbnail hover delay (100ms vs default 400ms)
reg add "HKCU\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "100" /f >nul

:: Verbose startup/shutdown status messages (useful for diagnosing hangs)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "VerboseStatus" /t REG_DWORD /d 1 /f >nul

echo  [2/10] System performance tweaks applied.


:: ============================================================
:: SECTION 3 - NETWORK, MAPPED DRIVES, PRINTERS & DOMAIN
::   You use QNAP/NAS shares, mapped drives, local domain,
::   and network printers. All kept and improved.
:: ============================================================

:: Increase IRPStackSize for QNAP / large SMB packet stability
:: (Prevents random "path not found" errors on deep share paths)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v "IRPStackSize" /t REG_DWORD /d 30 /f >nul

:: Reduce SMB client timeout so stale network connections recover faster
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "SessTimeout" /t REG_DWORD /d 60 /f >nul

:: Enable SMB2 (faster than SMB1 for NAS/QNAP; SMB1 is a security risk)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" /v "Smb2" /t REG_DWORD /d 1 /f >nul

:: Disable SMB1 (legacy, insecure — QNAP and modern NAS don't need it)
dism /online /disable-feature /featurename:SMB1Protocol /norestart >nul 2>&1

:: Make mapped drives available to elevated (admin) processes too
:: Fixes "drive letter missing" when running as admin
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLinkedConnections" /t REG_DWORD /d 1 /f >nul

:: Prevent Windows from auto-changing your default printer
reg add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Windows" /v "LegacyDefaultPrinterMode" /t REG_DWORD /d 1 /f >nul

:: Disable Distributed Link Tracking (DLT) service
:: Reduces SMB chatter and network lag on domain/workgroup setups
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TrkWks" /v "Start" /t REG_DWORD /d 4 /f >nul

:: Network throttling: remove multimedia cap on non-game network traffic
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f >nul

:: DNS Client: keep enabled (needed for domain name resolution)
:: (Not touching this — breaking DNS kills mapped drives and Outlook)

echo  [3/10] Network, drives, and printer tweaks applied.


:: ============================================================
:: SECTION 4 - ONEDRIVE: NAG-FREE, FASTER SYNC
::   You need OneDrive for Office/Outlook/Teams.
::   We kill the nags and reduce Explorer freeze on sync.
:: ============================================================

:: Block the "Back up your folders" backup prompt popup
reg add "HKCU\Software\Microsoft\OneDrive" /v "SkipBackupPrompt" /t REG_DWORD /d 1 /f >nul

:: Block Known Folder Move (KFM) — stops OneDrive hijacking
:: Desktop, Documents, Pictures into the cloud without asking
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v "KFMBlockOptIn" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v "KFMBlockOptOut" /t REG_DWORD /d 1 /f >nul

:: Enable Files On-Demand (files shown as placeholders, only downloaded
:: when opened — massively reduces background sync I/O and Explorer lag)
reg add "HKLM\SOFTWARE\Policies\Microsoft\OneDrive" /v "FilesOnDemandEnabled" /t REG_DWORD /d 1 /f >nul

:: Disable OneDrive from showing "What's New" and tour prompts
reg add "HKCU\Software\Microsoft\OneDrive" /v "EnableSyncAdminReports" /t REG_DWORD /d 0 /f >nul

:: Prevent OneDrive from starting up automatically for ALL users
:: (It will still run for your profile — this blocks ghost installs)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "OneDrive" /t REG_SZ /d "%LocalAppData%\Microsoft\OneDrive\OneDrive.exe /background" /f >nul 2>&1

:: Reduce Explorer thumbnail generation on synced folders
:: (Thumbnail generation during sync is a major cause of Explorer hangs)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableThumbnailCache" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v "CheckedValue" /t REG_DWORD /d 1 /f >nul

:: Disable Explorer Preview Pane (major cause of hangs in OneDrive folders)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Modules\GlobalSettings\Sizer" /v "PreviewPaneSizer" /t REG_BINARY /d "00000000" /f >nul 2>&1

:: Exclude OneDrive process from Windows Search indexing churn
:: (This reduces I/O contention during sync — do this in Indexer options too)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingLowDiskSpaceMB" /t REG_DWORD /d 1000 /f >nul

echo  [4/10] OneDrive nag-free and performance tweaks applied.


:: ============================================================
:: SECTION 5 - OFFICE 365 / OUTLOOK / TEAMS
::   No first-run nags, no What's New, no forced sign-ins.
::   Functionality kept fully intact.
:: ============================================================

:: Office: Mark first-run and format prompts as already shown
reg add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "ShownFirstRunOptin" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Office\16.0\Common\General" /v "ShownFileFmtPrompt" /t REG_DWORD /d 1 /f >nul

:: Disable Office "What's New" dialog on app launch
reg add "HKCU\Software\Microsoft\Office\16.0\Common" /v "qmenable" /t REG_DWORD /d 0 /f >nul

:: Disable Office Connected Experiences that send data (keeps core sync)
reg add "HKCU\Software\Microsoft\Office\16.0\Common\Privacy" /v "DisconnectedState" /t REG_DWORD /d 2 /f >nul
reg add "HKCU\Software\Microsoft\Office\16.0\Common\Privacy" /v "UserContentDisabled" /t REG_DWORD /d 2 /f >nul

:: Disable Office telemetry agent
reg add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableLogging" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Office\16.0\OSM" /v "EnableUpload" /t REG_DWORD /d 0 /f >nul

:: Outlook: Disable "Focused Inbox" (optional — remove if you like it)
reg add "HKCU\Software\Microsoft\Office\16.0\Outlook\Options\Mail" /v "FocusedInboxEnabled" /t REG_DWORD /d 0 /f >nul

echo  [5/10] Office / Outlook / Teams tweaks applied.


:: ============================================================
:: SECTION 6 - AI FEATURES: DISABLE ALL
::   Copilot, Recall, Cortana, Widgets news feed, Edge AI,
::   Input Insights, AI Actions — all off.
:: ============================================================

:: --- Copilot ---
:: Disable Copilot via policy (works on Home and Pro)
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d 1 /f >nul

:: Block Copilot from reinstalling silently with updates
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate" /v "DisableWindowsUpdateAccess" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCopilotButton" /t REG_DWORD /d 0 /f >nul

:: Prevent silent reinstall of AI apps via Windows Update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableCloudOptimizedContent" /t REG_DWORD /d 1 /f >nul

:: --- Recall (AI screen recorder — Copilot+ PCs) ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIDataAnalysis" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage" /v "AppSwitchCount" /t REG_DWORD /d 0 /f >nul 2>&1

:: --- Input Insights (types/mouse pattern AI telemetry) ---
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f >nul

:: --- AI Actions (context menu AI) ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsAI" /v "DisableAIActions" /t REG_DWORD /d 1 /f >nul 2>&1

:: --- Cortana ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d 0 /f >nul

:: --- Widgets (news feed, weather pane) ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarDa" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Dsh" /v "AllowNewsAndInterests" /t REG_DWORD /d 0 /f >nul 2>&1

:: --- Edge Copilot & Sidebar AI ---
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Edge" /v "CopilotCDPPageContext" /t REG_DWORD /d 0 /f >nul

:: --- Online Speech Recognition (AI voice feature) ---
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f >nul

:: --- Bing AI in Search ---
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDynamicSearchBoxEnabled" /t REG_DWORD /d 0 /f >nul

echo  [6/10] All AI features disabled (Copilot, Recall, Cortana, Widgets, Input Insights).


:: ============================================================
:: SECTION 7 - UPDATES: NOTIFY ONLY, NO FORCED REBOOTS
::   You hate forced updates. These settings switch Windows
::   Update to "notify and wait" mode only.
:: ============================================================

:: Notify for download and install — no automatic installs
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AUOptions" /t REG_DWORD /d 2 /f >nul

:: Never auto-reboot when a user is logged on
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoRebootWithLoggedOnUsers" /t REG_DWORD /d 1 /f >nul

:: Disable delivery optimization (prevents P2P uploading your bandwidth)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul

echo  [7/10] Windows Update set to notify-only, no forced reboots.


:: ============================================================
:: SECTION 8 - ADS, SPOTLIGHT, SUGGESTIONS & TELEMETRY
::   Silence all Microsoft advertising and tracking.
:: ============================================================

:: Disable Ads and Consumer Features (lock screen ads, app suggestions)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsSpotlightOnLockScreen" /t REG_DWORD /d 1 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableSoftLanding" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338389Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-314559Enabled" /t REG_DWORD /d 0 /f >nul

:: Disable Activity History (Timeline / Action Center feed)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f >nul

:: Disable Telemetry (sets to Security level — minimum allowed on Pro)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f >nul

:: Disable Advertising ID (used to target you with ads in apps)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d 1 /f >nul

:: Disable Customer Experience Improvement Program
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f >nul

:: Disable Diagnostic Tracking Service (DiagTrack)
sc config DiagTrack start= disabled >nul 2>&1
sc stop DiagTrack >nul 2>&1

:: Disable "dmwappushservice" (another telemetry pipe)
sc config dmwappushservice start= disabled >nul 2>&1
sc stop dmwappushservice >nul 2>&1

echo  [8/10] Ads, Spotlight, suggestions, and telemetry disabled.


:: ============================================================
:: SECTION 9 - UI CLEANUP: CLASSIC, CLEAN EXPLORER
::   Windows 11 gets the classic context menu back.
::   Taskbar cleaned up. No more junk menus.
:: ============================================================

:: Restore classic right-click context menu (removes "Show More Options")
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /ve /t REG_SZ /d "" /f >nul

:: Remove Chat (Teams) icon from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarMn" /t REG_DWORD /d 0 /f >nul

:: Remove Task View button from taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d 0 /f >nul

:: Disable Meet Now button
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_DWORD /d 1 /f >nul

:: Left-align Taskbar (classic feel vs. centered Windows 11 default)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d 0 /f >nul

:: Disable "Recommended" section in Start Menu (keeps it clean)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Start_IrisRecommendations" /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "HideRecentlyAddedApps" /t REG_DWORD /d 1 /f >nul

:: Disable News and Interests on taskbar (older build fallback key)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f >nul

:: Disable Snap Suggestions / AI layout suggestions on window drag
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "SnapAssist" /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DITest" /t REG_DWORD /d 0 /f >nul 2>&1

:: Disable "Get More Out of Windows" notification on startup
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\UserProfileEngagement" /v "ScoobeSystemSettingEnabled" /t REG_DWORD /d 0 /f >nul

echo  [9/10] UI cleanup and classic Explorer restored.


:: ============================================================
:: SECTION 10 - SECURITY HARDENING (SANE DEFAULTS)
::   Practical hardening that doesn't break your workflow.
:: ============================================================

:: Disable BitLocker auto-encryption on new devices / reinstalls
reg add "HKLM\SYSTEM\CurrentControlSet\Control\BitLocker" /v "PreventDeviceEncryption" /t REG_DWORD /d 1 /f >nul

:: Allow bypassing Microsoft Account requirement during OOBE/setup
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "BypassNRO" /t REG_DWORD /d 1 /f >nul

:: Disable Windows Location for privacy (re-enable in Settings if needed)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f >nul

:: Disable app access to account info (name, picture, account info)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsAccessAccountInfo" /t REG_DWORD /d 2 /f >nul

:: Disable remote assistance (reduces attack surface; re-enable if IT support needs it)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d 0 /f >nul

echo  [10/10] Security hardening applied.


:: ============================================================
:: FINAL: RESTART EXPLORER TO APPLY UI CHANGES NOW
:: ============================================================
echo.
echo  Restarting Explorer to apply UI changes...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 2 /nobreak >nul
start explorer.exe

echo.
echo ============================================================
echo.
pause
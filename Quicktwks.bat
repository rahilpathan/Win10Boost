::RUN CMD AD ADMIN
%SystemRoot%\System32\reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /f /t REG_SZ /v "C:\WINDOWS\system32\cmd.exe" /d "RUNASADMIN"

::PREFETCH SETTINGS (If Windows installed on SSD drive - set 0, HDD - 3)
SET Prefetch=0

::::: REMOVING WINDOWS DEFAULT APPS ::::: 
::(Keeping Calculator, Sound recorder, BingWeather, Dolby, Netflix, Hulu, PrimeVideo, Spotify, Skype, Viber)
Powershell -Command "Get-AppxPackage -allusers *3DBuilder*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ACGMediaPlayer*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ActiproSoftwareLLC*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AdobePhotoshopExpress*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AdobeSystemsIncorporated.AdobePhotoshopExpress*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Advertising.Xaml*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Advertising.Xml*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *alarm*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AppConnector*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Asphalt8Airborne*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AutodeskSketchBook*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingFinance*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingNews*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingSports*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingTranslator*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BubbleWitch3Saga*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *CandyCrush*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *CyberLinkMediaSuiteEssentials*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *DisneyMagicKingdoms*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *DrawboardPDF*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Duolingo*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Duolingo-LearnLanguagesforFree*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *EclipseManager*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Facebook*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *FarmVille2CountryEscape*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Flipboard*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *GetHelp*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *groove*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *HiddenCity*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *HiddenCityMysteryofShadows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Keeper*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *king.com.FarmHeroesSaga*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Lens*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *LinkedInforWindows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *maps*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MarchofEmpires*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Messaging*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Microsoft3DViewer*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftOfficeHub*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftPowerBIForWindows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MixedReality.Portal*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *NetworkSpeedTest*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Pandora*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *PandoraMediaInc*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *photoshop*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Plex*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Print3D*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *reality*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RemoteDesktop*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Roblox*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ROBLOXCORPORATION.ROBLOX*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RoyalRevolt*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RoyalRevolt2*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ScreenSketch*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *SpeedTest*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Sway*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *tiktok*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Twitter*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WinZipUniversal*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Wunderlist*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *XING*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *zune*|Remove-AppxPackage"



::::::VISUAL OPTIMIZATIONS::::::

::BEST APPEARANCE SETTINGS (DOES NOT AFFECT PERFORMANCE)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 0x00000001 /f

::ENABLE PEEK
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisablePreviewDesktop" /t REG_DWORD /d "0" /f 1>NUL 2>NUL

::WALLPAPER QUALITY TWEAK
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t "REG_DWORD" /d "100" /f

::SHOW THIS PC ON DESKTOP
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f

::ALWAYS SHOW STATUS BAR
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowStatusBar" /t REG_DWORD /d "1" /f

::DISABLE WINDOWS AERO SHAKE
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f

::REMOVE PEOPLE BUTTON
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v "PeopleBand" /t REG_DWORD /d "0" /f

::DISABLE ACTIVITY FEED
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d "0" /f

::DISABLE TASK VIEW BUTTON
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowTaskViewButton" /t REG_DWORD /d "0" /f

::PIN THE RIBBON IN FILE EXPLORER (IF NEEDED MINIMISED CHANGE THE VALUE FROM 4 to 3 BELOW)
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "ExplorerRibbonStartsMinimized" /t REG_DWORD /d 4 /f

::RESTORE NETWORK FOLDER CONNECTION (UNABLE TO FIND)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider" /v "RestoreConnection" /t REG_DWORD /d 0 /f

::AUTO-ARRANGE ICONS ON DESKTOP
::reg add "HKCU\Software\Microsoft\Windows\Shell\Bags\1\Desktop" /v "FFlags" /t REG_DWORD /d "1075839525" /f

::OPEN THIS PC instead of QUICK ACCESS
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "LaunchTo" /t REG_DWORD /d "1" /f

::DISABLE MEET NOW
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "HideSCAMeetNow" /t REG_dWORD /d 1 /f

::DISABLE NEWS & WEATHER
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /t REG_DWORD /d 2 /f

::SHOW HIDDEN FILES
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f

::SHOW SUPERHIDDEN (OS) FILES - NOT RECOMMENDED
:: reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f

::REMOVE EDGE SHORTCUT
PowerShell -Command "((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Edge'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}"

::REMOVE STORE SHORTCUT
PowerShell -Command "((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Store'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}"

::DISABLE COMBINE IN TASKBAR ONLY WHEN FULL
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_dWORD /d 1 /f

::DISABLE WINDOWS TIPS
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f

::ALLOW FILE PATH MORE THAN 260 CHARS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "LongPathsEnabled" /t REG_DWORD /d "1" /f

::QUICK RESPONSES BY EXPLORER
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsolutePointerAsAbsolute" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v "TreatAbsoluteAsRelative" /t REG_DWORD /d "0" /f

::DISABLE FILE EXPLORER ADS
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowSyncProviderNotifications" /t REG_DWORD /d "0" /f

::DISABLE STARTUP DELAY (LOAD ALL STARTUP APP ASAP)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d "0" /f

::SHOW FILE EXTENSIONS
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKCR\lnkfile" /v "NeverShowExt" /f
reg add "HKCR\IE.AssocFile.URL" /v "NeverShowExt" /f
reg add "HKCR\IE.AssocFile.WEBSITE" /v "NeverShowExt" /f
reg add "HKCR\InternetShortcut" /v "NeverShowExt" /f
reg add "HKCR\Microsoft.Website" /v "NeverShowExt" /f
reg add "HKCR\piffile" /v "NeverShowExt" /f
reg add "HKCR\SHCmdFile" /v "NeverShowExt" /f
reg add "HKCR\LibraryFolder" /v "NeverShowExt" /f

::ALLOW ANIMATIONS
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v "DefaultApplied" /t REG_DWORD /d 0x00000001 /f

::ENABLE DARK THEME
::reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
::reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
::reg add "HKCU\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" /v "Theme" /t REG_DWORD /d "1" /f

::ENABLE CLASSIC CONTROL PANEL
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v StartupPage /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v AllItemsIconView /d 2 /t REG_DWORD /f

::ENABLE NUMLOCK ON STARTUP
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d "2147483650" /f
reg add "HKCU\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
reg add "HKCU\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "KeyboardDelay" /t REG_SZ /d "0" /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "KeyboardSpeed" /t REG_SZ /d "31" /f

::REMOVE SHORTCUT TEXT FROM SHORTCUTS (s:tenforums.com)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v "ShortcutNameTemplate" /t REG_SZ /d "\"%%s.lnk\"" /f 1>NUL 2>NUL

::DISABLE NARRATOR
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" /v "Debugger" /t REG_SZ /d "1" /f


::DISABLE CORTANA SEARCH BAR AND CORTANA BUTTON
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "SearchboxTaskbarMode" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "CortanaEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ShowCortanaButton" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f


::COMPLETELY REMOVING CORTANA
Powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v "CortanaConsent" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v "DisableVoice" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "VoiceShortcut" /t REG_DWORD /d 0 /f

::DISABLE USE OF BING IN SEARCH
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "CortanaCapabilities" /t REG_SZ /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "DeviceHistoryEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsAssignedAccess" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v "IsWindowsHelloActive" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowIndexingEncryptedStoresOrItems" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchSafeSearch" /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v "value" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v "DisableContentFileUpdates" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchPrivacy" /t REG_DWORD /d "3" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v "DoNotUseWebResults" /t REG_DWORD /d "1" /f



::DISABLE STICKY AND TOGGLE KEYS
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "506" /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v "Flags" /t REG_SZ /d "58" /f

::DISABLE FILTER KEYS
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v "Flags" /t REG_SZ /d "122" /f

::DISABLE MOUSE ACCELERATION
reg add "HKCU\Control Panel\Mouse" /v "MouseSpeed" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold1" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Mouse" /v "MouseThreshold2" /t REG_DWORD /d "0" /f

::DISABLE MEMORY COMPRESSION AND PAGE COMBINE (REQUIRES SYSMAIN)
sc config SysMain start= auto
sc start SysMain
powershell "Disable-MMAgent -MemoryCompression"
powershell "Disable-MMAgent -PageCombining"
sc stop SysMain
sc config SysMain start= disabled

::OPTIMIZE GAMING RELATED SERVICES
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsAll" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGames" /t REG_DWORD /d "10" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "FpsStatusGamesAll" /t REG_DWORD /d "4" /f
reg add "HKCU\SOFTWARE\Microsoft\Games" /v "GameFluidity" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v AlwaysOn /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v NetworkThrottlingIndex /d 0xffffffff /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v NoLazyMode /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /t REG_DWORD /v SystemResponsiveness /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Background Only" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "BackgroundPriority" /t REG_DWORD /d "24" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "GPU Priority" /t REG_DWORD /d "12" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "18" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "2" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Affinity" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "GPU Priority" /t REG_DWORD /d "8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Priority" /t REG_DWORD /d "2" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "SFIO Priority" /t REG_SZ /d "High" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Low Latency" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrDebugMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "TdrLevel" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "AGPConcur" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "CPUPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "FastDRAM" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\VxD\BIOS" /v "PCIConcur" /t REG_DWORD /d "1" /f

::AMD GPU TWEAKS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "StutterMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_ThermalAutoThrottlingEnable" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d "1" /f

::NVIDIA GPU TWEAKS
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers\Power" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\NVAPI" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "RmGpsPsEnablePerCpuCoreDpc" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TurboQueue" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableVIASBA" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableIrongateSBA" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPSBA" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableAGPFW" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "FastVram" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "ShadowFB" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "TexturePrecache" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\NVIDIA Corporation\Global\System" /v "EnableFastCopyPixels" /t REG_DWORD /d "1" /f

::DIRECTX
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "DisableVidMemVBs" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "MMX Fast Path" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D" /v "FlipNoVsync" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Direct3D\Drivers" /v "SoftwareOnly" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f

::MSI MODE ENABLE
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "0x00000001" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f 
)

::GAME AUDIO
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Background Only" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Clock Rate" /t REG_DWORD /d "10000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "GPU Priority" /t REG_DWORD /d "12" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Priority" /t REG_DWORD /d "6" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "Scheduling Category" /t REG_SZ /d "Medium" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio" /v "SFIO Priority" /t REG_SZ /d "Normal" /f

::DISABLE XBOX GAME MONITORING SERVICES
sc config xbgm start= disabled
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxGipSvc start= disabled
sc config XboxNetApiSvc start= disabled
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "ShowStartupPanel" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "UseNexusForGameBarEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "AudioCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "CursorCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v "HistoricalCaptureEnabled" /t REG_DWORD /d "0" /f
reg add "HKCU\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v "AllowgameDVR" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 0 /f

::REMOVE XBOX SCHEDULED TASKS
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTask" /DISABLE
schtasks /Change /TN "Microsoft\XblGameSave\XblGameSaveTaskLogon" /DISABLE
takeown /f "%WinDir%\System32\GameBarPresenceWriter.exe" /a
icacls "%WinDir%\System32\GameBarPresenceWriter.exe" /grant:r Administrators:F /c
taskkill /im GameBarPresenceWriter.exe /f
move "C:\Windows\System32\GameBarPresenceWriter.exe" "C:\Windows\System32\GameBarPresenceWriter.OLD"
takeown /f "%WinDir%\System32\bcastdvr.exe" /a
icacls "%WinDir%\System32\bcastdvr.exe" /grant:r Administrators:F /c
taskkill /im bcastdvr.exe /f
move C:\Windows\System32\bcastdvr.exe C:\Windows\System32\bcastdvr.OLD

::OTHER TWEAKS
reg add "HKLM\SYSTEM\ControlSet001\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "FeatureTestControl" /t REG_DWORD /d 0x0000ffff /f

::POWER BOOSTER
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 95533644-e700-4a79-a56c-a89e8cb109d9
powercfg -changename 95533644-e700-4a79-a56c-a89e8cb109d9 EXTREME-SPEED
powercfg -setactive 95533644-e700-4a79-a56c-a89e8cb109d9
powercfg -change -monitor-timeout-ac 5
powercfg -change -monitor-timeout-dc 3
powercfg -change -disk-timeout-ac 0
powercfg -change -disk-timeout-dc 0
powercfg -change -standby-timeout-ac 0
powercfg -change -standby-timeout-dc 0

::DISABLE HIBERNATE
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
powercfg /x -hibernate-timeout-ac 0
powercfg /x -hibernate-timeout-dc 0

::DISABLE SYSMAIN/SUPERFETCH
sc stop SysMain
sc config SysMain start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "512" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBootTrace" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "SfTracingState" /t REG_DWORD /d "0" /f

::DISABLE MAPS
sc config MapsBroker start= disabled

::DISABLE MAPS DOWNLOAD
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v AutoDownloadAndUpdateMapData /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Maps" /v AllowUntriggeredNetworkTrafficOnSettingsPage /t REG_DWORD /d 0 /f

::DISABLE ALLJOYN (This service is used for routing the AllJoyn messages for AllJoyn clients.)
sc config AJRouter start= disabled

::DISABLE GEOLOCATION (IF IT IS DESKTOP AND YOU DON'T NEED TRACKING SERVICES)
sc config lfsvc start= disabled

::DISABLE PHONE SERVICES
sc config PhoneSvc start= disabled

::DISABLE WINDOWS INSIDER UPDATER SERVICE
sc config wisvc start=disabled

::DISABLE WINDOWS MEDIA PLAYER SHARING SERVICES
sc config WMPNetworkSvc start= disabled


::DISABLE INFRARED MONITOR
sc config irmon start= disabled

::DISABLE IP HELPER SVC (only for ipv6) AND IE ETW COLLECTOR
sc config iphlpsvc start= disabled
sc config IEEtwCollectorService start= disabled

::DISABLE PARENTAL CONTROL
sc config WpcMonSvc start= disabled

::DISABLE BITS
sc config "BITS" start=disabled
reg add HKLM\Software\Policies\Microsoft\Windows\BITS /v EnableBITSMaxBandwidth /t REG_DWORD /d 0 /f
reg add HKLM\Software\Policies\Microsoft\Windows\BITS /v MaxDownloadTime /t REG_DWORD /d 1 /f

::SET ZERO PAGE FILE (>8GB RAM)
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" set InitialSize=0,MaximumSize=0
wmic pagefileset where name="%SystemDrive%\\pagefile.sys" delete

::DISABLE PAGING COMBINE TRYING TO SAVE RAM
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f


::DELIVERY OPTIMIZATION
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "SystemSettingsDownloadMode" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v "start" /t REG_DWORD /d 2 /f
sc stop "DoSvc" & sc config "DoSvc" start=disabled

::DISABLE WINDOWS INSIDER EXPERIMENTS
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t "REG_DWORD" /d "0" /f

::DISABLE HEALTH MONITORING
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoSecondLevelCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoFileCollection" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v "DWNoExternalURL" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v "EnableDeviceHealthAttestationService" /t REG_DWORD /d 00000000 /f

::DISABLE ERROR REPORTING AND ADVERTISING
sc stop WerSvc
sc config WerSvc start= disabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d 00000000 /f
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /t REG_DWORD /v DisabledByGroupPolicy /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v "PreventHandwritingErrorReports" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v "PreventHandwritingDataSharing" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "AutoApproveOSDumps" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontSendAdditionalData" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultConsent" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v "DefaultOverrideBehavior" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\PCHealth\ErrorReporting" /v "ShowUI" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v "DontShowUI" /t REG_DWORD /d "1" /f

::DECREASE SHUTDOWN TIME
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeOut /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v HungAppTimeout /t REG_SZ /d 2000 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v AutoEndTasks /t REG_SZ /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d "1" /f

::FORCE WINDOWS UPDATE BETWEEN MORNING 1 AM to 6 AM
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursStart" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursEnd" /t REG_DWORD /d 1 /f

::TWEAKS TO WINDOWS UPDATES
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /t REG_DWORD /d 0 /f

::ENABLE CHECKING OF WINDOWS UPDATE EVERY 2 HOURS
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequency" /t REG_DWORD /d 2 /f

::DISABLE PRIVACY EXPERIENCE AND TELEMETRY SETTINGS
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OOBE" /v "DisablePrivacyExperience" /t REG_DWORD /d "1" /f
reg delete "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore" /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore\Settings" /f
reg add "HKEY_USERS\.DEFAULT\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /T REG_DWORD /V "AllowTelemetry" /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t "REG_DWORD" /d "0" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t "REG_DWORD" /d "0" /f

::DISABLE ACTIVITIES PUBLISH
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
sc config "DcpSvc" start=disabled

::DISABLE APP COMPATIBILITY DATA LOGGING
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableUAR" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "VDMDisallowed" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableEngine" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableWizard" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisablePCA" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "SbEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v "DisableSendGenericDriverNotFoundToWER" /t REG_DWORD /d 00000000 /f

::LIMIT LOGGING TO 48MB
wevtutil sl Security /ms:48048576
wevtutil sl Application /ms:48048576
wevtutil sl Setup /ms:48048576
wevtutil sl System /ms:48048576
wevtutil sl "Windows Powershell" /ms:24048576
wevtutil sl "Microsoft-Windows-PowerShell/Operational" /ms:24048576
wevtutil sl "Microsoft-Windows-Sysmon/Operational" /ms:24048576
wevtutil sl "Microsoft-Windows-TaskScheduler/Operational" /e:true
wevtutil sl "Microsoft-Windows-DNS-Client/Operational" /e:true

ipconfig /release 
ipconfig /renew 
ipconfig /flushdns 
netsh int ip reset 
netsh winsock reset 
netsh interface ipv4 reset 
netsh interface ipv6 reset 
netsh advfirewall reset 
netsh interface ip delete arpcache
netsh interface ipv6 6to4 set state state=disabled undoonstop=disabled
netsh int tcp set supplemental custom congestionprovider = ctcp
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int ipv6 set state disabled
netsh int isatap set state disabled
netsh int tcp set global autotuninglevel=disable
netsh int tcp set global dca=enabled
netsh int tcp set security mpp=disabled
netsh int tcp set global ecn=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global initialRto=2000
netsh int tcp set global maxsynretransmissions=2
netsh int tcp set global netdma=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set security profiles=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set supplemental Custom congestionprovider=ctcp
netsh int tcp set supplemental Internet congestionprovider=ctcp
netsh int tcp set supplemental InternetCustom congestionprovider=ctcp
netsh int teredo set state disabled
netsh int tcp set global maxsynretransmissions=2
netsh winsock set autotuning on

::RE-SYNC TIME
net stop w32time
w32tm /unregister
w32tm /register
w32tm /config /syncfromflags:manual /manualpeerlist:"0.pool.ntp.org 1.pool.ntp.org 2.pool.ntp.org 3.pool.ntp.org" /reliable:YES
net start w32time
w32tm /config /update
w32tm /resync /rediscover

::SYSTEM CLEAN
taskkill /f /im explorer.exe
@echo Please wait......
timeout /t 5
pushd "C:\Temp" && (rd /s /q "C:\Temp" 2>nul & popd)
pushd "%windir%\temp" && (rd /s /q "%windir%\temp" 2>nul & popd)
pushd "%temp%" && (rd /s /q "%temp%" 2>nul & popd)
pushd "C:\Windows\Temp" && (rd /s /q "C:\Windows\Temp" 2>nul & popd)
pushd "%windir%\Prefetch " && (rd /s /q "%windir%\Prefetch" 2>nul & popd)
pushd "%windir%\system32\dllcache" && (rd /s /q "%windir%\system32\dllcache" 2>nul & popd)
pushd "%windir%\spool\printers" && (rd /s /q "%windir%\spool\printers" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\History" && (rd /s /q "%USERPROFILE%\Local Settings\History" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\Temporary Internet Files" && (rd /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" && (rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Temporary Internet Files" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\Temp" && (rd /s /q "%USERPROFILE%\Local Settings\Temp" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Temp" && (rd /s /q "%USERPROFILE%\AppData\Local\Temp" 2>nul & popd)
pushd "%AppData%\Microsoft\Windows\Recent\" && (rd /s /q "%AppData%\Microsoft\Windows\Recent\" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer" && (rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer" 2>nul & popd)
pushd "%USERPROFILE%\Local Settings\History" && (rd /s /q "%USERPROFILE%\Local Settings\History" 2>nul & popd)
pushd "%USERPROFILE%\AppData\Local\Temp" && (rd /s /q "%USERPROFILE%\AppData\Local\Temp" 2>nul & popd)
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
DEL /f /s /q /a %LocalAppData%\Microsoft\Windows\Explorer\*.db
DEL /q /f /s %USERPROFILE%\AppData\Roaming\Microsoft\Office\*.tmp 
DEL /f /s /q %systemdrive%\*.tmp
DEL /f /s /q %systemdrive%\*._mp
DEL /f /s /q %systemdrive%\*.log
DEL /f /s /q %systemdrive%\*.gid
DEL /f /s /q %systemdrive%\*.chk
DEL /f /s /q %systemdrive%\*.old
DEL /f /s /q %systemdrive%\recycled\*.*
DEL /f /s /q %systemdrive%\$Recycle.Bin\*.*
DEL /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
goto theEnd
:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof
:noAdmin
echo You must run this script as an Administrator!
echo.
:theEnd
start explorer.exe

::DISCORD CACHE CLEAN
taskkill /im discord.exe /f
rd "%AppData%\Discord\Cache" /s /q
rd "%AppData%\Discord\Code Cache" /s /q
md "%AppData%\Discord\Cache"
md "%AppData%\Discord\Code Cache"

::EDGE CACHE CLEAN
del "%LocalAppData%\Microsoft\Edge\User Data\Default\*history*." /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\LOG.old" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Login Data" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Login Data-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media History" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Media History-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Action Predictor-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Network Persistent State" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Reporting and NEL-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\QuotaManager-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Shortcuts-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Top Sites-journal" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Visited Links" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data" /s /f /q
del "%LocalAppData%\Microsoft\Edge\User Data\Default\Web Data-journal" /s /f /q

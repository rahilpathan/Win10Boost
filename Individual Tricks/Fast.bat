taskkill /F /IM "MicrosoftEdge.exe"
taskkill /F /IM "explorer.exe"
del /f /q "C:\Users\%USERNAME%\Desktop\Your Phone.lnk"
del /f /q "C:\Users\Public\Desktop\Microsoft Edge.lnk"


reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v HideFileExt /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v ShowCortanaButton /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v ShowTaskViewButton /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v TaskbarGlomLevel /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /t REG_DWORD /v ShellFeedsTaskbarViewMode /d 2 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /t REG_DWORD /v SearchboxTaskbarMode /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /t REG_DWORD /v LaunchTo /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /t REG_DWORD /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /t REG_DWORD /v "{645FF040-5081-101B-9F08-00AA002F954E}" /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /t REG_DWORD /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /t REG_DWORD /v "{645FF040-5081-101B-9F08-00AA002F954E}" /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Lock Screen" /v SlideshowEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /t REG_DWORD /v HideSCAMeetNow /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarSmallIcons /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\PenWorkspace" /v PenWorkspaceButtonDesiredVisibility /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /t REG_DWORD /f /d 0 /v parent
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Control\WMI\Autologger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\DiagTrack" /v Start /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\ControlSet001\Services\dmwappushservice" /v Start" /t REG_DWORD /d 4 /f
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /t REG_DWORD /v EnableAutoTray /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /t REG_DWORD /v HubMode /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Id /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Id /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
reg delete "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

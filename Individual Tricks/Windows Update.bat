::UPDATE APPS AUTOMATICALLY
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate" /v "AutoDownload" /t REG_DWORD /d "4" /f

::FORCE WINDOWS UPDATE BETWEEN MORNING 1 AM to 6 AM
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursStart" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "ActiveHoursEnd" /t REG_DWORD /d 1 /f

::TWEAKS TO WINDOWS UPDATES
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "AllowBuildPreview" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /t REG_DWORD /v AllowBuildPreview /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v value /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableConfigFlighting" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds" /v "EnableExperimentation" /t REG_DWORD /d 0 /f

::MALICIOUS REMOVAL TOOLS NOT THRU WINDOWS UPDATE
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "HeartbeatTrackingIndex" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\RemovalTools\MpGears" /v "SpyNetReportingLocation" /t REG_MULTI_SZ /d "" /f
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontOfferThroughWUAU" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\MRT" /v "DontReportInfectionInformation" /t REG_DWORD /d "1" /f

::ENABLE CHECKING OF WINDOWS UPDATE EVERY 2 HOURS
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequencyEnabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "DetectionFrequency" /t REG_DWORD /d 2 /f

::INSTALL SECURITY UPDATES IMMEDIATELY
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /t REG_DWORD /v "DeferQualityUpdates" /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /t REG_DWORD /v "DeferQualityUpdatesPeriodInDays" /d 0 /f

::DEFER FEATURE UPDATES FOR 360 DAYS
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /t REG_DWORD /v "DeferFeatureUpdates" /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /t REG_DWORD /v "DeferFeatureUpdatesPeriodInDays" /d 360 /f
reg add	"HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /t REG_DWORD /v "EnableFeaturedSoftware" /D 0 /f

::DISABLE AUTO INSTALL UPDATE INSTALL
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "AutoInstallMinorUpdates" /t REG_DWORD /d 0 /f

::DISABLE AUTO DRIVER UPDATE
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 0 /f
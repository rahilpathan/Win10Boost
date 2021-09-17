::REMOVING CHROME CACHE (ENABLE ONLY IF RUNNING FIRST TIME, DISABLED)
::taskkill /F /IM "chrome.exe"
::set ChromeDataDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
::set ChromeCache=%ChromeDataDir%\Cache
::del /q /s /f "%ChromeCache%\*.*" 
::del /q /f "%ChromeDataDir%\*Cookies*.*"
::set ChromeDataDir=C:\Users\%USERNAME%\Local Settings\Application Data\Google\Chrome\User Data\Default
::set ChromeCache=%ChromeDataDir%\Cache
::del /q /s /f "%ChromeCache%\*.*"
::del /q /f "%ChromeDataDir%\*Cookies*.*"


taskkill /f /im explorer.exe
@echo Please wait......
timeout /t 3

::SYSTEM CLEAN
del C:\Temp /S /Q /F
del C:\Temp /S /Q /A:H
del C:\Windows\Temp /S /Q /F
del C:\Windows\Temp /S /Q /A:H
del /s /f /q %windir%\temp\*.*
rd /s /q %windir%\temp
md %windir%\temp
del /s /f /q %windir%\spool\printers\*.*
rd /s /q %windir%\spool\printers
md %windir%\spool\printers
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
del /s /f /q "%userprofile%\AppData\Local\Microsoft\WindowsWindows\Explorer"\thumbcache_*.db
del /s /f /q "%userprofile%\AppData\Local\Microsoft\WindowsWindows\Explorer"\iconcache_*.db
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

::RESTORE ORIGINAL BCDEDITS (ONLY IF EVER MODIFIED)
::bcdedit /deletevalue {current} safeboot
::bcdedit /deletevalue {current} safebootalternateshell
::bcdedit /deletevalue {current} removememory
::bcdedit /deletevalue {current} truncatememory
::bcdedit /deletevalue {current} useplatformclock
::bcdedit /deletevalue {default} safeboot
::bcdedit /deletevalue {default} safebootalternateshell
::bcdedit /deletevalue {default} removememory
::bcdedit /deletevalue {default} truncatememory
::bcdedit /deletevalue {default} useplatformclock
::bcdedit /set {bootmgr} displaybootmenu no
::bcdedit /set {current} advancedoptions false
::bcdedit /set {current} bootems no
::bcdedit /set {current} bootmenupolicy legacy
::bcdedit /set {current} bootstatuspolicy IgnoreAllFailures
::bcdedit /set {current} disabledynamictick yes
::bcdedit /set {current} lastknowngood yes
::bcdedit /set {current} recoveryenabled no
::bcdedit /set {default} advancedoptions false
::bcdedit /set {default} bootems no
::bcdedit /set {default} bootmenupolicy legacy
::bcdedit /set {default} bootstatuspolicy IgnoreAllFailures
::bcdedit /set {default} disabledynamictick yes
::bcdedit /set {default} lastknowngood yes
::bcdedit /set {default} recoveryenabled no
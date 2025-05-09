@echo off
REM Creating two separate powerplan, adjust according to situations
REM    - Max-Perf-AC   (EXT-Performance by Github-RahilPathan)
REM    - Balance-DC    (ENGY-Balanced by Github-RahilPathan)
REM  Includes all supported registry optimizations.
REM  Requires: Run as Administrator
REM ------------------------------------------------------------

:: 1) Verify admin
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ** Please run this script as Administrator **
    pause
    exit /b
)

:: 2) Base GUIDs
set "GUID_UP=e9a42b02-d5df-448d-aa00-03f14749eb61"
set "GUID_BAL=381b4222-f694-41f0-9685-ff5bb260df2e"

echo.
echo [*] Duplicating power schemes...
powercfg -duplicatescheme %GUID_UP% >nul
powercfg -duplicatescheme %GUID_BAL% >nul

:: 3) Capture new GUIDs
for /f "tokens=4" %%A in ('powercfg /list ^| findstr /I /C:"EXT-Performance by Github-RahilPathan"') do set "AC_GUID=%%A"
for /f "tokens=4" %%A in ('powercfg /list ^| findstr /I /C:"ENGY-Balanced by Github-RahilPathan"') do set "DC_GUID=%%A"

echo [*] Renaming schemes...
powercfg -setfriendlyname %AC_GUID% "Max-Perf-AC"
powercfg -setfriendlyname %DC_GUID% "Balance-DC"

:: 4) AC (Max-Perf-AC) settings – full throttle
echo [*] Configuring AC settings...
powercfg -setacvalueindex %AC_GUID% SUB_PROCESSOR PROCTHROTTLEMAX    100
powercfg -setacvalueindex %AC_GUID% SUB_PROCESSOR PROCTHROTTLEMIN    100
powercfg -setacvalueindex %AC_GUID% SUB_PROCESSOR PERFBOOSTMODE      2
powercfg -setacvalueindex %AC_GUID% SUB_DISK      DISKIDLE           0
powercfg -setacvalueindex %AC_GUID% SUB_PCIEXPRESS EPP                0
powercfg -setacvalueindex %AC_GUID% SUB_USB       USBSELECTSUSPEND   0
powercfg -setacvalueindex %AC_GUID% SUB_VIDEO     VIDEODIM           0
powercfg -setacvalueindex %AC_GUID% SUB_VIDEO     ADAPTBRIGHT        0
powercfg -setacvalueindex %AC_GUID% SUB_WIRELESS  WIRELESSMODE       0

:: 5) DC (Balance-DC) settings – balanced
echo [*] Configuring DC settings...
powercfg -setdcvalueindex %DC_GUID% SUB_PROCESSOR PROCTHROTTLEMAX    100
powercfg -setdcvalueindex %DC_GUID% SUB_PROCESSOR PROCTHROTTLEMIN    30
powercfg -setdcvalueindex %DC_GUID% SUB_PROCESSOR PERFBOOSTMODE      1
powercfg -setdcvalueindex %DC_GUID% SUB_DISK      DISKIDLE          20
powercfg -setdcvalueindex %DC_GUID% SUB_USB       USBSELECTSUSPEND   1
powercfg -setdcvalueindex %DC_GUID% SUB_VIDEO     VIDEODIM          60
powercfg -setdcvalueindex %DC_GUID% SUB_VIDEO     ADAPTBRIGHT        1
powercfg -setdcvalueindex %DC_GUID% SUB_WIRELESS  WIRELESSMODE       2

:: 6) Registry optimizations still valid on Windows 11
echo [*] Applying registry tweaks...

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" `
    /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" `
    /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" `
    /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" `
    /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" `
    /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" `
    /v "EnableSuperfetch" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" `
    /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" `
    /v "ClearPageFileAtShutdown" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" `
    /v "LargeSystemCache" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" `
    /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" `
    /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "5" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" `
    /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKCU\Control Panel\Desktop" `
    /v "MenuShowDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" `
    /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" `
    /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f

:: 7) Disable dynamic tick (still useful)
bcdedit /set disabledynamictick yes >nul

:: 8) Activate the high‑performance plan
echo [*] Activating Max-Perf-AC…
powercfg -setactive %AC_GUID%

echo.
echo ** Done. **
echo To switch to Battery mode, run:
echo    powercfg -setactive %AC_GUID%
pause
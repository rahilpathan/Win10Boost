@echo off
setlocal EnableDelayedExpansion

:: Verify administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrator privileges. Please run as administrator.
    pause
    exit /b 1
)

:: Define High Performance GUID
set "GUID_HP=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

:: Create and rename new power plan
for /f "tokens=3" %%A in ('powercfg -duplicatescheme %GUID_HP%') do set "NEW_GUID=%%A"
powercfg -changename !NEW_GUID! "Win11-Hybrid" "Optimized power plan for Windows 11"

:: Unhide all power settings
for %%G in (
    SUB_PROCESSOR
    SUB_DISK
    SUB_VIDEO
    SUB_SLEEP
    SUB_USB
    SUB_PCIEXPRESS
    SUB_BUTTONS
    SUB_BATTERY
    SUB_GRAPHICS
    SUB_WIFI
    SUB_POWER
) do powercfg -attributes %%G -ATTRIB_HIDE

:: AC Settings
powercfg -setacvalueindex !NEW_GUID! SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex !NEW_GUID! SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex !NEW_GUID! SUB_PROCESSOR IDLEDISABLE 1
powercfg -setacvalueindex !NEW_GUID! SUB_PROCESSOR PARKINGMAXCORES 100
powercfg -setacvalueindex !NEW_GUID! SUB_PROCESSOR PARKINGMINCORES 100
powercfg -setacvalueindex !NEW_GUID! SUB_DISK DISKIDLE 0
powercfg -setacvalueindex !NEW_GUID! SUB_PCIEXPRESS ASPM 0
powercfg -setacvalueindex !NEW_GUID! SUB_USB USBSELECTIVE 0
powercfg -setacvalueindex !NEW_GUID! SUB_VIDEO VIDEOIDLE 0
powercfg -setacvalueindex !NEW_GUID! SUB_VIDEO ADAPTBRIGHT 0
powercfg -setacvalueindex !NEW_GUID! SUB_WIFI POWERMODE 0
powercfg -setacvalueindex !NEW_GUID! SUB_SLEEP STANDBYIDLE 0
powercfg -setacvalueindex !NEW_GUID! SUB_SLEEP HIBERNATEIDLE 0

:: DC Settings
powercfg -setdcvalueindex !NEW_GUID! SUB_PROCESSOR PROCTHROTTLEMIN 5
powercfg -setdcvalueindex !NEW_GUID! SUB_PROCESSOR PROCTHROTTLEMAX 50
powercfg -setdcvalueindex !NEW_GUID! SUB_PROCESSOR IDLEDISABLE 0
powercfg -setdcvalueindex !NEW_GUID! SUB_PROCESSOR PARKINGMAXCORES 50
powercfg -setdcvalueindex !NEW_GUID! SUB_PROCESSOR PARKINGMINCORES 0
powercfg -setdcvalueindex !NEW_GUID! SUB_DISK DISKIDLE 1200
powercfg -setdcvalueindex !NEW_GUID! SUB_PCIEXPRESS ASPM 1
powercfg -setdcvalueindex !NEW_GUID! SUB_USB USBSELECTIVE 1
powercfg -setdcvalueindex !NEW_GUID! SUB_VIDEO VIDEOIDLE 60
powercfg -setdcvalueindex !NEW_GUID! SUB_VIDEO ADAPTBRIGHT 1
powercfg -setdcvalueindex !NEW_GUID! SUB_WIFI POWERMODE 2
powercfg -setdcvalueindex !NEW_GUID! SUB_SLEEP STANDBYIDLE 900
powercfg -setdcvalueindex !NEW_GUID! SUB_SLEEP HIBERNATEIDLE 1800

:: Activate the new power plan
powercfg -setactive !NEW_GUID!

:: Set as default in registry
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\User\PowerSchemes" /v ActivePowerScheme /t REG_SZ /d !NEW_GUID! /f

:: Export the power plan for backup
powercfg -export "%USERPROFILE%\Desktop\Win11-Hybrid.pow" !NEW_GUID!

:: Registry tweaks for performance
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v EnergyEstimationEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v PlatformAoAcOverride /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v CsEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Affinity /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d False /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpMaxDataRetransmissions /t REG_DWORD /d 5 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DisableTaskOffload /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

:: Disable Dynamic Tick
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1

echo.
echo Win11-Hybrid power plan has been created and activated.
echo AC power: Maximum Performance
echo DC power: Power Efficient
echo.
pause >nul

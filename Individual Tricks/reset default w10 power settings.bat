@echo off
REM #################################################################################
REM # BATCH SCRIPT TO RESTORE ALL POWER SCHEMES AND REGISTRY TWEAKS TO DEFAULTS     #
REM #################################################################################

REM Ensure the script is run as Administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator.
    echo Please right-click and select "Run as administrator".
    pause
    exit /b 1
)

setlocal enabledelayedexpansion

echo.
echo =========================================================================
echo SYSTEM POWER AND REGISTRY TWEAK REVERSION INITIATED
echo (Restoring ALL Power Plans to Balanced Defaults)
echo =========================================================================
echo.

REM --- 1. Define GUIDs and Default Values (Using Balanced Defaults) ---
set "NEW_SCHEME=99999999-9999-9999-9999-999999999999"
set "BALANCED_SCHEME=381b4222-f694-41f0-9685-ff5bb260df2e"

REM Subgroup GUIDs
set SUB_PROC_GUID=54533251-82be-4824-96c1-47b60b740d00
set SUB_DISK_GUID=0012ee47-9041-4b5d-9b77-535fba8b10b5
set SUB_PCIEXPRESS_GUID=501a4dca-4273-40a8-b489-e24c5b20ccba
set SUB_SLEEP_GUID=238c9fa8-0aad-41ed-83f4-97be242c8f20
set SUB_USB_GUID=2a737441-1930-4402-8d77-b2bebba308a3
set SUB_VIDEO_GUID=7516b95f-f776-4464-8c53-06167f40cc99
set SUB_WIRELESS_GUID=19cbb8fa-5279-450e-9fac-8a3d5fedd0c1

REM Setting GUIDs
set MIN_PROC_GUID=893dee8e-2bef-41e0-89c6-b55d0929964c
set MAX_PROC_GUID=bc5038f7-23e0-4960-96da-33abaf5935ec
set CORE_PARK_MIN=0cc5b647-c1df-4637-891a-dec35c318583
set CORE_PARK_MAX=45bcc044-d885-43e2-8605-ee0ec6e96b59
set PERFBOOSTMODE=be337238-0d82-4146-a960-4f3749d470c7
set PROCTHROTTLE_MIN=94d3a615-a899-4ac5-ae2b-e4d8f634367f
set PROCTHROTTLE_MAX=36687f9e-e3a5-4dbf-b1dc-15eb381c6863
set DISPLAY_BRIGHTNESS=aded5e82-b909-4619-9949-f5d71dac0bcb
set DISPLAY_OFF_TIMEOUT=3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e
set AHCI_LINK_POWER=6738e2c4-e8a5-4a42-b16a-e040e769756e
set PCIE_ASPM=ee12f906-d277-404b-b6da-e5fa1a576df5
set USB_SUSPEND=48e6b7a6-50f5-4782-a5d4-53bb8f07e226
set WIFI_POWER=12bbebe6-58d6-4636-95bb-3217ef867c1a

REM Default Balanced Values
set V_MIN_PROC=5
set V_MAX_PROC=100
set V_BOOST_MODE=1  REM Enabled (1) is Balanced default
set V_CORE_PARK_MIN=5
set V_CORE_PARK_MAX=100
set V_THROTTLE_MIN=5
set V_THROTTLE_MAX=100
set V_DISPLAY_BRIGHT_AC=100
set V_DISPLAY_BRIGHT_DC=75
set V_DISPLAY_OFF_AC=1800 REM 30 mins
set V_DISPLAY_OFF_DC=900 REM 15 mins
set V_AHCI_POWER_AC=0    REM Active
set V_AHCI_POWER_DC=3    REM HIPM+DIPM
set V_PCIE_ASPM_AC=1     REM Moderate Power Savings
set V_PCIE_ASPM_DC=1
set V_USB_SUSPEND_AC=0   REM Disabled
set V_USB_SUSPEND_DC=1   REM Enabled
set V_WIFI_POWER_AC=0    REM Max Performance
set V_WIFI_POWER_DC=3    REM Max Power Saving
set V_HIBERNATE_SLEEP_AC=0
set V_HIBERNATE_SLEEP_DC=0


REM --- 2. Loop through all Power Schemes and Apply Defaults ---
echo [STEP 1/3] Applying Balanced default settings to ALL existing power plans...
FOR /F "tokens=2 delims=:" %%L IN ('powercfg /list ^| findstr /I "Power Scheme GUID"') DO (
    FOR /F "tokens=1" %%G IN ("%%L") DO (

        set SCHEME_GUID=%%G
        echo.
        echo --- Resetting scheme: !SCHEME_GUID! ---

        REM ### PROCESSOR SETTINGS (AC & DC) ###
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %MIN_PROC_GUID% !V_MIN_PROC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %MIN_PROC_GUID% !V_MIN_PROC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %MAX_PROC_GUID% !V_MAX_PROC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %MAX_PROC_GUID% !V_MAX_PROC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %CORE_PARK_MIN% !V_CORE_PARK_MIN!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %CORE_PARK_MIN% !V_CORE_PARK_MIN!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %CORE_PARK_MAX% !V_CORE_PARK_MAX!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %CORE_PARK_MAX% !V_CORE_PARK_MAX!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PERFBOOSTMODE% !V_BOOST_MODE!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PERFBOOSTMODE% !V_BOOST_MODE!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PROCTHROTTLE_MIN% !V_THROTTLE_MIN!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PROCTHROTTLE_MIN% !V_THROTTLE_MIN!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PROCTHROTTLE_MAX% !V_THROTTLE_MAX!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% %PROCTHROTTLE_MAX% !V_THROTTLE_MAX!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PROC_GUID% 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PROC_GUID% 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1

        REM ### DISPLAY/VIDEO SETTINGS ###
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_VIDEO_GUID% %DISPLAY_OFF_TIMEOUT% !V_DISPLAY_OFF_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_VIDEO_GUID% %DISPLAY_OFF_TIMEOUT% !V_DISPLAY_OFF_DC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_VIDEO_GUID% %DISPLAY_BRIGHTNESS% !V_DISPLAY_BRIGHT_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_VIDEO_GUID% %DISPLAY_BRIGHTNESS% !V_DISPLAY_BRIGHT_DC!

        REM ### USB/PCIe/WIRELESS/DISK SETTINGS ###
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_DISK_GUID% %AHCI_LINK_POWER% !V_AHCI_POWER_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_DISK_GUID% %AHCI_LINK_POWER% !V_AHCI_POWER_DC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_PCIEXPRESS_GUID% %PCIE_ASPM% !V_PCIE_ASPM_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_PCIEXPRESS_GUID% %PCIE_ASPM% !V_PCIE_ASPM_DC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_USB_GUID% %USB_SUSPEND% !V_USB_SUSPEND_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_USB_GUID% %USB_SUSPEND% !V_USB_SUSPEND_DC!
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_WIRELESS_GUID% %WIFI_POWER% !V_WIFI_POWER_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_WIRELESS_GUID% %WIFI_POWER% !V_WIFI_POWER_DC!

        REM ### SLEEP/HIBERNATE ###
        powercfg /setacvalueindex !SCHEME_GUID! %SUB_SLEEP_GUID% 29f6c1db-86da-48c5-9fdb-f2b67b1f44da !V_HIBERNATE_SLEEP_AC!
        powercfg /setdcvalueindex !SCHEME_GUID! %SUB_SLEEP_GUID% 29f6c1db-86da-48c5-9fdb-f2b67b1f44da !V_HIBERNATE_SLEEP_DC!

        REM ### HIDE ATTRIBUTES ###
        powercfg -attributes %SUB_PROC_GUID% 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 +ATTRIB_HIDE
        powercfg -attributes %SUB_PROC_GUID% 45bcc044-d885-43e2-8605-ee0ec6e96b59 +ATTRIB_HIDE
        powercfg -attributes %SUB_PROC_GUID% %PERFBOOSTMODE% +ATTRIB_HIDE
    )
)

REM --- 3. Cleanup Custom Plan and Activate Balanced ---
echo.
echo [STEP 2/3] Deleting custom plan and setting Balanced scheme active...
powercfg -delete %NEW_SCHEME% >nul 2>&1
powercfg -setactive %BALANCED_SCHEME%
echo    - Custom power plan "%NEW_SCHEME%" deleted (if found).
echo    - Default Balanced plan set as active.
echo.

REM --- 4. Registry and BCD Reversion ---
echo [STEP 3/3] Reverting global registry and BCD settings to default...

REM Revert BCD (Deleting custom values)
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /deletevalue useplatformtick >nul 2>&1

REM Revert Coalescing Timer Tweaks (Deleting these keys restores OS auto-default)
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /f >nul 2>&1

REM Revert Power/Energy Tweaks
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "0" /f

REM Revert Memory Management Tweaks (Deleting keys restores auto-calculated values)
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f

REM Revert Prefetch/Superfetch Tweaks (Default is 3)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f

REM Revert Responsiveness/Latency Tweaks
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "0" /f
REG ADD "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_DWORD /d "400" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "20" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "128" /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "5" /f

REM Revert Search/Telemetry/Maintenance Tweaks
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "1" /f
REG DELETE "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /f >nul 2>&1
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "1" /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "1" /f
REG ADD "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "1" /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "0" /f
REG DELETE "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /f >nul 2>&1

echo    - All registry keys and BCD settings reverted to default values.
echo.

echo =========================================================================
echo FINAL RESET COMPLETE!
echo =========================================================================
echo A **REBOOT** is highly recommended to fully apply the registry and BCD changes.
pause

endlocal

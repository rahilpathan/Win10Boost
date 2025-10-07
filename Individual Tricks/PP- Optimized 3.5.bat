@echo off
REM #################################################################################
REM # BATCH SCRIPT TO RESET ALL POWER CONFIGURATION AND REGISTRY TWEAKS TO DEFAULTS #
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
echo SYSTEM TWEAK RESET INITIATED
echo (Must be run as Administrator)
echo =========================================================================
echo.

REM --- 1. Define GUIDs and Schemes to Revert ---
REM Custom scheme to delete
set "NEW_SCHEME=99999999-9999-9999-9999-999999999995"
REM Default Balanced scheme to activate
set "BALANCED_SCHEME=381b4222-f694-41f0-9685-ff5bb260df2e"
REM Core Parking GUID for registry cleanup
set "CORE_PARK_GUID=0cc5b647-c1df-4637-891a-dec35c318583"
set "SUB_PROC_GUID=54533251-82be-4824-96c1-47b60b740d00"


REM --- 2. Power Plan Reset and Cleanup ---
echo [STEP 1/5] Resetting Power Plan to Balanced and deleting custom scheme...
powercfg -setactive %BALANCED_SCHEME%
powercfg -delete %NEW_SCHEME% >nul 2>&1
echo    - Deleted custom power plan '%NEW_SCHEME%'.
echo    - Activated default Balanced power plan.
echo.


REM --- 3. Reset Power Menu Visibility (Re-hiding advanced settings) ---
echo [STEP 2/5] Restoring default visibility of power settings...

REM The original script used -ATTRIB_HIDE (to UNHIDE/SHOW the setting).
REM To reset, we use +ATTRIB_HIDE (to HIDE the setting again).
powercfg -attributes SUB_PROCESSOR PERFBOOSTMODE +ATTRIB_HIDE
powercfg -attributes %SUB_PROC_GUID% %CORE_PARK_GUID% +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PERFBOOSTPOL +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR CPMINCORES +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR CPMAXCORES +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX +ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX +ATTRIB_HIDE

echo    - All previously exposed advanced power settings are now hidden.
echo.


REM --- 4. Registry Tweak Reversion ---
echo [STEP 3/5] Reverting core parking and system registry tweaks...

REM Revert: REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v Attributes /t REG_DWORD /d 2 /f
REM Default is 1 (for battery/power options), or often the entry is absent. Deleting the custom value is safest.
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "Attributes" /f >nul 2>&1

REM Revert Core Parking Registry Tweaks (Deleting these custom entries restores OS defaults)
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\%SUB_PROC_GUID%\%CORE_PARK_GUID%" /v "ValueMax" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\%SUB_PROC_GUID%\%CORE_PARK_GUID%" /v "ValueMax" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\%SUB_PROC_GUID%\%CORE_PARK_GUID%" /v "ValueMin" /f >nul 2>&1
REG DELETE "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\%SUB_PROC_GUID%\%CORE_PARK_GUID%" /v "ValueMin" /f >nul 2>&1

REM Revert Memory/Prefetch Tweaks:
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "SfTracingState" /t REG_DWORD /d 1 /f

REM Revert Delivery Optimization: (Default is 99 or usually 1 for LAN/Internet)
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 1 /f

echo    - Core Parking and Memory Management registry keys restored.
echo.


REM --- 5. Service Tweak Reversion ---
echo [STEP 4/5] Restoring default service startup types...

REM SysMain (Superfetch/Prefetch) - Default: Automatic (Start=2)
sc config "SysMain" start= auto
net start "SysMain" >nul 2>&1

REM Driver Services (Set back to Manual or Automatic, usually 3 or 2)
REM Setting disabled services (Start=4) back to Manual (Start=3) is a safe default for non-critical drivers.
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\intelppm" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\intelpep" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iagpio" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iai2c" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_GPIO2" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_GPIO2_BXT_P" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_I2C" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_I2C_BXT_P" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSSi_GPIO" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSSi_I2C" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaStorAVC" /v "Start" /t REG_DWORD /d 0 /f REM Default 0 (Boot)
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\iaStorV" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\AmdK8" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\AmdPPM" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\amdsata" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\amdsbs" /v "Start" /t REG_DWORD /d 3 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Services\amdxata" /v "Start" /t REG_DWORD /d 3 /f

echo    - Service start modes restored to defaults/manual (SysMain re-enabled).
echo.


REM --- 6. System/Boot Configuration (BCD/FSUTIL/MMAgent) Reversion ---
echo [STEP 5/5] Reverting BCD and File System settings...

REM Revert BCD (Deleting custom values)
bcdedit /deletevalue disabledynamictick >nul 2>&1
bcdedit /deletevalue tscsyncpolicy >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1
bcdedit /deletevalue uselegacyapicmode >nul 2>&1
bcdedit /deletevalue usephysicaldestination >nul 2>&1

REM Revert fsutil behavior (Default values)
fsutil behavior set memoryusage 0 >nul 2>&1
fsutil behavior set allowextchar 0 >nul 2>&1
fsutil behavior set mftzone 1 >nul 2>&1
fsutil behavior set disablecompression 0 >nul 2>&1
fsutil behavior set disableencryption 0 >nul 2>&1
fsutil behavior set disabledeletenotify 1 >nul 2>&1

REM Revert PowerShell MMAgent (Re-enable all features)
powershell -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Unrestricted -Command "Enable-MMAgent -mc -pc" >nul 2>&1

echo    - BCD, File System, and Memory Diagnostic settings reverted.
echo.

echo =========================================================================
echo RESET COMPLETE!
echo =========================================================================
echo A REBOOT IS HIGHLY RECOMMENDED for all registry and BCD changes to take effect.
echo.
pause

endlocal

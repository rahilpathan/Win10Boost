@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: Require Administrator
net session >nul 2>&1
if errorlevel 1 (
    echo Please run this script as Administrator.
    pause
    exit /b 1
)

:: Timestamped output folder next to this script
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmmss"') do set "STAMP=%%I"
set "OUTDIR=%~dp0PowerExport_%STAMP%"
mkdir "%OUTDIR%" 2>nul

echo Output folder: "%OUTDIR%"
echo.

:: Capture active scheme and the list of schemes
powercfg /getactivescheme > "%OUTDIR%\active_scheme.txt"
powercfg /list > "%OUTDIR%\power_schemes_list.txt"
powercfg /aliases > "%OUTDIR%\powercfg_aliases.txt"
powercfg /a > "%OUTDIR%\available_sleep_states.txt"
powercfg /requests > "%OUTDIR%\power_requests.txt"
powercfg /waketimers > "%OUTDIR%\wake_timers.txt"
powercfg /lastwake > "%OUTDIR%\last_wake.txt"

:: Parse active scheme GUID from the /getactivescheme output
set "ACTIVEGUID="
for /f "tokens=4" %%G in ('powercfg /getactivescheme ^| findstr /i "Power Scheme GUID"') do set "ACTIVEGUID=%%G"

if defined ACTIVEGUID (
    powercfg /query %ACTIVEGUID% > "%OUTDIR%\active_scheme_full.txt"
    powercfg /export "%OUTDIR%\active_scheme.pow" %ACTIVEGUID%
) else (
    echo Could not detect active power scheme GUID.>> "%OUTDIR%\errors.txt"
)

:: Export every listed scheme to .txt and .pow
for /f "tokens=4" %%G in ('powercfg /list ^| findstr /i "Power Scheme GUID"') do (
    powercfg /query %%G > "%OUTDIR%\scheme_%%G.txt"
    powercfg /export "%OUTDIR%\scheme_%%G.pow" %%G
)

:: Common registry areas related to power / performance tuning
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Power" "%OUTDIR%\HKLM_System_Control_Power.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" "%OUTDIR%\HKLM_SessionManager_Power.reg" /y
reg export "HKCU\Control Panel\Power" "%OUTDIR%\HKCU_ControlPanel_Power.reg" /y
reg export "HKCU\Control Panel\PowerCfg" "%OUTDIR%\HKCU_ControlPanel_PowerCfg.reg" /y
reg export "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "%OUTDIR%\HKLM_Explorer_Advanced.reg" /y
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "%OUTDIR%\HKLM_SystemProfile.reg" /y

echo.
echo Done. Files saved in:
echo "%OUTDIR%"
pause
endlocal
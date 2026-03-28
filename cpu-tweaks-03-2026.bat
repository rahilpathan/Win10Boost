@echo off
setlocal EnableExtensions

:: ================================
:: REQUIRE ADMIN
:: ================================
net session >nul 2>&1
if errorlevel 1 (
 &  & echo Run this as Administrator.
 &  & pause
 &  & exit /b
)

echo ==========================================
echo Creating Max Power Ultimate Power Plan
echo ==========================================

:: Duplicate Ultimate Performance plan
for /f "tokens=3" %%G in ('powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61') do set NEWGUID=%%G

:: Rename it
powercfg -changename %NEWGUID% "Max Power Max Performance" "Unlocked CPU + Boost + No Power Saving"

:: Set active
powercfg /setactive %NEWGUID%

:: ================================
:: UNHIDE ALL PROCESSOR SETTINGS
:: ================================
echo Unhiding hidden CPU settings...

for %%S in (
PERFBOOSTMODE
PERFBOOSTPOL
PERFEPP
PROCTHROTTLEMIN
PROCTHROTTLEMAX
CPMINCORES
CPMAXCORES
PROCFREQMAX
PROCFREQMIN
IDLEDISABLE
) do (
 &  & powercfg -attributes SUB_PROCESSOR %%S -ATTRIB_HIDE >nul 2>&1
)

:: ================================
:: CPU PERFORMANCE SETTINGS
:: ================================
echo Applying aggressive CPU tuning...

:: 0 = max performance (EPP)
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PERFEPP 0

:: Boost mode aggressive
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PERFBOOSTMODE 2

:: Boost policy aggressive
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PERFBOOSTPOL 2

:: 100% min/max CPU
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PROCTHROTTLEMAX 100

:: Disable idle parking
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR IDLEDISABLE 1

:: All cores active
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR CPMINCORES 100
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR CPMAXCORES 100

:: Remove frequency cap
powercfg /setacvalueindex %NEWGUID% SUB_PROCESSOR PROCFREQMAX 0

:: ================================
:: DISK + PCIe + USB
:: ================================
echo Disabling power saving on devices...

:: Turn off disk idle
powercfg /setacvalueindex %NEWGUID% SUB_DISK DISKIDLE 0

:: PCIe max performance
powercfg /setacvalueindex %NEWGUID% SUB_PCIEXPRESS ASPM 0

:: USB no suspend
powercfg /setacvalueindex %NEWGUID% SUB_USB USBSELECTIVE SUSPEND 0

:: ================================
:: GRAPHICS / GPU PREFERENCE
:: ================================
:: (works on modern Windows)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v HwSchMode /t REG_DWORD /d 2 /f >nul

:: ================================
:: SYSTEM RESPONSIVENESS (REAL tweak)
:: ================================
echo Applying system responsiveness tweaks...

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v SystemResponsiveness /t REG_DWORD /d 0 /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f >nul

:: ================================
:: DISABLE POWER THROTTLING
:: ================================
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" ^
/v PowerThrottlingOff /t REG_DWORD /d 1 /f >nul

:: ================================
:: APPLY PLAN AGAIN
:: ================================
powercfg /setactive %NEWGUID%

echo.
echo ==========================================
echo DONE - Max Power & Performance Enabled
echo ==========================================
echo Reboot recommended.
pause
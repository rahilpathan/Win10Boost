@echo off
REM XTRPerformancebyRahil - Compatible with Windows 11

:: Verify administrative privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ** Please run this script as Administrator **
    pause
    exit /b
)

:: Define base GUID for High Performance plan
set "GUID_HP=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
:: Duplicate the High Performance scheme
for /f "tokens=3" %%A in ('powercfg -duplicatescheme %GUID_HP%') do (
    set "NEW_GUID=%%A"
)

:: Rename the new scheme
powercfg -changename %NEW_GUID% "XTRPerformancebyRahil"

:: Configure AC settings
echo [*] Configuring AC settings...
powercfg -setacvalueindex %NEW_GUID% SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex %NEW_GUID% SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex %NEW_GUID% SUB_PROCESSOR PERFBOOSTMODE 2
powercfg -setacvalueindex %NEW_GUID% SUB_DISK DISKIDLE 0
powercfg -setacvalueindex %NEW_GUID% SUB_PCIEXPRESS ASPM 0
powercfg -setacvalueindex %NEW_GUID% SUB_USB USBSELECTIVE 0
powercfg -setacvalueindex %NEW_GUID% SUB_VIDEO VIDEODIM 0
powercfg -setacvalueindex %NEW_GUID% SUB_VIDEO ADAPTBRIGHT 0
powercfg -setacvalueindex %NEW_GUID% SUB_WIRELESS WIRELESSMODE 0

:: Configure DC settings
echo [*] Configuring DC settings...
powercfg -setdcvalueindex %NEW_GUID% SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setdcvalueindex %NEW_GUID% SUB_PROCESSOR PROCTHROTTLEMIN 30
powercfg -setdcvalueindex %NEW_GUID% SUB_PROCESSOR PERFBOOSTMODE 1
powercfg -setdcvalueindex %NEW_GUID% SUB_DISK DISKIDLE 20
powercfg -setdcvalueindex %NEW_GUID% SUB_USB USBSELECTIVE 1
powercfg -setdcvalueindex %NEW_GUID% SUB_VIDEO VIDEODIM 60
powercfg -setdcvalueindex %NEW_GUID% SUB_VIDEO ADAPTBRIGHT 1
powercfg -setdcvalueindex %NEW_GUID% SUB_WIRELESS WIRELESSMODE 2

:: Set the new plan as active
echo [*] Activating XTRPerformancebyRahil plan...
powercfg -setactive %NEW_GUID%

echo.
echo ** XTRPerformancebyRahil has been created and activated. **
pause

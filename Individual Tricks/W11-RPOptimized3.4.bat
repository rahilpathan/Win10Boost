@echo off
REM Ensure the script is run as Administrator
net session >nul 2>&1 || (echo ERROR: This script must be run as Administrator. & echo Please right-click and select "Run as administrator". & pause & exit /b 1)

REM Define GUIDs for the base and new power schemes
set "BASE_SCHEME=e9a42b02-d5df-448d-aa00-03f14749eb61" REM Balanced power plan GUID
set "NEW_SCHEME=99999999-9999-9999-9999-999999999995"  REM Custom GUID for the new scheme
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg -delete 99999999-9999-9999-9999-999999999995
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 99999999-9999-9999-9999-999999999995

REM Change the name and description of the new power scheme
powercfg -changename %NEW_SCHEME% "Extreme Performance" "Max performance on AC, ultra-low power on battery"
REM Set the new power scheme as active
powercfg -setactive %NEW_SCHEME%

REM Note: Some of these GUIDs might be specific to certain hardware or Windows versions.
REM Standard Aliases
powercfg -attributes SUB_PROCESSOR PERFBOOSTMODE -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX -ATTRIB_HIDE

REM Specific GUIDs for processor settings (typically for core parking, etc.)
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE

:: --- CPU Performance ---
REM Processor performance boost mode: 2 (Aggressive) on AC, 1 (Enabled) on DC
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTMODE 2 >nul
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTMODE 4 >nul
powercfg -setactive %NEW_SCHEME%

REM Maximum processor frequency: 100% on AC (no explicit command needed if PROCFREQMAX is unhidden and set to 0 for no limit)
REM Minimum processor frequency: 100% on AC
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMAX 100 >nul
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMIN 50 >nul

REM Minimum CPU cores parked
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES 128 >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR CPMINCORES 4 >nul


REM System cooling policy: Active on AC (0), Passive on DC (1)
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR SYSCOOLPOL 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR SYSCOOLPOL 0 >nul

REM Core Parking registry tweaks
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f >nul
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d 0 /f >nul

:: --- USB & PCIe & Networking ---
powercfg -setacvalueindex %NEW_SCHEME% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1 >nul


REM PCI Express - Link State Power Management: Off on AC (0), Max power savings on DC (usually 2 or 3, 3 is not standard, 2 is Max Power Savings)
powercfg -setacvalueindex %NEW_SCHEME% SUB_PCIEXPRESS ASPM 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PCIEXPRESS ASPM 2 >nul

REM Values: 0 (Max Perf), 1 (Low PS), 2 (Med PS), 3 (Max PS)
powercfg -setacvalueindex %NEW_SCHEME% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 1 >nul

REM Turn off hard disk after: Never on AC (0 minutes), 2 minutes (120 seconds) on DC
powercfg -setacvalueindex %NEW_SCHEME% SUB_DISK DISKIDLE 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% SUB_DISK DISKIDLE 120 >nul

REM 0 = Prevent idling to sleep, 1 = Allow computer to sleep
powercfg -setacvalueindex %NEW_SCHEME% SUB_VIDEO VIDEOIDLE 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% SUB_VIDEO VIDEOIDLE 1 >nul

REM Adaptive Brightness: Off on AC, On on DC
powercfg -setacvalueindex %NEW_SCHEME% 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 1 >nul

REM Lid Close Action: Do nothing on AC, Sleep on DC
powercfg -setacvalueindex %NEW_SCHEME% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0 >nul
powercfg -setdcvalueindex %NEW_SCHEME% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1 >nul

REM Additional Device running on AC Power performance boosting tricks (github/rahilpathan)
REM IF CPU Overheats Change PERFDECTHRESHOLD=90, CPDECREASETIME=20 CPMINCORES=4
powercfg -attributes SUB_PROCESSOR CPMINCORES -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR CPMAXCORES -ATTRIB_HIDE
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPMAXCORES 100
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPMINCORES 100
powercfg -setdcvalueindex %NEW_SCHEME% sub_processor CPMAXCORES 100
powercfg -setdcvalueindex %NEW_SCHEME% sub_processor CPMINCORES 100
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR 94d3a615-a899-4ac5-ae2b-e4d8f634367f 0
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFINCTHRESHOLD 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFINCTIME 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFDECTHRESHOLD 100
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFAUTONOMOUS 0
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFDUTYCYCLING 0
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PROCTHROTTLEMAX 100
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPMINCORES 100
powercfg -setacvalueindex %NEW_SCHEME% sub_processor DISTRIBUTEUTIL 0
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPINCREASETIME 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPDECREASETIME 100
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPHEADROOM 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor CPCONCURRENCY 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor LATENCYHINTUNPARK 1
powercfg -setacvalueindex %NEW_SCHEME% sub_processor PERFEPP 0

powercfg -setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 300

sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled  >nul 2>&1
bcdedit /set disabledynamictick yes  >nul 2>&1
bcdedit /set tscsyncpolicy disabled  >nul 2>&1
bcdedit /set useplatformtick yes  >nul 2>&1
fsutil behavior set memoryusage 2  >nul 2>&1
fsutil behavior set allowextchar 1  >nul 2>&1
fsutil behavior set mftzone 4  >nul 2>&1
fsutil behavior set disablecompression 1  >nul 2>&1
fsutil behavior set disableencryption 1  >nul 2>&1
fsutil behavior set disabledeletenotify 0  >nul 2>&1

powershell -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Unrestricted -Command "Disable-MMAgent -mc -pc"


reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v "DODownloadMode" /t REG_DWORD /d 0 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d 1 /f >nul
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableBoottrace" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "SfTracingState" /t REG_DWORD /d 0 /f


reg add "HKLM\SYSTEM\CurrentControlSet\Services\intelppm" /v "Start" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\intelpep" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iagpio" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iai2c" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_GPIO2" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_GPIO2_BXT_P" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_I2C" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSS2i_I2C_BXT_P" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSSi_GPIO" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaLPSSi_I2C" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaStorAVC" /v "Start" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\iaStorV" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AmdK8" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AmdPPM" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdsata" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdsbs" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdxata" /v "Start" /t REG_DWORD /d 4 /f


REM Re-activate the scheme to ensure all changes are applied to the current scheme context
powercfg -setactive %NEW_SCHEME%
echo.
echo Power plan RP-Optimized3.4 configured and activated!
pause
exit /b 0

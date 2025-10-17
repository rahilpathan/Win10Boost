@echo off
REM Ensure the script is run as Administrator
net session >nul 2>&1 || (echo ERROR: This script must be run as Administrator. & echo Please right-click and select "Run as administrator". & pause & exit /b 1)
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /delete 99999999-9999-9999-9999-999999999995

REM Define GUIDs for the base and new power schemes
set "BASE_SCHEME=e9a42b02-d5df-448d-aa00-03f14749eb61"
set "NEW_SCHEME=99999999-9999-9999-9999-999999999995"

REM Switch to balanced plan before deleting custom plan
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e >nul 2>&1
powercfg -delete %NEW_SCHEME% >nul 2>&1
powercfg -duplicatescheme %BASE_SCHEME% %NEW_SCHEME%

REM Change the name and description
powercfg -changename %NEW_SCHEME% "Extreme Performance" "Max performance on AC, efficient on battery"
powercfg -setactive %NEW_SCHEME%

REM Unhide advanced power settings
powercfg -attributes SUB_PROCESSOR PERFBOOSTMODE -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PERFBOOSTPOL -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR CPMINCORES -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR CPMAXCORES -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE

echo Configuring CPU Performance Settings...
REM === CPU PERFORMANCE ===
REM Processor performance boost mode: Aggressive (2) on AC, Disabled (4) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTMODE 2
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTMODE 4

REM Processor performance boost policy: 100% on AC, 60% on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTPOL 100
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFBOOSTPOL 60

REM Processor performance throttling: No throttling (0) on AC, Optimal (2) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEPOL 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEPOL 2

REM Maximum processor state: 100% on both
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMAX 100

REM Minimum processor state: 80% on AC (prevents excessive downclocking), 50% on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMIN 80
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCTHROTTLEMIN 50

REM Processor frequency limit: 0 = no limit
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCFREQMAX 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PROCFREQMAX 0

REM System cooling policy: Active (0) on AC for fan prioritization, Passive (1) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR SYSCOOLPOL 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR SYSCOOLPOL 1

echo Configuring Core Parking (Disabled)...
REM === CORE PARKING - FULLY DISABLED ===
REM All cores unparked at all times: 100% on AC, 100% on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPMINCORES 100
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPMAXCORES 100
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR CPMINCORES 100
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR CPMAXCORES 100

REM Core parking - increase/decrease times (aggressive for responsiveness)
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPINCREASETIME 1 >nul 2>&1
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPDECREASETIME 20 >nul 2>&1
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPHEADROOM 10 >nul 2>&1
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR CPCONCURRENCY 0 >nul 2>&1

powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR CPINCREASETIME 1 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR CPDECREASETIME 20 >nul 2>&1

REM Performance increase/decrease thresholds (aggressive on AC for max responsiveness)
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFINCTHRESHOLD 10 >nul 2>&1
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFDECTHRESHOLD 8 >nul 2>&1
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFINCTIME 1 >nul 2>&1

powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFINCTHRESHOLD 10 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFDECTHRESHOLD 8 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFINCTIME 1 >nul 2>&1

REM Heterogeneous thread scheduling policy: Disabled (0) on AC for consistent performance
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR DISTRIBUTEUTIL 0 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR DISTRIBUTEUTIL 1 >nul 2>&1

REM Processor performance autonomous mode: Disabled on AC for manual control
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFAUTONOMOUS 0 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFAUTONOMOUS 1 >nul 2>&1

REM Processor duty cycling: Disabled
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFDUTYCYCLING 0 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFDUTYCYCLING 1 >nul 2>&1

REM Latency hint for processor idle state: Aggressive (1) on AC
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR LATENCYHINTUNPARK 1 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR LATENCYHINTUNPARK 100 >nul 2>&1

REM Energy performance preference: 0 = maximum performance on AC
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFEPP 0 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR PERFEPP 50 >nul 2>&1

REM Processor idle demote/promote thresholds
powercfg -setacvalueindex %NEW_SCHEME% SUB_PROCESSOR 94d3a615-a899-4ac5-ae2b-e4d8f634367f 0 >nul 2>&1
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PROCESSOR 94d3a615-a899-4ac5-ae2b-e4d8f634367f 50 >nul 2>&1

echo Configuring GPU Settings...
REM === GPU SETTINGS ===
REM Graphics power plan: Maximum performance (0) on AC, Power saving (2) on battery
powercfg -setacvalueindex %NEW_SCHEME% 5fb4938d-1ee8-4b0f-9a3c-5036b0ab995c dd848b2a-8a5d-4451-9ae2-39cd41658f6c 0
powercfg -setdcvalueindex %NEW_SCHEME% 5fb4938d-1ee8-4b0f-9a3c-5036b0ab995c dd848b2a-8a5d-4451-9ae2-39cd41658f6c 2

echo Configuring USB and PCIe Settings...
REM === USB & PCIE SETTINGS ===
REM USB selective suspend: Off (0) on AC, On (1) on battery
powercfg -setacvalueindex %NEW_SCHEME% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setdcvalueindex %NEW_SCHEME% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1

REM PCI Express - Link State Power Management: Off (0) on AC, Max savings (2) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_PCIEXPRESS ASPM 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_PCIEXPRESS ASPM 2

echo Configuring Network Adapter Settings...
REM === NETWORK ADAPTER ===
REM Network adapter power saving: Max performance (0) on AC, Low power (1) on battery
powercfg -setacvalueindex %NEW_SCHEME% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setdcvalueindex %NEW_SCHEME% 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 1

echo Configuring Display and Disk Settings...
REM === DISK SETTINGS ===
REM Turn off hard disk: Never (0) on AC, 10 minutes (600 sec) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_DISK DISKIDLE 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_DISK DISKIDLE 600

REM === DISPLAY SETTINGS ===
REM Display idle timeout: Never (0) on AC, 5 minutes (300 sec) on battery
powercfg -setacvalueindex %NEW_SCHEME% SUB_VIDEO VIDEOIDLE 0
powercfg -setdcvalueindex %NEW_SCHEME% SUB_VIDEO VIDEOIDLE 300

REM Display brightness: 100% on AC, 80% on battery
powercfg -setacvalueindex %NEW_SCHEME% 7516B95F-F776-4464-8C53-06167F40CC99 ADED5E82-B909-4619-9949-F5D71DAC0B67 100
powercfg -setdcvalueindex %NEW_SCHEME% 7516B95F-F776-4464-8C53-06167F40CC99 ADED5E82-B909-4619-9949-F5D71DAC0B67 80

REM Adaptive brightness: Off (0) on both AC and battery
powercfg -setacvalueindex %NEW_SCHEME% 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0
powercfg -setdcvalueindex %NEW_SCHEME% 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0

REM === LID CLOSE ACTION ===
REM Lid close: Do nothing (0) on AC, Sleep (1) on battery
powercfg -setacvalueindex %NEW_SCHEME% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
powercfg -setdcvalueindex %NEW_SCHEME% 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1

echo Applying popular system-wide optimizations...
REM === SYSTEM-WIDE OPTIMIZATIONS (WELL-KNOWN & POPULAR) ===

REM Disable dynamic tick - Popular for reducing timer interrupts and improving performance
bcdedit /set disabledynamictick yes >nul 2>&1

REM Enhanced TSC sync policy - Standard optimization for modern CPUs
bcdedit /set tscsyncpolicy enhanced >nul 2>&1

REM Remove platform tick - Common tweak for reducing overhead
bcdedit /deletevalue useplatformtick >nul 2>&1

REM APIC mode settings - Standard for modern systems
bcdedit /set uselegacyapicmode no >nul 2>&1
bcdedit /set usephysicaldestination no >nul 2>&1

REM File system optimizations - Well-known for performance
fsutil behavior set memoryusage 2 >nul 2>&1
fsutil behavior set allowextchar 1 >nul 2>&1
fsutil behavior set mftzone 4 >nul 2>&1
fsutil behavior set disabledeletenotify 0 >nul 2>&1

echo Configuring services...
REM === SERVICES (POPULAR TWEAKS) ===
REM Disable SysMain/Superfetch - Very popular tweak for gaming/performance
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start=disabled >nul 2>&1

REM Disable Memory Compression - Popular for reducing CPU overhead on high-RAM systems
powershell -NoLogo -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Disable-MMAgent -mc -pc" >nul 2>&1

REM Re-activate the scheme to apply all changes
powercfg -setactive %NEW_SCHEME%

echo.
echo ========================================
echo Extreme Performance Plan Configured!
echo ========================================
echo.
echo Power Plan Settings Applied:
echo [+] CPU: Aggressive boost, no throttling on AC
echo [+] Core Parking: FULLY DISABLED (all cores always active)
echo [+] GPU: Maximum performance on AC
echo [+] USB/PCIe: No power saving on AC
echo [+] Disk: Never turn off on AC
echo [+] Display: Never turn off on AC
echo.
echo System Optimizations Applied:
echo [+] Dynamic tick disabled
echo [+] Enhanced TSC sync policy
echo [+] Platform tick removed
echo [+] Modern APIC mode
echo [+] File system optimizations
echo [+] SysMain/Superfetch disabled
echo [+] Memory compression disabled
echo.
echo IMPORTANT THERMAL NOTES:
echo - All cores will remain active at all times
echo - Monitor CPU temperatures during heavy loads
echo - Ensure adequate cooling solution
echo - Consider thermal paste quality
echo - If temps exceed 90C, reduce Min Processor State to 50%%
echo.
echo Reboot recommended for all changes to take effect.
echo.
echo Press any key to exit...
pause >nul
exit /b 0
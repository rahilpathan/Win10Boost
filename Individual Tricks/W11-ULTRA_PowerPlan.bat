@echo off
setlocal enabledelayedexpansion

net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as Administrator.
    pause
    exit /b
)

powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e
powercfg /delete 99999999-9999-9999-9999-999999999999 >nul 2>&1
powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e 99999999-9999-9999-9999-999999999999
if %errorlevel% neq 0 (
    echo Failed to create new power scheme. Check if the GUID is unique or try again.
    pause
    exit /b
)

powercfg -setactive 99999999-9999-9999-9999-999999999999
powercfg -changename 99999999-9999-9999-9999-999999999999 "Github-RahilPathan-Optimized" "Max performance on AC, ultra-low power on battery"

:: Unlocking ATTRIBUTES
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v Attributes /t REG_DWORD /d 0 /f
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PERFBOOSTMODE -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX1 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX1 -ATTRIB_HIDE

:: AC Power Settings
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 5
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 94d3a615-a899-4ac5-ae2b-e4d8f634367f 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 6
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 5
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df6 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMIN 5
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR IDLEDISABLE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PARKINGMAXCORES 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PARKINGMINCORES 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 sub_processor CPMINCORES 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 sub_processor CPMINCORES1 100
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_DISK DISKIDLE 1000
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_DISK DISKBUSYTHRESHOLD 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_DISK IDLETIMEOUT 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PCIEXPRESS ASPM 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_USB USBSELECTIVE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO VIDEOIDLE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO ADAPTBRIGHT 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_WIFI POWERMODE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_SLEEP STANDBYIDLE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_SLEEP HIBERNATEIDLE 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PCIEXPRESS PCIEASPM 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO VIDEODIM 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_WIFI WIFIPOWER 0
powercfg /setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PERFBOOSTMODE 6
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR SYS_COOLING_POLICY 0

:: DC Power Settings
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 100
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 0
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 1200
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df6 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 60
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMIN 5
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR IDLEDISABLE 0
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PARKINGMAXCORES 100
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PARKINGMINCORES 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 sub_processor CPMINCORES 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 sub_processor CPMINCORES1 100
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_DISK DISKIDLE 1000
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PCIEXPRESS ASPM 3
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_USB USBSELECTIVE 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO VIDEOIDLE 60
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO ADAPTBRIGHT 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_WIFI POWERMODE 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_SLEEP STANDBYIDLE 900
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_SLEEP HIBERNATEIDLE 1800
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PCIEXPRESS PCIEASPM 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO VIDEODIM 300
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_WIFI WIFIPOWER 2
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PERFBOOSTMODE 1
powercfg /setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR SYS_COOLING_POLICY 1

:: Apply registry tweaks for performance optimization
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start= disabled  >nul 2>&1
bcdedit /deletevalue useplatformclock  >nul 2>&1
bcdedit /set disabledynamictick yes  >nul 2>&1
bcdedit /set tscsyncpolicy Enhanced  >nul 2>&1
bcdedit /set useplatformtick yes  >nul 2>&1
fsutil behavior set memoryusage 2  >nul 2>&1
fsutil behavior set allowextchar 1  >nul 2>&1
fsutil behavior set mftzone 4  >nul 2>&1
fsutil behavior set disablecompression 1  >nul 2>&1
fsutil behavior set disableencryption 1  >nul 2>&1
fsutil behavior set disabledeletenotify 0  >nul 2>&1

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CSEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 5 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d 1 /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 30 /f

powercfg -h off

echo Power plan updated successfully!
PAUSE

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

powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_DISK 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PCIEXPRESS ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMIN 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 2
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_SLEEP 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_USB 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 SUB_WIRELESS 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 50
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 5
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 60
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 30
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 50
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c 5
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMAX 100
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR PROCTHROTTLEMIN 5
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_PROCESSOR bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 60
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 SUB_VIDEO aded5e82-b909-4619-9949-f5d71dac0bcb 30
bcdedit /set disabledynamictick yes

powercfg -setactive 99999999-9999-9999-9999-999999999999


reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d "5" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DistributeTimers" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "16710656" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\ModernSleep" /v "CoalescingTimerInterval" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "10" /f
reg add "HKLM\Software\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Reliability" /v "IoPriority" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "LargeSystemCache" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableTsx" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\ScheduledDiagnostics" /v "EnabledExecution" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f

echo Github-RahilPathan-Optimized power plan applied successfully!
pause

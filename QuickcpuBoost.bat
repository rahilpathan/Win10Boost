:: CPU TWEAKS:
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 2

powercfg -attributes SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 100

powercfg -attributes SUB_PROCESSOR 893df05a-58d8-4ed9-950e-8250005d562b -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 893df05a-58d8-4ed9-950e-8250005d562b 5
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 100

powercfg -attributes SUB_PROCESSOR 3668a13e-1e35-465b-958a-531a96574780 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 3668a13e-1e35-465b-958a-531a96574780 0
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
powercfg -attributes SUB_PCIEXPRESS ee12f906-d277-404b-b6da-e5fa1a576df5 -ATTRIB_HIDE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg /setacvalueindex SCHEME_CURRENT SUB_DISK 6738e2c4-e8a5-4a42-b16a-397c76a74613 0

::NETWORK TWEAKS:
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global rss=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
for /f "tokens=3" %%a in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\NetworkCards" /s ^| findstr /i "ServiceName"') do (
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\%%a" /v "TCPNoDelay" /t REG_DWORD /d 1 /f
)

:: Features above will keep draining CPU - 2/8/26 so below is added to hibernate when not in use.
powercfg /hibernate on
:: Forces Network Connectivity to 'Never' on Battery
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "DCSettingIndex" /t REG_DWORD /d 0 /f
:: Forces Network Connectivity to 'Never' when Plugged In
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "ACSettingIndex" /t REG_DWORD /d 0 /f
:: For Below Value 2 = Hibernate (1=Sleep, 3=Shutdown, 0=Nothing)
:: On Battery
powercfg /setdcvalueindex SCHEME_CURRENT 4f971e98-33f7-4e44-8701-4c8104130c33 5ca79f96-3741-4351-bca3-60055214b6d4 2
:: Plugged In
powercfg /setacvalueindex SCHEME_CURRENT 4f971e98-33f7-4e44-8701-4c8104130c33 5ca79f96-3741-4351-bca3-60055214b6d4 2

powercfg /setactive SCHEME_CURRENT

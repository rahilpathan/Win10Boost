@echo off
:: UNLOCK ULTIMATE PERFORMANCE
powercfg -duplicatescheme e9a42b02-d5df-4448-8452-88b6150e2144
powercfg /setactive e9a42b02-d5df-4448-8452-88b6150e2144

:: PROCESSOR TWEAKS (Using Aliases for Global Support)
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIBUTES_RESTORE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 2
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 75b0ae3f-bce0-45a7-8c89-c9611c25e100 100
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 893df05a-58d8-4ed9-950e-8250005d562b 5
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIBUTES_RESTORE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg -attributes SUB_PROCESSOR 3668a13e-1e35-465b-958a-531a96574780 -ATTRIBUTES_RESTORE
powercfg /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR 3668a13e-1e35-465b-958a-531a96574780 0

:: SYSTEM RESPONSIVENESS
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f

:: HIBERNATION & POWER BUTTONS
powercfg /hibernate on
powercfg -attributes SUB_BUTTONS 5ca79f96-3741-4351-bca3-60055214b6d4 -ATTRIBUTES_RESTORE
powercfg /setacvalueindex SCHEME_CURRENT SUB_BUTTONS 5ca79f96-3741-4351-bca3-60055214b6d4 2
powercfg /setdcvalueindex SCHEME_CURRENT SUB_BUTTONS 5ca79f96-3741-4351-bca3-60055214b6d4 2

:: Modern Standby (Network Connectivity) -> 'Never'
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "DCSettingIndex" /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "ACSettingIndex" /t REG_DWORD /d 0 /f

:: APPLY
powercfg /s SCHEME_CURRENT
echo Bases covered. Global tweak applied.
pause
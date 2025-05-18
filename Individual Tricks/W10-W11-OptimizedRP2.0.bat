@echo off
net session >nul 2>&1 || (echo Run as Administrator & pause & exit /b)

set BASE=e9a42b02-d5df-448d-aa00-03f14749eb61
set NEW=99999999-9999-9999-9999-999999999998
powercfg -list | find "%NEW%" >nul 2>&1 || powercfg -duplicatescheme %BASE% %NEW%

powercfg -changename %NEW% "RP-Optimized2.0" "Max performance on AC, ultra-low power on battery"
powercfg -setactive %NEW%
echo Changing on %NEW%
PAUSE
powercfg -attributes SUB_PROCESSOR PERFBOOSTMODE    -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX      -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCTHROTTLEMAX1 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR PROCFREQMAX1 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 0cc5b647-c1df-4637-891a-dec35c318583 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 893dee8e-2bef-41e0-89c6-b55d0929964c -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR 45bcc044-d885-43e2-8605-ee0ec6e96b59 -ATTRIB_HIDE
powercfg -attributes SUB_PROCESSOR be337238-0d82-4146-a960-4f3749d470c7 -ATTRIB_HIDE
PAUSE
:: ——— CPU Performance ———
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE        2 >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR PERFBOOSTMODE        1 >nul
PAUSE
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMAX      100 >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR PROCTHROTTLEMIN      100 >nul
PAUSE
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR SYS_COOLING_POLICY   0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR SYS_COOLING_POLICY   1   >nul
PAUSE
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR MIN_PROCESSOR_STATE     100   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR MIN_PROCESSOR_STATE      5   >nul
PAUSE
powercfg -setacvalueindex SCHEME_CURRENT SUB_PROCESSOR MAX_PROCESSOR_STATE     100   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PROCESSOR MAX_PROCESSOR_STATE      80   >nul
PAUSE
powercfg -setacvalueindex SCHEME_CURRENT sub_processor CPMINCORES 100
powercfg -setacvalueindex SCHEME_CURRENT sub_processor CPMINCORES1 100
:: Disable Core Parking
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\0cc5b647-c1df-4637-891a-dec35c318583" /v "ValueMax" /t REG_DWORD /d "0" /f

:: ——— USB & PCIe & Networking ———
powercfg -setacvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVESUSPEND         0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVESUSPEND         1   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM                0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM                3   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_WIFI WIFIDIS                   0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_WIFI WIFIDIS                   1   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_MOBILEBROADBAND GPRSSTATE      0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_MOBILEBROADBAND GPRSSTATE      1   >nul

:: ——— Disk & Storage ———
powercfg -setacvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE                  0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_DISK DISKIDLE                  120 >nul

:: ——— Video & Multimedia ———
powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE                0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOIDLE                1   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO DECODE_POWER_SAVING_MODE 0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_VIDEO DECODE_POWER_SAVING_MODE 1   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOQUALITYBIAS         0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOQUALITYBIAS         1   >nul
powercfg -setacvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOPLAYBACK            0   >nul
powercfg -setdcvalueindex SCHEME_CURRENT SUB_VIDEO VIDEOPLAYBACK            1   >nul

:: ——— Display & Sleep & Hibernate ———
powercfg /change monitor-timeout-ac 30
powercfg /change monitor-timeout-dc 5
powercfg /change standby-timeout-ac 0
powercfg /change standby-timeout-dc 15
powercfg /change hibernate-timeout-ac 0
powercfg /change hibernate-timeout-dc 30

:: ——— Additional Optimizations ———
:: Adaptive Brightness (disable on AC, enable on DC)
powercfg -setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 0 >nul
powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 FBD9AA66-9553-4097-BA44-ED6E9D65EAB8 1 >nul

:: Adaptive Backlight (disable on AC, enable on DC)
powercfg -setacvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcc 0 >nul
powercfg -setdcvalueindex SCHEME_CURRENT 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcc 1 >nul

:: Lid Close Action (Do nothing on AC, Sleep on DC)
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0 >nul
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1 >nul

:: Mouse Latency Boost
reg add "HKLM\SYSTEM\ControlSet001\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "TimeLimitInSeconds" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\Profile\Events\{54533251-82be-4824-96c1-47b60b740d00}\{0DA965DC-8FCF-4c0b-8EFE-8DD5E7BC959A}\{7E01ADEF-81E6-4e1b-8075-56F373584694}" /v "TimeLimitInSeconds" /t REG_DWORD /d "1" /f

:: ——— Fast Startup & Hibernation File ———
powercfg /hibernate on

:: ——— Apply & Exit ———
powercfg -setactive %NEW%
echo Power plan RP-Optimized2.0 activated!
pause
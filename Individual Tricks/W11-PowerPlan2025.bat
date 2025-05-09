@echo off
setlocal EnableDelayedExpansion

echo ===================================================
echo    Windows 11 Hybrid Power Plan Creator
echo  (AC: Maximum Performance / DC: Power Efficient)
echo ===================================================
echo.

:: Check for admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] This script requires administrator privileges.
    echo     Please run as administrator and try again.
    pause
    exit /b 1
)

:: Set base GUID (High Performance)
set "GUID_HP=8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"

echo [*] Creating new power plan based on High Performance...
for /f "tokens=3" %%A in ('powercfg -duplicatescheme %GUID_HP%') do (
    set "NEW_GUID=%%A"
)

echo [*] Renaming to "Win11-Hybrid"...
powercfg -changename !NEW_GUID! "Win11-Hybrid" "Optimized power plan with maximum performance on AC and battery efficiency on DC"

echo [*] Configuring AC settings (Maximum Performance)...
:: Processor settings using exact GUIDs for Windows 11 compatibility
powercfg -setacvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2
:: Core parking settings
powercfg -setacvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 100
powercfg -setacvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 1

:: Disk settings
powercfg -setacvalueindex !NEW_GUID! 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0

:: PCI Express settings
powercfg -setacvalueindex !NEW_GUID! 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df6 0

:: USB settings
powercfg -setacvalueindex !NEW_GUID! 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

:: Display settings
powercfg -setacvalueindex !NEW_GUID! 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 0
powercfg -setacvalueindex !NEW_GUID! 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 0

:: Wireless adapter settings
powercfg -setacvalueindex !NEW_GUID! 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0

echo [*] Configuring DC settings (Power Efficient)...
:: Processor settings - balanced for battery life
powercfg -setdcvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setdcvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 30
powercfg -setdcvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 1
:: Core parking settings for battery savings
powercfg -setdcvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 50
powercfg -setdcvalueindex !NEW_GUID! 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 0

:: Disk settings (20 minutes)
powercfg -setdcvalueindex !NEW_GUID! 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 1200

:: PCI Express settings (moderate power savings)
powercfg -setdcvalueindex !NEW_GUID! 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df6 1

:: USB settings (enabled)
powercfg -setdcvalueindex !NEW_GUID! 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 1

:: Display settings
powercfg -setdcvalueindex !NEW_GUID! 7516b95f-f776-4464-8c53-06167f40cc99 17aaa29b-8b43-4b94-aafe-35f64daaf1ee 60
powercfg -setdcvalueindex !NEW_GUID! 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 1

:: Wireless adapter settings (medium power savings)
powercfg -setdcvalueindex !NEW_GUID! 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 2

echo [*] Activating Win11-Hybrid power plan...
powercfg -setactive !NEW_GUID!

echo [*] Applying Windows 11 compatible performance registry tweaks...
:: Disable power throttling (Windows 11 specific)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
:: Disable energy estimation and event processing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d 0 /f
:: Windows 11 Memory Management Settings
:: Note: SysMain (formerly Superfetch) is handled differently in Windows 11
sc config "SysMain" start= disabled
sc stop "SysMain" >nul 2>&1
:: Disable Connected Standby for better performance (Windows 11 specific)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CSEnabled" /t REG_DWORD /d 0 /f
:: System responsiveness optimization for Windows 11
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Affinity" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Only" /t REG_SZ /d "False" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Clock Rate" /t REG_DWORD /d 10000 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f
:: TCP/IP tweaks compatible with Windows 11
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDataRetransmissions" /t REG_DWORD /d 5 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableTaskOffload" /t REG_DWORD /d 0 /f
:: UI responsiveness
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v "AutoEndTasks" /t REG_SZ /d 1 /f
:: Disable Dynamic Tick (Windows 11 compatible)
bcdedit /set disabledynamictick yes >nul 2>&1
bcdedit /set useplatformtick yes >nul 2>&1

echo.
echo ===================================================
echo [✓] Win11-Hybrid power plan by Github_RahilPathan has been created and activated
echo.
echo     AC power: Maximum Performance
echo     DC power: Power Efficient
echo ===================================================
echo.
echo Press any key to exit...
pause >nul

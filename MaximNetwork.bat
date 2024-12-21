@echo off
setlocal enabledelayedexpansion

echo WARNING: This script will modify network adapter settings for maximum performance.
echo Please ensure you have administrator privileges.
pause

rem Store current network adapter name
for /f "tokens=3*" %%i in ('netsh interface show interface ^| findstr "Connected"') do set CURRENT_ADAPTER=%%j

echo Current network adapter: %CURRENT_ADAPTER%
echo.

rem Disable Power Saving for All Network Adapters
echo Disabling power saving features for network adapters...
powershell -Command "Get-NetAdapter | ForEach-Object { $adapter = $_.InterfaceDescription; $devicePath = Get-PnpDevice | Where-Object { $_.FriendlyName -eq $adapter } | Select-Object -ExpandProperty InstanceId; if ($devicePath) { reg add 'HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e972-e325-11ce-bfc1-08002be10318}\' /v PnPCapabilities /t REG_DWORD /d 24 /f } }"

rem Optimize Network Adapter Settings
echo Optimizing network adapter settings...
for /f "tokens=*" %%a in ('wmic nic get name ^| find "Wireless"') do (
    netsh interface tcp set supplemental %%a enable
    netsh interface tcp set supplemental %%a congestionprovider=ctcp
)

rem Optimize TCP/IP Settings
echo Optimizing TCP/IP settings...
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global chimney=enabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global ecncapability=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set global initialRto=2000
netsh int tcp set global rsc=enabled

rem Set Network Throttling Index
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f

rem Disable Network Power Management
echo Disabling network power management...
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0
powercfg -setdcvalueindex 88888888-8888-8888-8888-228888888821 19cbb8fa-5279-450e-9fac-8a3d5fedd0c1 12bbebe6-58d6-4636-95bb-3217ef867c1a 0

rem Optimize WiFi Performance Settings
echo Optimizing WiFi performance...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mrvlpcie8897" /v "PowerSaveMode" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\NETwNb64" /v "PowerSaveMode" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelAC" /v "PowerSaveMode" /t REG_SZ /d "0" /f

rem Disable WiFi Sense
reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v "AutoConnectAllowedOEM" /t REG_DWORD /d 0 /f

rem Optimize Network Card Properties using PowerShell
echo Optimizing network card advanced properties...
powershell -Command "Get-NetAdapter -Name '*' | ForEach-Object { Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName 'Packet Coalescing' -DisplayValue 'Disabled' -ErrorAction SilentlyContinue }"
powershell -Command "Get-NetAdapter -Name '*' | ForEach-Object { Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName 'Power Saving Mode' -DisplayValue 'Disabled' -ErrorAction SilentlyContinue }"
powershell -Command "Get-NetAdapter -Name '*' | ForEach-Object { Set-NetAdapterAdvancedProperty -Name $_.Name -DisplayName 'Energy-Efficient Ethernet' -DisplayValue 'Disabled' -ErrorAction SilentlyContinue }"

rem Optimize QoS Settings
echo Optimizing QoS settings...
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Psched" /v "NonBestEffortLimit" /t REG_DWORD /d 0 /f

rem Reset Winsock and TCP/IP Stack
echo Resetting Winsock and TCP/IP stack...
netsh winsock reset
netsh int ip reset

rem Configure Network Adapter Properties
echo Configuring network adapter properties for maximum performance...
for /f "tokens=*" %%a in ('wmic nic get name ^| find "Wireless"') do (
    powershell -Command "$adapter = Get-NetAdapter -Name '*%%a*'; Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName 'Roaming Aggressiveness' -DisplayValue 'Lowest' -ErrorAction SilentlyContinue"
    powershell -Command "$adapter = Get-NetAdapter -Name '*%%a*'; Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName 'Transmit Power' -DisplayValue 'Highest' -ErrorAction SilentlyContinue"
    powershell -Command "$adapter = Get-NetAdapter -Name '*%%a*'; Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName 'Band Preference' -DisplayValue '5GHz' -ErrorAction SilentlyContinue"
    powershell -Command "$adapter = Get-NetAdapter -Name '*%%a*'; Set-NetAdapterAdvancedProperty -Name $adapter.Name -DisplayName 'Auto Power Save Mode' -DisplayValue 'Disabled' -ErrorAction SilentlyContinue"
)

rem Optimize IPv4 Settings
echo Optimizing IPv4 settings...
netsh int ipv4 set global taskoffload=enabled
netsh int ipv4 set global neighborcachelimit=4096
netsh int ipv4 set global defaultcurhoplimit=64

rem Configure Additional TCP Parameters
echo Configuring TCP parameters...
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableWsd" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TCPNoDelay" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpAckFrequency" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpDelAckTicks" /t REG_DWORD /d 0 /f

rem Disable Large Send Offload
echo Disabling Large Send Offload...
powershell -Command "Disable-NetAdapterLso -Name '*'"

rem Set DNS Client Service to Automatic
sc config "Dnscache" start= auto

echo Configuration complete! System needs to restart for all changes to take effect.
echo A system restart is required
echo.
echo Would you like to restart your computer now? (Y/N)
set /p restart=
if /i "%restart%"=="Y" shutdown /r /t 10 /c "Restarting to apply network optimizations..."
pause
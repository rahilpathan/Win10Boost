powershell "Set-ExecutionPolicy -ExecutionPolicy Unrestricted"

::BCD POWERCHOKES

bcdedit /set allowedinmemorysettings 0
bcdedit /set useplatformclock No
bcdedit /set useplatformtick Yes
bcdedit /set disabledynamictick Yes
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set debug No
bcdedit /set isolatedcontext No
bcdedit /set pae ForceEnable
bcdedit /set bootmenupolicy Legacy
bcdedit /set usefirmwarepcisettings No
bcdedit /set sos Yes

bcdedit /set disableelamdrivers Yes
bcdedit /set quietboot Yes
bcdedit /set x2apicpolicy Enable
bcdedit /set vsmlaunchtype Off
bcdedit /set usephysicaldestination No
bcdedit /set ems No
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set configaccesspolicy Default
bcdedit /set linearaddress57 optin
bcdedit /set noumex Yes
bcdedit /set bootems No
bcdedit /set graphicsmodedisabled No
bcdedit /set extendedinput Yes
bcdedit /set highestmode Yes
bcdedit /set forcefipscrypto No
bcdedit /set perfmem 0
bcdedit /set clustermodeaddressing 1
bcdedit /set configflags 0
bcdedit /set uselegacyapicmode No
bcdedit /set onecpu No
bcdedit /set halbreakpoint No
bcdedit /set forcelegacyplatform No

:: REMOVE BLOATWARES
PowerShell -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers| Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *xboxapp* -AllUsers| Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay * -AllUsers| Remove-AppxPackage"


::REMOVE TELEMETRY




::INTERNET TWEAKS
powershell "Get-NetAdapter -IncludeHidden | Set-NetIPInterface -WeakHostSend Enabled -WeakHostReceive Enabled -RetransmitTimeMs 0 -Forwarding Disabled -EcnMarking Disabled -AdvertiseDefaultRoute Disabled -ErrorAction SilentlyContinue"

:: NETSH
netsh int tcp show global
netsh interface teredo set state disabled
netsh interface 6to4 set state disabled
netsh interface isatap set state disable


PowerShell Disable-MMAgent -MemoryCompression
PowerShell Disable-NetAdapterChecksumOffload -Name "*"
PowerShell Disable-NetAdapterIPsecOffload -Name "*"
PowerShell Disable-NetAdapterLso -Name "*"
PowerShell Disable-NetAdapterPowerManagement -Name "*"
PowerShell Disable-NetAdapterQos -Name "*"
PowerShell Disable-NetAdapterRsc -Name "*"
netsh int tcp show global
netsh advfirewall set allprofiles state off
netsh int ip set global flowlabel=disabled
netsh int ip set global groupforwardedfragments=disabled
netsh int ip set global icmpredirects=disabled
netsh int ip set global minmtu=576
netsh int ip set global multicastforwarding=disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global congestionprovider=ctcp
netsh int set global congestionprovider=ctcp
netsh int tcp set supplemental Internet congestionprovider=CTCP
netsh int tcp set global dca=enabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global fastopen=enabled
netsh int tcp set global hystart=disabled
netsh int tcp set global initialrto=300
netsh int tcp set global netdma=enabled
netsh int tcp set global pacingprofile=off
netsh int tcp set global rsc=disabled
netsh int tcp set global rss=enabled
netsh int tcp set global timestamps=disabled
netsh int tcp set heur forcews=disable
netsh interface tcp show heuristics
netsh interface tcp set heuristics disabled
netsh int tcp set heuristics disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int tcp set supplemental internet congestionprovider=dctcp
netsh int tcp set supplemental internet enablecwndrestart=disable
netsh int tcp set supplemental template=internet

::RESETS
ipconfig/flushdns 
netsh winsock reset
netsh int ip reset c:\resetlog.txt
ipconfig /release
ipconfig /renew






if %errorlevel% neq 0 (
	echo Falling back to normal autotuning
	netsh int tcp set global autotuninglevel=normal
	if !errorlevel! neq 0 (
		echo WARNING: Failed to set autotuning. Please check me_log.txt for details.
		pause
	) else (
		reg /add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "Normal" /f
	)
)
::REGEDIT

::SYSTEM TWEAKS FOLDERS/WIN UPDATES
PowerCfg.exe /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
Powershell "Disable-MMAgent -MemoryCompression"





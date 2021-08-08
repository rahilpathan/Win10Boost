powershell "Set-ExecutionPolicy -ExecutionPolicy Unrestricted"

::BCD POWERCHOKES

bcdedit /set allowedinmemorysettings 0
bcdedit /set useplatformclock No
bcdedit /set useplatformtick No
bcdedit /set tscsyncpolicy Enhanced
bcdedit /set debug No
bcdedit /set isolatedcontext No
bcdedit /set pae ForceEnable
bcdedit /set bootmenupolicy Legacy
bcdedit /set usefirmwarepcisettings No
bcdedit /set sos Yes
bcdedit /set disabledynamictick Yes
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
netsh int tcp set global rss=enable
netsh int tcp set global ecncapability=disable
netsh int tcp set global timestamps=enable
netsh int tcp set global initialrto=300
netsh int tcp set global rsc=disable
netsh int tcp set global fastopen=enable
netsh int tcp set global hystart=disable
netsh int tcp set global pacingprofile=off
netsh int ip set global minmtu=576
netsh int ip set global flowlabel=disable
netsh int tcp set supplemental internet congestionprovider=dctcp
netsh int tcp set supplemental internet enablecwndrestart=disable
netsh int ip set global icmpredirects=disabled
netsh int ip set global multicastforwarding=disabled
netsh int ip set global groupforwardedfragments=disable
netsh int tcp set security mpp=disabled profiles=disabled
netsh int tcp set heur forcews=disable
netsh int tcp set supplemental template=internet
netsh advfirewall set allprofiles state off
netsh int tcp set global autotuninglevel=experimental

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





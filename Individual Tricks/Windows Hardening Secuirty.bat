::PROTECT AGAINST SPECULATIVE CPU UPDATE
::AMD CPU 
::reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "72" /f
::NON AMD
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "8" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization" /v MinVmVersionForCpuBasedMitigations /t REG_SZ /d "1.0" /f

::FORCE ENABLE LDAP ENFORCE CHANNEL BINDING
reg add "HKLM\System\CurrentControlSet\Services\NTDS\Parameters" /v "LdapEnforceChannelBinding" /t REG_DWORD /d 2 /f

::DISABLE WINDOWS SCRIPT HOST (INVESTIGATE)
::reg add "HKCU\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
::reg add "HKLM\Software\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f
::reg add "HKLM\Software\WOW6432Node\Microsoft\Windows Script Host\Settings" /v "Enabled" /t REG_DWORD /d "0" /f

::DISABLE REMOTE ASSISTANCE AND RELATED
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fAllowToGetHelp /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fEncryptRPCTraffic /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" /v fDisableCdm /t REG_DWORD /d 1 /f

:: ENABLE PASSWORD PROMPT AFTER SLEEP
reg add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v ACSettingIndex /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51" /v DCSettingIndex /t REG_DWORD /d 1 /f

::ENABLE VIRTUALIZATION (HELPS SANDBOXING)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableVirtualization" /t REG_DWORD /d 1 /f

::ENABLE PROTECTION mode
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d 1 /f

::DISABLE HTTP PRINTING
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /v "DisableHTTPPrinting" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Printers" /v "DisableWebPnPDownload" /t REG_DWORD /d 1 /f

::ENABLE DEP
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v "NoDataExecutionPrevention" /t REG_DWORD /d 1 /f

::ENCRYPT TRAFFIC WHEN POSSIBLE
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SealSecureChannel" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "SignSecureChannel" /t REG_DWORD /d 1 /f

::LOAD ANTIMALWARE EARLY
reg add "HKCU\SYSTEM\CurrentControlSet\Policies\EarlyLaunch" /v "DriverLoadPolicy" /t REG_DWORD /d 3 /f

::DISABLE TSX/MELTDOWN/SPECTRE PATCHES (DISABLE BELOW IF SERVER OR WORK ENVIRONMENT)
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Kernel" /v "DisableTsx" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "EnableCfg" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\currentcontrolset\control\session manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f

::SAFEDLL SEARCH
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v SafeDLLSearchMode /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager" /v ProtectionMode /t REG_DWORD /d 1 /f

::DISABLE SMB1
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SMB1Protocol' -NoRestart"
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName 'SmbDirect' -NoRestart"
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" /v SMB1 /t REG_DWORD /d 0 /f

::DISABLE REMOTE REGISTRY FOR SECURITY
sc config RemoteRegistry start= disabled

:: DISABLE TYPE INFO SHARING
reg add "HKCU\Software\Microsoft\Input\TIPC" /v "Enabled" /t REG_DWORD /d "0" /f

::CVE-2020-1350 FIX (FOR SERVERS)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DNS\Parameters" /v "TcpReceivePacketSize" /t REG_DWORD /d 0xFF00 /f
net stop "DNS Server"
net start "DNS Server"

::CVE-2020-0796 FIX
reg add "HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"" /v "DisableCompression" /t REG_DWORD /d 1 /f

::CVE-2020-1472
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" /v "FullSecureChannelProtection" /t REG_DWORD /d 1 /f

::CVE-2021-24094
reg add "HKLM\System\CurrentControlSet\Services\Tcpip6\Parameters" /v "DisabledComponents" /t REG_DWORD /d 0xFF /f

::CVE-2021-24074
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DisableIPSourceRouting" /t REG_DWORD /d 1 /f

::CVE-2021-40444 (DISABLE ACTIVEX IN INTERNET EXPLORER)
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1001 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\0" /v 1004 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1001 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\1" /v 1004 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1001 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\2" /v 1004 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1001 /t REG_DWORD /d 00000003 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3" /v 1004 /t REG_DWORD /d 00000003 /f

::CVE-2017-8529
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" /v iexplore.exe /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_ENABLE_PRINT_INFO_DISCLOSURE_FIX" /v iexplore.exe /t REG_DWORD /d 1 /f

::3rd PARTY - CHROME SECURITY
reg add "HKLM\SOFTWARE\Policies\Google\Chrome" /v "AdvancedProtectionAllowed" /t REG_DWORD /d 1 /f

::DISABLE AUTORUN
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoAutoplayfornonVolume /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer" /v NoDriveTypeAutoRun /t REG_DWORD /d 255 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAutorun /t REG_DWORD /d 1 /f
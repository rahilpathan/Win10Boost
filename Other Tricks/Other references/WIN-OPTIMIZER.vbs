 
Rem 	***************************************************************** 
Rem 	* !c3 WIN-OPTIMIZER 					       	* 
Rem 	* Beschleunigt Windows durch �nderungen innerhalb der Registry 	* 
Rem 	* dauerhaft 							*
Rem	***************************************************************** 
 
Rem >> CurrentVersion << 
title = "!c3 WIN-OPTIMIZER "
revision = "v.2.6 (Beta1) "
version = title & revision
 

Rem >> Get Rights <<
Set objShell = WScript.CreateObject("WScript.Shell") 
Set WSHShell = WScript.CreateObject("WScript.Shell") 
 
On Error Resume Next  
Sub RunAsAdmin
If CreateObject("WScript.Shell").Run("%ComSpec% /C NET FILE", 0, True) <> 0 Then
ArgsList = ""
For i = 1 To WScript.Arguments.Count
ArgsList = ArgsList & """ """ & WScript.Arguments(i - 1)
Next
CreateObject("Shell.Application").ShellExecute WScript.FullName, """" & WScript.ScriptFullName & ArgsList & """", , "runas", 5
WScript.Quit
End If
End Sub 
RunAsAdmin
 
 
Rem >> AbortMessage <<
sub AbortMessage () 
Err.Clear 
On Error Resume Next 
if Language = "deutsch" then MsgBox "Vorgang abgebrochen... " & vbNewLine _ 
& vbNewLine & winversioncheck &" wurde nicht ver�ndert!!! ",vbSystemModal+vbExclamation, Version 

if Language = "english" then MsgBox "Operation canceled... " & vbNewLine _ 
& vbNewLine & winversioncheck &" was not changed!!! ",vbSystemModal+vbExclamation, Version 

Set WshShell = Nothing 
Set objShell = Nothing 
WScript.Quit 
end Sub 

 
Rem >> WinVersionCheck << 
Err.Clear 
On Error Resume Next  
strComputer = "."
Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
Set colOperatingSystems = objWMIService.ExecQuery ("Select * from Win32_OperatingSystem") 
For Each objOperatingSystem in colOperatingSystems
WinVersionCheck = objOperatingSystem.Caption 
Next

Err.Clear 
On Error Resume Next  
strComputer="."
Set objWMIService=GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colItem = objWMIService.ExecQuery("Select * from Win32_OperatingSystem",,48)
Dim objItem
For Each objItem in colItem
WinValue = Left(objItem.Version,3)
next

Rem >> LanguageCheck << 
Language = "english"


Rem >> auslesen phys. RAM << 
Err.Clear 
On Error Resume Next 
Speicher = 0
strComputer = "." 
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2") 
Set colItems = objWMIService.ExecQuery("Select * from Win32_LogicalMemoryConfiguration",,48) 
For Each objItem in colItems 
Speicher = Int(objItem.TotalPhysicalMemory/1024) 
next 

Err.Clear 
On Error Resume Next 
If Speicher = 0 then Set objWMIService = GetObject("winmgmts:" _
& "{impersonationLevel=impersonate}!\\" _
& strComputer & "\root\cimv2")
Set colComputer = objWMIService.ExecQuery _
("Select * from Win32_ComputerSystem")
For Each objComputer in colComputer 
Speichern = int(objComputer.TotalPhysicalMemory/1024/1000/1000)
Speicher = Speichern*1024
Next 
 
If Speicher = 0 then SpeicherUser
If Speicher = "" then SpeicherUser
If Speicher = false then SpeicherUser 
Sub SpeicherUser ()
Err.Clear 
On Error Resume Next  
if Language = "deutsch" then speicher = Inputbox ("Die Gr��e des Arbeitsspeichers l��t sich nicht korrekt auslesen!!! " & vbNewLine _ 
& vbNewLine & "Wie viele MB Arbeitsspeicher besitzt dieses System? ", Version, "1024") 

if Language = "english" then speicher = Inputbox ("The size of the Random-Access Memory can not be read correctly !!! " & vbNewLine _ 
& vbNewLine & "How many MB of Memory does this system have? ", Version, "1024") 

If Speicher = "" then AbortMessage: WScript.quit 
If Speicher = 0 then SpeicherUser 
If Speicher = false then SpeicherUser  
end sub 

Rem >> Optimize Your Windowsversion << 
Err.Clear 
On Error Resume Next 
If Language = "deutsch" then Optimize = MsgBox (winversioncheck &" wurde erfolgreich erkannt. " _ 
& vbNewLine & Speicher &" MB RAM wurden f�r Windows reserviert. " & vbNewLine _ 
& vbNewLine & winversioncheck &" ist Standardm��ig nicht optimal auf " _ 
& vbNewLine & "Performance, max. Systemstabilit�t und Systemsicherheit " _ 
& vbNewLine & "abgestimmt... " & vbNewLine _ 
& vbNewLine & "Dieses Tool �ndert das durch Anpassungen an die verbaute Hardware " _ 
& vbNewLine & "innerhalb der Registry dauerhaft - Benutzung auf eigene Gefahr !!! " & vbNewLine _ 
& vbNewLine & "Dieser Vorgang kann ein paar Minuten dauern. " & vbNewLine _ 
& vbNewLine & winversioncheck &" jetzt optimieren? ", _ 
vbSystemModal + vbOKCancel, Version) 

If Language = "english" then Optimize = MsgBox (winversioncheck &" was successfully recognized. " _ 
& vbNewLine & Speicher &" MB RAM were reserved for Windows. " & vbNewLine _ 
& vbNewLine & winversioncheck &" is not optimal configured for " _ 
& vbNewLine & "Performance, max. System-Stability and System-Security " _ 
& vbNewLine & "by default... " & vbNewLine _ 
& vbNewLine & "This Tool changes this by adapting to the installed Hardware " _ 
& vbNewLine & "within the Registry permanently - Use at your own risk !!! " & vbNewLine _ 
& vbNewLine & "This Process can take a few minutes. " & vbNewLine _ 
& vbNewLine & "Optimize " & winversioncheck &" now? ", _ 
vbSystemModal + vbOKCancel, Version) 

If Optimize <> vbOK then AbortMessage: WScript.quit 
If Optimize = vbOK then SystemOptimizer = "yes" 
 
Rem >> Systemwiederherstellungspunkt erstellen << 
sub SystemRestore ()
Err.Clear 
On Error Resume Next 
strComputer = "."
Set sr = getobject("winmgmts:\\.\root\default:Systemrestore") 
If (sr.createrestorepoint("reset "& Version, 0, 100)) = 0 Then Restorepoint = "1"

If Restorepoint <> "1" and Language = "deutsch" Then _ 
noSysRestorepoint = MsgBox ("Es konnte kein System-Wiederherstellungspunkt " _ 
& vbNewLine & "erstellt werden. " & vbNewLine _ 
& vbNewLine & winversioncheck & " trotzdem jetzt optimieren? ", vbSystemModal+vbExclamation+vbOKCancel, Version) 
If noSysRestorepoint = vbCancel then AbortMessage: WScript.quit 

If Restorepoint <> "1" and Language = "english" Then _ 
noSysRestorepoint = MsgBox ("No System-Restore-Point could be created " & vbNewLine _ 
& vbNewLine & "still optimize " & winversioncheck & " now? ", vbSystemModal+vbExclamation+vbOKCancel, Version) 
If noSysRestorepoint = vbCancel then AbortMessage: WScript.quit 
 
If Restorepoint = "1" and Language = "deutsch" Then _ 
MsgBox "F�r den Fall, da� durch den " & title _ 
& vbNewLine & "Probleme entstehen, wurde zur Sicherheit " _ 
& vbNewLine & "vorab ein System-Wiederherstellungspunkt " _ 
& vbNewLine & "erstellt. " & vbNewLine _ 
& vbNewLine & "Aufgelistet als: "& vbTab & "reset "& Version _ 
& vbNewLine & "Zeitpunkt: " & vbTab & Date & " - " & Time ,vbSystemModal, Version 
 
If Restorepoint = "1" and Language = "english" Then _ 
MsgBox "A System-Restore-Point was created by " _
& vbNewLine &  title & " for safety reasons. " & vbNewLine _ 
& vbNewLine & "Listet as: "& vbTab & "reset "& Version _ 
& vbNewLine & "Time: " & vbTab & Date & " - " & Time ,vbSystemModal, Version 
end sub

If Language = "deutsch" then SystemRestorepoint = MsgBox ("M�chten Sie f�r den Fall, da� " _ 
& vbNewLine & "durch den " & title & " Probleme entstehen " _ 
& vbNewLine & "zur Sicherheit vorab einen " & vbNewLine _ 
& vbNewLine & "System-Wiederherstellungspunkt erstellen? ", _ 
vbSystemModal + vbYesNo, Version) 

If Language = "english" then SystemRestorepoint = MsgBox ("Do You want to create a System-Restore-Point " _ 
& vbNewLine & "for safety reasons first? ", _ 
vbSystemModal + vbYesNo, Version) 

If SystemRestorepoint = vbYes then SystemRestore  
 
Rem >> !c3-NVIDIA-CoolBits 2.0 (Schaltet alle versteckte Optionen von NVIDIA Grafikkartentreibern frei) << 
sub CoolBits () 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\CoolBits", -1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\CinematicPageState", 255,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\DisableApplyColorsAtStartup", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NoMenus", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NoPages", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplAllowForceTVDetection", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplCustomResConfig", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplDisableRefreshRatePage", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplDisableRotateAngles", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableActiveApp", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableAdditionalInfoPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableAGPSettingsPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableClearViewPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableDesktopOverlapPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableFanControl", 3,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableFrameSyncPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableHardwarePage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnablenForcePage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableOverlaySpanControl", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnablePwrMzrOnDesktopMenu", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableRotationColorSettings", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableScreenMenuPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplEnableTroubleshootingPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplExposeWin2kDualView", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplNvThermPage", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplThermalSettings", 32,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\NvCplTvLocaleAutoDetect", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\OverlayPageState", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\PowermizerPreferences", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\QTwkEnableModeChangeWarning", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\NVTweak\TwinViewCapsOverride", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\OpenGL\Debug\ShaderObjects", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\System\EnableAGPFW", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\System\EnableAGPSBA", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\System\EnableIrongateSBA", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\System\EnableVIASBA", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\NVIDIA Corporation\Global\System\TurboQueue", 1,"REG_DWORD" 
end sub 
 
 
Rem >> HD-OPTIMIZER << 
Sub HDOpt () 
Err.Clear 
On Error Resume Next  
intJobNum = 10
Set objShell = CreateObject("WScript.Shell")
Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."
Set objRegistry = GetObject("winmgmts:{impersonationLevel=Impersonate}!\\" & strComputer & "\root\default:StdRegProv")
strRegRoot = HKEY_LOCAL_MACHINE
strKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
If objRegistry.EnumKey(strRegRoot, strKey, arrKeyNames) = 0 Then
If IsNull(arrKeyNames) = False Then
For Each strKeyName In arrKeyNames
If Right(strKey, 1) = "\" Then
strFullPath = strKey & strKeyName
Else
strFullPath = strKey & "\" & strKeyName
End If
objRegistry.SetDWORDValue strRegRoot, strFullPath, "StateFlags" & Right("0000" & intJobNum, 4), 2
Next
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files\StateFlags" & Right("0000" & intJobNum, 4), 0,"REG_DWORD" 
ende = Timer 
objShell.Run "CLEANMGR /sageset:" & intJobNum, 1, True
restart = Timer 

Rem >> Dokumente bereinigen << 
Err.Clear 
On Error Resume Next  
daysago = 2 
Set wshShell = WScript.CreateObject("WScript.Shell") 
strRecent = wshShell.SpecialFolders("Recent") 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set ordner = fso.GetFolder(strRecent) 
Set dateien = ordner.Files 
heute = Date() 
For Each datei In dateien 
If datei.DateLastModified < (heute - daysago) Then 
datei.Delete 
End If 
Next 

Err.Clear 
On Error Resume Next  
objShell.Run "CLEANMGR /sagerun:" & intJobNum, 1, True
For Each strKeyName In arrKeyNames
If Right(strKey, 1) = "\" Then
strFullPath = strKey & strKeyName
Else
strFullPath = strKey & "\" & strKeyName
End If
objRegistry.DeleteValue strRegRoot, strFullPath, "StateFlags" & Right("0000" & intJobNum, 4)
Next
End If
End If
 
Rem >> Defrag.exe << 
WshShell.Run "dfrgui.exe", 1, false 
Err.Clear 
On Error Resume Next  
strComputer = "." 
Set objWMIService = GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
Set colDisks = objWMIService.ExecQuery ("Select * from Win32_LogicalDisk Where DriveType = 3") 
For Each objDisk in colDisks 
WshShell.Run "Defrag.exe " & objDisk.DeviceID &  " -f -h -u -v", 2, True 
next 
Err.Clear 
On Error Resume Next 
For Each Process in GetObject("winmgmts:"). _ 
ExecQuery ("select * from Win32_Process where name='dfrgui.exe'") 
Process.terminate(0) 
next 
Err.Clear 
End Sub 
 
If Language = "deutsch" then HD = MsgBox ("M�chten Sie im Anschlu� zus�tzlich an die Anpassung " _ 
& vbNewLine & "durch den " & title & " noch alle Festplatten " _ 
& vbNewLine & "optimieren? " & vbNewLine _ 
& vbNewLine & "Dieser Vorgang kann ein paar Minuten bis mehrere Stunden dauern. ", _ 
vbSystemModal + vbYesNo, Version) 
If HD = vbYes then HDOptimizer = "yes"  

If Language = "english" then HD = MsgBox ("Do you want to clean up all Harddrives after " _ 
& vbNewLine & "optimizing by " & title & " ? " & vbNewLine _ 
& vbNewLine & "This Process can take a few minutes to several hours. ", _ 
vbSystemModal + vbYesNo, Version) 
If HD = vbYes then HDOptimizer = "yes"  
 
Rem >> System-Tweaks <<
Sub winOpt () 
Err.Clear 
On Error Resume Next 
Rem >> Registry-Backup << 
WshShell.Run "REGEDIT /E /Y C:\REGISTRY-BACKUP.REG", 1, True
Err.Clear 
On Error Resume Next 
Rem >> Alle Explorer.exe beenden << 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoRestartShell", 0, "REG_DWORD" 
Err.Clear 
On Error Resume Next 
For Each Process in GetObject("winmgmts:"). _ 
ExecQuery ("select * from Win32_Process where name='Explorer.exe'") 
Process.terminate(0) 
next 
Err.Clear 
On Error Resume Next 
WshShell.Run "net stop wuauserv", 1, True
Err.Clear 
On Error Resume Next 
For Each Process in GetObject("winmgmts:"). _ 
ExecQuery ("select * from Win32_Process where name='wuauclt.exe'") 
Process.terminate(0) 
next 

Rem >> Windows-Update << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DriverSearching\DriverUpdateWizardWuSearchEnabled", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Services\7971F918-A847-4430-9279-4A52D1EFE18D\RegisteredWithAU", 1,"REG_DWORD" 

Rem >> WinXP-POS-Ready-Embedded << 
Err.Clear 
On Error Resume Next   
XPEmbedded = WSHShell.Regread ("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName") 
Err.Clear 
On Error Resume Next 
PosReady = WSHShell.Regread ("HKEY_LOCAL_MACHINE\SYSTEM\WPA\PosReady\Installed") 
Err.Clear 
On Error Resume Next 
ende = Timer 
if XPEmbedded = "Microsoft Windows XP" and PosReady <> "1" and Language = "deutsch" then _
XPEmbedded = MsgBox ("Der Support f�r " & winversioncheck & " wurde am 8. April 2014 " _ 
& vbNewLine & "Seitens Microsoft eingestellt. " & vbNewLine _ 
& vbNewLine & "Dieses Tool bietet die M�glichkeit �ber einen Hack " _ 
& vbNewLine & "dem Microsoft-Updateserver vorzugaukeln, da� diese " _ 
& vbNewLine & "Windowsversion eine sog. POS-Ready-Embedded-Version ist, " _ 
& vbNewLine & "was den Server dazu veranla�t weiterhin neue " _
& vbNewLine & "Sicherheits-Updates zur Verf�gung zu stellen. " & vbNewLine _ 
& vbNewLine & "Soll der Hack �POS-Ready-Embedded� jetzt aktiviert werden? ", _ 
vbSystemModal + vbOKCancel, Version) 

if XPEmbedded = "Microsoft Windows XP" and PosReady <> "1" and Language = "english" then _
XPEmbedded = MsgBox ("The Support for " & winversioncheck & " has been discontinued on April 8th 2014 " _ 
& vbNewLine & "from Microsoft. " & vbNewLine _ 
& vbNewLine & "This Tool offers the possibility " _ 
& vbNewLine & "to use a hack to fool the Microsoft Update-Server " _ 
& vbNewLine & "that this Version of Windows is a so-called POS Ready Embedded Version " _ 
& vbNewLine & "which causes the server to continue to provide new Security Updates " _
& vbNewLine & "for this Window-Version. " & vbNewLine _ 
& vbNewLine & "Do you want to activate the �POS-Ready-Embedded� Hack now? ", _ 
vbSystemModal + vbOKCancel, Version) 
restart = Timer 
If XPEmbedded = vbOK then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\WPA\PosReady\Installed", 1,"REG_DWORD" 

Rem >> Energiesparpl�ne << 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setacvalueindex a1841308-3541-4fab-bc81-f71556f20b4a 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setdcvalueindex a1841308-3541-4fab-bc81-f71556f20b4a 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg -setdcvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
If WinValue = "10." then WshShell.Run "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 88ac267b-4dc0-3b86-99dc-d1094efcbc47", 1, True 
Err.Clear 
On Error Resume Next 
If WinValue = "10." then WshShell.Run "powercfg -setacvalueindex 88ac267b-4dc0-3b86-99dc-d1094efcbc47 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
If WinValue = "10." then WshShell.Run "powercfg -setdcvalueindex 88ac267b-4dc0-3b86-99dc-d1094efcbc47 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 3", 1, True 
Err.Clear 
On Error Resume Next 
If WinValue = "10." then WshShell.Run "powercfg /s 88ac267b-4dc0-3b86-99dc-d1094efcbc47", 1, True 

Rem >> Page-File Swap-Datei Optimieren << 
Err.Clear 
On Error Resume Next 
Page = Speicher
If Speicher = 0 then Page = 1024 
If Speicher < 1024 then Page = 1024 
If Speicher = false then Page = 1024 
Swap = Page+(Page/2) 
If Swap < 4096 then Swap = 4096 
If Swap > 24576 then Swap = 24576 

Err.Clear 
On Error Resume Next 
strComputer = "." 
Set objWMIService = GetObject("winmgmts:" _ 
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
For Each objCS in objWMIService.ExecQuery("SELECT * FROM Win32_ComputerSystem") 
on Error Resume Next 
If (objCS.AutomaticManagedPagefile) Then 
objCS.AutomaticManagedPageFile=False 
objCS.Put_ 
End If 
Next 

Err.Clear 
On Error Resume Next  
strComputer = "." 
Set objWMIService = GetObject("winmgmts:" _ 
& "{impersonationLevel=impersonate}!\\" & strComputer & "\root\cimv2") 
Set colPageFiles = objWMIService.ExecQuery("Select * from Win32_PageFileSetting",,48) 
For Each objPageFile in colPageFiles 
objPageFile.InitialSize = Swap 
objPageFile.MaximumSize = Swap 
objPageFile.Put_ 
next 
 
Rem >> Erweiterter Cache- und System-Kernel-Patch << 
Err.Clear 
On Error Resume Next 
IOPLL = 0
DPE = 0
If Speicher = false then IOPLL = 0
If Speicher = false then DPE = 0
If Speicher = 0 then IOPLL = 0
If Speicher = 0 then DPE = 0
If Speicher < 64 then IOPLL = (Speicher-7)*1024
If Speicher >= 64 then IOPLL = (Speicher-16)*1024
If Speicher < 512 then DPE = 0
If Speicher >= 512 then IOPLL = (Speicher-65)*1024
If Speicher >= 512 then DPE = 1
if IOPLL > 4294967295 then IOPLL = -1
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\IOPageLockLimit", IOPLL, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\DisablePagingExecutive", DPE, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\FeatureSettings", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\FeatureSettingsOverride", 1024, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\FeatureSettingsOverrideMask", 1024, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\LargeSystemCache", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\NonPagedPoolQuota", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\NonPagedPoolSize", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PagedPoolQuota", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PagedPoolSize", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PhysicalAddressExtension", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\SecondLevelDataCache", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\SessionPoolSize", 64, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\SessionViewSize", 96, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\SystemPages", -1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling\PowerThrottlingOff", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\IRQ0Priority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\IRQ8Priority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\IRQ14Priority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\IRQ15Priority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl\Win32PrioritySeparation", 2, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WOW\DefaultSeparateVDM", "yes", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SvcHostSplitThresholdInKB", 4718592, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VxD\BIOS\AGPConcur", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VxD\BIOS\CPUDelayTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VxD\BIOS\CPUPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VxD\BIOS\FastDRAM", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\VxD\BIOS\PCIConcur", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableVirtualization", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Virtualization\MinVmVersionForCpuBasedMitigations", "1.0", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows\GDIProcessHandleQuota", 16384, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows\USERProcessHandleQuota", 18000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\AppHVSI\AllowVirtualGPU", 1, "REG_DWORD" 

Err.Clear 
On Error Resume Next  
Const KEY = "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\SubSystems\Windows"
dim objShell, regex, str
Set objShell = CreateObject("Wscript.Shell")
Set regex = CreateObject("vbscript.regexp")
regex.IgnoreCase = True
regex.Pattern = "(SharedSection)=(\d+),(\d+),(\d+)"
str = objShell.RegRead (KEY)
str = regex.Replace(str,"$1=1024,20480,1024")
objShell.RegWrite KEY,str,"REG_EXPAND_SZ"
 
Rem >> UDMA neu setzen, Laufwerke beschleunigen << 
Err.Clear 
On Error Resume Next 
WshShell.Run "diskperf -n", 1, True 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisable8dot3NameCreation", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableCompression", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem\NtfsDisableLastAccessUpdate", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Fdc\ForceFIFO", 0, "REG_SZ" 
WshShell.RegDelete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318}\UpperFilters" 
WshShell.RegDelete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E965-E325-11CE-BFC1-08002BE10318}\LowerFilters" 
Err.Clear 
On Error Resume Next 
objShell.Run ("C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command fsutil behavior set DisableDeleteNotify 0"), 1, True 
Err.Clear 
 
On Error Resume Next 
RegPath = "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4D36E96A-E325-11CE-BFC1-08002BE10318}\" 
ValueName1Master = "MasterIdDataChecksum" 
ValueName1Slave = "SlaveIdDataChecksum" 
ValueName2Master = "UserMasterDeviceTimingModeAllowed" 
ValueName2Slave = "UserSlaveDeviceTimingModeAllowed" 
ValueName3 = "ResetErrorCountersOnSuccess" 
ConsecutiveMisses = 0 
For i = 0 to 999 
RegSubPath = Right("000" & i, 4) & "\" 
Err.Clear 
On Error Resume Next 
WshShell.RegRead RegPath & RegSubPath & ValueName1Master 
errMaster = Err.Number 
If errMaster = 0 Then 
On Error Resume Next 
WshShell.RegDelete RegPath & RegSubPath & ValueName1Master 
WshShell.RegDelete RegPath & RegSubPath & ValueName2Master 
WshShell.RegWrite RegPath & RegSubPath & "MasterDeviceTimingModeAllowed", -1, "REG_DWORD" 
end if 
Err.Clear 
On Error Resume Next 
WshShell.RegRead RegPath & RegSubPath & ValueName1Slave
errSlave = Err.Number 
If errSlave = 0 Then 
On Error Resume Next 
WshShell.RegDelete RegPath & RegSubPath & ValueName1Slave 
WshShell.RegDelete RegPath & RegSubPath & ValueName2Slave 
WshShell.RegWrite RegPath & RegSubPath & "SlaveDeviceTimingModeAllowed", -1, "REG_DWORD" 
end if 
If errMaster = 0 Or errSlave = 0 Then 
Err.Clear 
On Error Resume Next 
WshShell.RegWrite RegPath & RegSubPath & ValueName3, 1, "REG_DWORD" 
ChannelName = "unnamed channel " & Left(RegSubPath, 4) 
ChannelName = WshShell.RegRead(RegPath & RegSubPath & "DriverDesc") 
ConsecutiveMisses = 0 
end if 
next 
 
Rem >> Bootvorgang und Prefetchoptimierungen (Bootperformance und Programmstarts werden verbessert) << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Dfrg\BootOptimizeFunction\Enable", "Y", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\OptimalLayout\EnableAutoLayout", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoChangingLockScreen", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoChangingStartMenuBackground", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization\NoLockScreen", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\DisableAcrylicBackgroundOnLogon", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System\DisableLogonBackgroundImage", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\ContentIndex\StartupDelay", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters\EnablePrefetcher", 3, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule\Start", 2, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize\StartupDelayInMSec", 0, "REG_DWORD" 
 
Err.Clear 
On Error Resume Next 
Set oFSO = WScript.CreateObject("Scripting.FileSystemObject") 
Set WinDir = oFSO.GetSpecialFolder(0) 
Set oFolder = oFSO.GetFolder(WinDir & "\Prefetch") 
Set oFiles = oFolder.Files 
For Each oFile In oFiles 
oFSO.DeleteFile(oFile.Path) 
Next 
Set oFiles = Nothing 
Set oFolder = Nothing 
Set oFSO = Nothing 
 
Rem >> AUTOSTART-OPTIMIZER << 
Err.Clear 
On Error Resume Next 
Dim fso, MyFile
Set fso = CreateObject("Scripting.FileSystemObject")
Startup = wshShell.Specialfolders("AllUsersStartup") 
Set MyFile = fso.CreateTextFile (Startup & "\AUTOSTART-OPTIMIZER.VBS") 
MyFile.WriteLine (" ") 
MyFile.WriteLine ("rem 	********************************* ") 
MyFile.WriteLine ("rem 	* Optimiert den Systemstart !!! * ") 
MyFile.WriteLine ("rem 	********************************* ") 
MyFile.WriteLine (" ") 
MyFile.WriteLine ("On Error Resume Next ") 
MyFile.WriteLine ("Const Above_Normal = 32768 ") 
MyFile.WriteLine ("strComputer = ""."" ") 
MyFile.WriteLine ("Set objWMIService = GetObject(""winmgmts:\\"" & strComputer & ""\root\cimv2"") ") 
MyFile.WriteLine ("Set colProcesses = objWMIService.ExecQuery _ ") 
MyFile.WriteLine ("(""Select * from Win32_Process Where Name = 'Explorer.exe'"") ") 
MyFile.WriteLine ("For Each objProcess in colProcesses ") 
MyFile.WriteLine ("objProcess.SetPriority(Above_Normal) ") 
MyFile.WriteLine ("Next ") 
MyFile.WriteLine ("WScript.Quit ") 
MyFile.WriteLine (" ") 
MyFile.WriteLine ("rem 	************************************* ") 
MyFile.WriteLine ("rem 	* !c3 AUTOSTART-OPTIMIZER	    * ") 
MyFile.WriteLine ("rem 	* -written by 			    * ") 
MyFile.WriteLine ("rem 	* Ren� Bengsch 			    * ") 
MyFile.WriteLine ("rem 	* info/contact @ 		    * ") 
MyFile.WriteLine ("rem 	* e-M@il: senseless-creature@web.de * ") 
MyFile.WriteLine ("rem 	************************************* ") 
MyFile.WriteLine (" ")  
Set fso = Nothing 
Startup = Nothing 
Set MyFile = Nothing 
 
Rem >> Windowsoberfl�che optimieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters\srvcomment", "Optimized-System: " & version, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\ActiveWndTrackTimeout", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\ActiveWndTrkTimeout", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\DockMoving", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\DragFromMaximize", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\DragFullWindows", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\FontSmoothing", 2, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\FontSmoothingGamma", 1000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\FontSmoothingType", 2, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\ForegroundFlashCount", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\ForegroundLockTimeout", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\JPEGImportQuality", 100, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\MenuShowDelay", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\SmoothScroll", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\SnapSizing", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\MaxAnimate", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\MinAnimate", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\Shell Icon BPP", 32, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics\Shell Icon Size", 32, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseHoverTime", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\System.IsPinnedToNamespaceTree", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FavIntelliMenus", "No", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\EnableAutoTray", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HoverSelectDesktops", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ExtendedUIHoverTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DesktopLivePreviewHoverTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\DisablePreviewDesktop", 0, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\IntelliMenus", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\LastActiveClick", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowCompColor", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowCortanaButton", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowInfoTip", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowStatusBar", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowTaskViewButton", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowTypeOverlay", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\SeparateProcess", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Start_PowerButtonAction", 2, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarAnimations", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarSmallIcons", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ThumbnailLivePreviewHoverTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People\PeopleBand", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\AllItemsIconView", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\StartupPage", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz\NoRun", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel\{20D04FE0-3AEA-1069-A2D8-08002B30309D}", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Taskband\MinThumbSizePx", 253, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ThumbnailQuality", 100, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\VisualFXSetting", 3, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search\SearchboxTaskbarMode", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\TaskManager\StartUpTab", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize\EnableTransparency", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU Size", 5000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\ShellNoRoam\BagMRU Size", 5000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Max Cached Icons", 4096, "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DelaySendToMenuBuild", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoRestartShell", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\Shell", "explorer.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Shell\ActionCenter\Quick Actions\PinnedQuickActionSlotCount", 4, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderDocuments", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderDocuments_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderDownloads", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderDownloads_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderFileExplorer", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderFileExplorer_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderMusic", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderMusic_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderNetwork", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderNetwork_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderPersonalFolder", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderPersonalFolder_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderPictures", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderPictures_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderSettings", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderSettings_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderVideos", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PolicyManager\current\device\Start\AllowPinnedFolderVideos_ProviderSet", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimationEnabled", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Update\UpdateMode", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_USERS\.DEFAULT\Control Panel\Colors\Background", "0 0 0", "REG_SZ" 
WSHShell.RegWrite "HKEY_USERS\.DEFAULT\Control Panel\Desktop\FontSmoothing", 2, "REG_SZ" 
WSHShell.RegWrite "HKEY_USERS\.DEFAULT\Control Panel\Desktop\FontSmoothingGamma", 1000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_USERS\.DEFAULT\Control Panel\Desktop\FontSmoothingType", 2, "REG_DWORD" 
Err.Clear 
On Error Resume Next 
WshShell.RegDelete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\IconStreams" 
WshShell.RegDelete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\PastIconsStream"  
WshShell.RegDelete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\IconStreams" 
WshShell.RegDelete "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify\PastIconsStream" 
WshShell.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify\IconStreams" 
WshShell.RegDelete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TrayNotify\PastIconsStream" 

Err.Clear 
On Error Resume Next 
Const HKCU = &H80000001 
KeyPath = "Control Panel\Desktop" 
Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & ".\root\default:StdRegProv") 
ValueName = "UserPreferencesMask" 
iValues = Array(&H90,&H012,&H07,&H80,&H10,&H00,&H00,&H00) 
oReg.SetBinaryValue HKCU,KeyPath,ValueName,iValues 

Rem >> Ads Deaktivieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\RotatingLockScreenEnabled", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\RotatingLockScreenOverlayEnabled", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SilentInstalledAppsEnabled", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SoftLandingEnabled", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SystemPaneSuggestionsEnabled", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ShowSyncProviderNotifications", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\CloudContent\DisableWindowsSpotlightFeatures", 1, "REG_DWORD" 

Rem >> Adware, Malware und PUA Erkennung in Microsofts Virenscannern aktivieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\PUAProtection", 2,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\PUAProtection", 2,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\MpEngine\MpEnablePus", 1,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Antimalware\MpEngine\MpEnablePus", 1,"REG_DWORD" 
Err.Clear 
On Error Resume Next 
objShell.Run ("C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command Set-MpPreference -PUAProtection 2"), 1, True 
Err.Clear 
On Error Resume Next 
objShell.Run ("C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command Set-MpPreference -SubmitSamplesConsent 0"), 1, True 

Rem >> Systemwiederherstellungspunkte << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore\SystemRestorePointCreationFrequency", 0, "REG_DWORD" 

Rem >> Druckauftr�ge beschleunigen << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\PortThreadPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\SchedulerThreadPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\SpoolerPriority", -1, "REG_DWORD" 

Rem >> Clock resync. << 
Err.Clear 
On Error Resume Next 
WshShell.Run "w32tm /resync", 1, True 
  
Rem >> Kontext-Menu-Erweiterung << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MultipleInvokePromptMinimum", 16, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartHigh\", "Start &High Priority", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartHigh\MUIVerb", "�ffnen mit hoher Priorit�t", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartHigh\MUIVerb", "Open with high Priority", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartHigh\Command\", "cmd.exe /c start ""StartHigh"" /High ""%1""", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartLow\", "Start &Low Priority", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartLow\MUIVerb", "�ffnen mit niedriger Priorit�t", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartLow\MUIVerb", "Open with low Priority", "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\StartLow\Command\", "cmd.exe /c start ""StartLow"" /Low ""%1""", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\icon", "SystemSettingsBroker.exe", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\MUIVerb", "System-Einstellungen", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\MUIVerb", "System-Settings", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\", "@%SystemRoot%\system32\shell32.dll,-22068", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\InfoTip", "@%SystemRoot%\system32\shell32.dll,-22580", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\System.ApplicationName", "Microsoft.WindowsUpdate", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\System.ControlPanel.Category", "5", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\System.Software.TasksFileUrl", "Internal", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\DefaultIcon\", "shell32.dll,-47", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\CLSID\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\Shell\Open\Command\", "control.exe /name Microsoft.WindowsUpdate", "REG_EXPAND_SZ"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel\NameSpace\{36eef7db-88ad-4e81-ad49-0e313f0c35f8}\", "Windows Update", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\Position", "Bottom", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\SettingsURI", "ms-settings:", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Computer-Settings\command\DelegateExecute", "{556FF0D6-A1EE-49E5-9FA4-90AE116AD744}", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Control\", "@shell32.dll,-4161", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Control\icon", "Control.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Control\Position", "Bottom", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Control\command\", "control.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\icon", "powercpl.dll", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\MUIVerb", "Energiesparplan �ndern", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\MUIVerb", "Choose a Power Plan", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Position", "Bottom", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\SubCommands", "", "REG_SZ" 
If WinValue = "10." then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\A-Ultimate Performance\icon", "powercpl.dll", "REG_SZ" 
If WinValue = "10." and Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\A-Ultimate Performance\MUIVerb", "Ultimative Leistung", "REG_SZ" 
If WinValue = "10." and Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\A-Ultimate Performance\MUIVerb", "Ultimate Performance", "REG_SZ" 
If WinValue = "10." then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\A-Ultimate Performance\Command\", "powercfg.exe /s 88ac267b-4dc0-3b86-99dc-d1094efcbc47",  "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\B-High Performance\icon", "powercpl.dll", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\B-High Performance\MUIVerb", "H�chstleistung", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\B-High Performance\MUIVerb", "High Performance", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\B-High Performance\Command\", "powercfg.exe /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c",  "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\C-Balanced\icon", "powercpl.dll", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\C-Balanced\MUIVerb", "Ausbalanciert", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\C-Balanced\MUIVerb", "Balanced", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\C-Balanced\Command\", "powercfg.exe /s 381b4222-f694-41f0-9685-ff5bb260df2e", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\D-Power Saver\icon", "powercpl.dll", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\D-Power Saver\MUIVerb", "Energiesparmodus", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\D-Power Saver\MUIVerb", "Power Saver", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\D-Power Saver\Command\", "powercfg.exe /s a1841308-3541-4fab-bc81-f71556f20b4a", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\Z-Settings\icon", "control.exe", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\Z-Settings\MUIVerb", "Einstellungen", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\Z-Settings\MUIVerb", "Settings", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\SwitchPowerScheme\Shell\Z-Settings\Command\", "Control Powercfg.cpl", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Taskmanager\icon", "taskmgr.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Taskmanager\Position", "Bottom", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Taskmanager\MUIVerb", "Task-Manager", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\DesktopBackground\Shell\Taskmanager\Command\", "taskmgr.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Cleanmanager\icon", "cleanmgr.exe", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Cleanmanager\MUIVerb", "Laufwerk bereinigen", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Cleanmanager\MUIVerb", "Clean up Volume", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Cleanmanager\command\", "cmd.exe /c start /High Cleanmgr.exe %1", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Defrag\icon", "defrag.exe", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Defrag\MUIVerb", "Laufwerk defragmentieren", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Defrag\MUIVerb", "Defrag Volume", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\Drive\shell\Defrag\command\", "cmd.exe /c start /High dfrgui.exe", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\*\shellex\ContextMenuHandlers\Open With\", "{09799AFB-AD67-11d1-ABCD-00C04FC30936}", "REG_SZ" 
WSHShell.RegWrite "HKEY_CLASSES_ROOT\IE.AssocFile.URL\shellex\ContextMenuHandlers\{09799AFB-AD67-11d1-ABCD-00C04FC30936}\", "REG_SZ"
WSHShell.RegWrite "HKEY_CLASSES_ROOT\InternetShortcut\shell\�ffnen in neuem Fenster\command\", "rundll32.exe shdocvw.dll,OpenURL %l", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\AllowWindowReuse", 0, "REG_DWORD" 

Rem >> GOD-MODE << 
Err.Clear 
On Error Resume Next 
Dim objFSO, newDIR 
ziel=objShell.SpecialFolders("Desktop") & "\" & "GOD-MODE.{ED7BA470-8E54-465E-825C-99712043E01C}" 
Set objFSO = CreateObject("Scripting.FileSystemObject")  
if objFSO.Folderexists (ziel) = false then 
Set newDIR = objFSO.CreateFolder(ziel) 
end if 

Rem >> !c3-NVIDIA-CoolBits 2.0 (Schaltet alle versteckte Optionen von NVIDIA Grafikkartentreibern frei) << 
Err.Clear 
On Error Resume Next 
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")
Set colItems = objWMIService.ExecQuery("Select * from Win32_VideoController",,48)
For Each objItem in colItems
if objItem.AdapterCompatibility = "NVIDIA" then CoolBits
Next 
  
Rem >> Runterfahren Optimieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\PowerdownAfterShutdown", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl\AutoReboot", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\ClearPageFileAtShutdown", 0, "REG_DWORD"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WaitToKillService", 100, "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WaitToKillServiceTimeout", 5000, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\HungAppTimeout", 5000, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\LowLevelHooksTimeout", 5000, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WaitToKillAppTimeout", 25000, "REG_SZ" 
Err.Clear 
On Error Resume Next 
WshShell.Run "powercfg.exe /hibernate off", 1, True 
 
Rem >> Internetbandbreite, Browser-, Up- und Download optimieren << 
Err.Clear 
On Error Resume Next 
WshShell.Run "ipconfig /flushdns", 1, True 
Err.Clear 
On Error Resume Next 
Set objShell = CreateObject("WScript.Shell")
Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."
Set objRegistry = GetObject("winmgmts:{impersonationLevel=Impersonate}!\\" & strComputer & "\root\default:StdRegProv")
strRegRoot = HKEY_LOCAL_MACHINE
strKey = "SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces"
If objRegistry.EnumKey(strRegRoot, strKey, arrKeyNames) = 0 Then
If IsNull(arrKeyNames) = False Then 
For Each strKeyName In arrKeyNames
If Right(strKey, 1) = "\" Then
strFullPath = strKey & strKeyName
Else
strFullPath = strKey & "\" & strKeyName
End If
objRegistry.SetDWORDValue strRegRoot, strFullPath, "TcpAckFrequency", 1
objRegistry.SetDWORDValue strRegRoot, strFullPath, "TcpDelAckTicks", 0
objRegistry.SetDWORDValue strRegRoot, strFullPath, "TCPNoDelay", 1
Next
End If
End If	

Const ADMINISTRATIVE_TOOLS = 6
Set objShell = CreateObject("Shell.Application")
Set objFolder = objShell.Namespace(ADMINISTRATIVE_TOOLS) 
Set objFolderItem = objFolder.Self   
Set objShell = WScript.CreateObject("WScript.Shell")  
Err.Clear 
On Error Resume Next 
strDesktopFld = objFolderItem.Path
Set objURLShortcut = objShell.CreateShortcut(strDesktopFld & "\Links\Google.URL")
If Language = "deutsch" then objURLShortcut.TargetPath = "https://www.google.de/"
If Language = "english" then objURLShortcut.TargetPath = "https://www.google.com/"
objURLShortcut.Save
Err.Clear 
On Error Resume Next 
strDesktopFld = objFolderItem.Path
Set objURLShortcut = objShell.CreateShortcut(strDesktopFld & "\Links\Update Windows-Optimizer.URL")
objURLShortcut.TargetPath = "https://www.dropbox.com/s/8ro82jvla5b72ib/WIN-OPTIMIZER.vbs?dl=1"
objURLShortcut.Save

Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Main\Enable_Disk_Cache", "yes", "REG_SZ"
If Language = "deutsch" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Search\SearchAssistant", "http://www.google.de/ie", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Search\SearchAssistant", "http://www.google.com/ie", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Window Title", "!c3-OPTIMIZED-SYSTEM", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Bar", "http://www.google.de/ie", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Bar", "http://www.google.com/ie", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.google.de", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\Search Page", "http://www.google.com", "REG_SZ" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\SearchURL\", "http://www.google.de/keyword/%s", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\SearchURL\", "http://www.google.com/keyword/%s", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows\PlaySound", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows\PopupMgr", "yes", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\New Windows\UseSecBand", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE\AlwaysShowMenus", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE\CommandBarEnabled", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE\LinksBandEnabled", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\MINIE\ShowStatusBar", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\EnableNegotiate", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\MaxConnectionsPerServer", 10, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\MaxConnectionsPer1_0Server", 10, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Persistent", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\Cache\Content\CacheLimit", 256000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\Content\CacheLimit", 256000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\5.0\Cache\ContentLimit", 250, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Policies\Microsoft\MicrosoftEdge\Internet Settings\UnlockHomeButton", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ExperimentalFeatures\AllowRenderThrottling", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ExperimentalFeatures\BlockSpecificRenderThrottling", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\ExperimentalFeatures\EnableTcpFastOpen", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\Annotations\ShowOnAddressBar", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\Downloads\ShowOnAddressBar", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\Favorites\ShowOnAddressBar", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\History\ShowOnAddressBar", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\ReadingList\ShowOnAddressBar", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Extensions\Share\ShowOnAddressBar", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main\AskToCloseAllTabs", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main\DoNotTrack", 1, "REG_DWORD" 
If Language = "deutsch" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main\HomeButtonPage", "http://www.google.de/", "REG_SZ" 
If Language = "english" then WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main\HomeButtonPage", "http://www.google.com/", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\TabbedBrowsing\ShowTabPreviewBarOnStartup", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\TabbedBrowsing\TabPeekEnabled", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\TabbedBrowsing\TabPeekHideDelay", 0, "REG_DWORD"
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\TabbedBrowsing\TabPeekShowDelay", 0, "REG_DWORD"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER\explorer.exe", 14," REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER\iexplorer.exe", 14," REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER\explorer.exe", a, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Internet Explorer\MAIN\FeatureControl\FEATURE_MAXCONNECTIONSPERSERVER\iexplorer.exe", a, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ\Parameters\TCPNoDelay", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\NetworkThrottlingIndex", -1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\SystemResponsiveness", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Psched\NonBestEffortLimit", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\CacheHashTableBucketSize", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\CacheHashTableSize", 384, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\MaxCacheEntryTtlLimit", 172800, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\MaxCacheTtl", 172800, "REG_DWORD"
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\MaxSOACacheEntryTtlLimit", 300, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\MaxNegativeCacheTtl", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\NegativeCacheTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\NegativeSOACacheTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\NetFailureCacheTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Dnscache\Parameters\NetFailureErrorPopupLimit", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\DirectoryCacheEntrySizeMax", 4096, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\DirectoryCacheLifetime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\DisableBandwidthThrottling", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\FileInfoCacheLifetime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\FileNotFoundCacheLifetime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NlaSvc\Parameters\Internet\EnableActiveProbing", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\DisableTaskOffload", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\TcpMaxConnectRetransmissions", 2, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\TcpMaxDataRetransmissions", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider\DnsPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider\HostsPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider\LocalPriority", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider\NetbtPriority", 1, "REG_DWORD" 

Rem >> RDP << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\fAllowToGetHelp", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\fDenyTSConnections", 1, "REG_DWORD" 
 
Rem >> Regdone << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion\RegDone", 1, "REG_SZ" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry\Start", 4, "REG_DWORD"  

Rem >> Automatische Fehlerberichterstattung ausschalten (Kein Speicherabbild an MS senden!) << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting\DoReport", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting\ShowUI", 0, "REG_DWORD" 
 
Rem >> Mouse- und Tastatur-Fix (optimiert die Mousebeschleunigung, Mouse und Tastatur werden pr�ziser) << 
Err.Clear 
On Error Resume Next 
rem Const HKCU = &H80000001 
KeyPath = "Control Panel\Mouse" 
Set oReg=GetObject("winmgmts:{impersonationLevel=impersonate}!\\" & ".\root\default:StdRegProv") 
 
ValueName = "SmoothMouseXCurve" 
iValues = Array(&H00,&H00,&H00,&H00,&H00,&H00,&H00,&H00, _ 
	&H00,&Ha0,&H00,&H00,&H00,&H00,&H00,&H00, _ 
	&H00,&H40,&H01,&H00,&H00,&H00,&H00,&H00, _ 
	&H00,&H80,&H02,&H00,&H00,&H00,&H00,&H00, _ 
	&H00,&H00,&H05,&H00,&H00,&H00,&H00,&H00) 
oReg.SetBinaryValue HKCU,KeyPath,ValueName,iValues 
 
ValueName = "SmoothMouseYCurve" 
iValues = Array(&H00,&H00,&H00,&H00,&H00,&H00,&H00,&H00, _ 
	&H66,&Ha6,&H02,&H00,&H00,&H00,&H00,&H00, _ 
	&Hcd,&H4c,&H05,&H00,&H00,&H00,&H00,&H00, _ 
	&Ha0,&H99,&H0a,&H00,&H00,&H00,&H00,&H00, _ 
	&H38,&H33,&H15,&H00,&H00,&H00,&H00,&H00) 
oReg.SetBinaryValue HKCU,KeyPath,ValueName,iValues 
 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters\KeyboardDataQueueSize", 300, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters\MouseDataQueueSize", 300, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters\SampleRate", 200, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Kbdclass\Parameters\KeyboardDataQueueSize", 300, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Mouclass\Parameters\MouseDataQueueSize", 300, "REG_DWORD"  
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USB\DisableSelectiveSuspend", 1, "REG_DWORD"  
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Desktop\WheelScrollLines", 3, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\DoubleClickSpeed", 400, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseSensitivity", 20, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseSpeed", 2, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseThreshold1", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Mouse\MouseThreshold2", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Keyboard\InitialKeyboardIndicators", 2, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Keyboard\KeyboardDelay", 0, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Control Panel\Keyboard\KeyboardSpeed", 31, "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Console\CtrlKeyShortcutsDisabled", 0, "REG_DWORD" 
 
Rem >> Gaming-Performance Optimieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\GameBar\AllowAutoGameMode", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\GameBar\AutoGameModeEnabled", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio\GPU Priority", 8, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Audio\Priority", 6, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games\GPU Priority", 8, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games\Priority", 6, "REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games\Scheduling Category", "High", "REG_SZ" 

Rem >> Windows-Media-Player optimieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\Settings\EnableDVDUI", "yes", "REG_SZ" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\AppColorBlackBackground", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\CustomBufferTime", 2000, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\MaxBandwidth", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\SendUserGUID", 0, "REG_BINARY"  
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\UsageTracking", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\UseDefaultBufferTime", 0, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\SOFTWARE\Microsoft\MediaPlayer\Preferences\Volume", 100, "REG_DWORD" 

Rem >> Office Optimieren << 
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\Graphics\DisableAnimations", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\14.0\Common\Graphics\DisableHardwareAcceleration", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\Graphics\DisableAnimations", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\15.0\Common\Graphics\DisableHardwareAcceleration", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Graphics\DisableAnimations", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\16.0\Common\Graphics\DisableHardwareAcceleration", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\18.0\Common\Graphics\DisableAnimations", 1, "REG_DWORD" 
WSHShell.RegWrite "HKEY_CURRENT_USER\Software\Microsoft\Office\18.0\Common\Graphics\DisableHardwareAcceleration", 1, "REG_DWORD" 
 
Rem >> Alexa ausschalten << 
Err.Clear 
On Error Resume Next 
WshShell.run "Reg Delete " & "HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Extentions\c95fe080-8f5d-112d-a20b-00aa003c157a\"  & " /f" 

Rem >> Vorgaben f�r Cleanmgr.exe << 
Err.Clear 
On Error Resume Next 
Set objShell = CreateObject("WScript.Shell")
rem Const HKEY_LOCAL_MACHINE = &H80000002
strComputer = "."
Set objRegistry = GetObject("winmgmts:{impersonationLevel=Impersonate}!\\" & strComputer & "\root\default:StdRegProv")
strRegRoot = HKEY_LOCAL_MACHINE
strKey = "SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"
If objRegistry.EnumKey(strRegRoot, strKey, arrKeyNames) = 0 Then
If IsNull(arrKeyNames) = False Then 
For Each strKeyName In arrKeyNames
If Right(strKey, 1) = "\" Then
strFullPath = strKey & strKeyName
Else
strFullPath = strKey & "\" & strKeyName
End If
objRegistry.SetDWORDValue strRegRoot, strFullPath, "StateFlags", 1
objRegistry.SetDWORDValue strRegRoot, strFullPath, "Priority", 4294967295
Next
End If
End If	
Err.Clear 
On Error Resume Next 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Compress old files\StateFlags", 0,"REG_DWORD" 
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Temporary Files\LastAccess", 2,"REG_DWORD" 
 
Rem >> Explorer.exe neu starten << 
Err.Clear 
On Error Resume Next  
WSHShell.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\AutoRestartShell", 1, "REG_DWORD" 
WshShell.Run "gpupdate /force", 1, True 
Err.Clear 
On Error Resume Next 
WshShell.Run "Explorer.exe", 1, True 
Err.Clear 
End Sub  
 
Rem >> Optimize-Windows << 
Err.Clear 
start = Timer 
On Error Resume Next 
If SystemOptimizer = "yes" then winOpt 
Err.Clear 
On Error Resume Next 
If HDOptimizer = "yes" then HDOpt 
Err.Clear 

Rem >> Abschliessend alle Hintergrundprozesse Ausf�hren << 
On Error Resume Next 
WshShell.Run "net start wuauserv", 1, True
Err.Clear 
On Error Resume Next 
WshShell.Run "wuauclt.exe /resetauthorization /detectnow", 1, False
Err.Clear 
On Error Resume Next 
WshShell.Run "Rundll32.exe advapi32.dll,ProcessIdleTasks", 1, False
Err.Clear 

On Error Resume Next  
Const Above_Normal = 32768  
strComputer = "." 
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\cimv2")  
Set colProcesses = objWMIService.ExecQuery _ 
("Select * from Win32_Process Where Name = 'Explorer.exe'")  
For Each objProcess in colProcesses  
objProcess.SetPriority(Above_Normal)  
Next 
Set WshShell = Nothing 
Set objShell = Nothing 
ende = Timer 
 
 
Rem >> Finish Installation <<
Err.Clear 
On Error Resume Next 
If Language = "deutsch" Then shutdown = MsgBox (winversioncheck &" wurde erfolgreich optimiert!!! " & vbNewLine & vbNewLine & "Zeit (sec.) :" & vbTab & ende-start _ 
& vbNewLine & vbNewLine & "Das Anpassen von " & WinVersionCheck & " ist jetzt abgeschlossen und " _ 
& vbNewLine & "wird nach dem n�chsten Neustart vollst�ndig wirksam... " _ 
& vbNewLine & vbNewLine & "Das System jetzt neu starten? ", _ 
vbSystemModal + vbOKCancel, Version) 

If Language = "english" Then shutdown = MsgBox (winversioncheck &" was optimized successfully!!! " & vbNewLine & vbNewLine & "Time (sec.) :" & vbTab & ende-start _ 
& vbNewLine & vbNewLine & "Adjusting " & WinVersionCheck & " is now complete and " _ 
& vbNewLine & "will take effect after the next reboot... " _ 
& vbNewLine & vbNewLine & "Restart the System now? ", _ 
vbSystemModal + vbOKCancel, Version) 
If shutdown <> vbOK then WScript.Quit 
 
Err.Clear 
On Error Resume Next 
Set OpSysSet = GetObject("winmgmts:{(Shutdown)}//./root/cimv2").ExecQuery("select * from Win32_OperatingSystem where Primary=true") 
for each OpSys in OpSysSet 
OpSys.Reboot() 
next 
Err.Clear 
WScript.Quit 
 
 
rem 	************************************* 
rem 	* !c3 WIN-OPTIMIZER	 	    * 
rem 	* -written by 			    * 
rem 	* Ren� Bengsch 			    * 
rem 	* info/contact @ 		    * 
rem 	* e-M@il: senseless-creature@web.de * 
rem 	************************************* 
 
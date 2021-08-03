:: REMOVE BLOATWARES
PowerShell -Command "Get-AppxPackage Microsoft.YourPhone -AllUsers| Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *xboxapp* -AllUsers| Remove-AppxPackage"
PowerShell -Command "Get-AppxPackage *Microsoft.XboxGamingOverlay * -AllUsers| Remove-AppxPackage"



::REMOVE TELEMETRY




::INTERNET TWEAKS




::SYSTEM TWEAKS FOLDERS/WIN UPDATES
PowerCfg.exe /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
Powershell "Disable-MMAgent -MemoryCompression"





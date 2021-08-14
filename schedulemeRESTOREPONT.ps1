  If(-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]"Administrator"))
 { Start-Process -File PowerShell.exe -Argument "-file $($myinvocation.mycommand.definition)" -Verb Runas }
  Write-Output "Creating Restore Point incase something bad happens"
  Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" -Name "SystemRestorePointCreationFrequency" -Value 0
  cmd /c 'vssadmin resize shadowstorage /on="%SystemDrive%" /For="%SystemDrive%" /MaxSize=5GB 2>nul' >$null
  Enable-ComputerRestore -Drive "$env:SystemDrive\"
  Checkpoint-Computer -Description "AUTOBACKUP" -RestorePointType "MODIFY_SETTINGS"
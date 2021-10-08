::WINDOWS 11 Bypass CPU Requirements
echo add "AllowUpgradesWithUnsupportedTPMOrCPU" 
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /f /t REG_DWORD /d "1"

echo add "BypassCPUCheck" 
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /f /t REG_DWORD /d "1"

echo add "BypassStorageCheck"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /f /t REG_DWORD /d "1"

echo add "BypassRAMCheck"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /f /t REG_DWORD /d "1"

echo add "BypassTPMCheck"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /f /t REG_DWORD /d "1"

echo add "BypassSecureBootCheck"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /f /t REG_DWORD /d "1"

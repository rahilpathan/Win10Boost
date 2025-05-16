::WINDOWS 11 Bypass CPU Requirements
@echo off 
echo add "Modify MoSetup" 
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "AllowUpgradesWithUnsupportedTPMOrCPU" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassCPUCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassStorageCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassRAMCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassTPMCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\MoSetup" /v "BypassSecureBootCheck" /f /t REG_DWORD /d "1"

reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassCPUCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassStorageCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassRAMCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassTPMCheck" /f /t REG_DWORD /d "1"
reg add "HKLM\SYSTEM\Setup\LabConfig" /v "BypassSecureBootCheck" /f /t REG_DWORD /d "1"

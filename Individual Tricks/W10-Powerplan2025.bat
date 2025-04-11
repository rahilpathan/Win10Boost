@echo off
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges. Please run as Administrator.
    pause
    exit /b
)

:: Set Balanced Power Plan as a fallback
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

:: Check if Github-RahilPathan-Optimized power plan exists and delete it
powercfg /delete 99999999-9999-9999-9999-999999999999

:: Create new power plan based on Balanced
powercfg -duplicatescheme 381b4222-f694-41f0-9685-ff5bb260df2e 99999999-9999-9999-9999-999999999999
if %errorlevel% neq 0 (
    echo Failed to create new power scheme. Check if the GUID is unique or try again.
    pause
    exit /b
)

:: Activate and name the new power plan
powercfg -setactive 99999999-9999-9999-9999-999999999999
powercfg -changename 99999999-9999-9999-9999-999999999999 "Github-RahilPathan-Optimized" "Max performance on AC, ultra-low power on battery"

:: --- AC Power Settings (Max Performance) ---
:: Processor: No throttling, max frequency
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100

:: Display: Max brightness, no timeout
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 100
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 0

:: Sleep: Disable sleep
powercfg -setacvalueindex 99999999-9999-9999-9999-999999999999 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0

:: --- Battery Power Settings (Ultra-Low Power) ---
:: Processor: Low idle, allow throttling
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 5
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 50

:: Display: Low brightness, 1-minute timeout
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 aded5e82-b909-4619-9949-f5d71dac0bcb 30
powercfg -setdcvalueindex 99999999-9999-9999-9999-999999999999 7516b95f-f776-4464-8c53-06167f40cc99 3c0bc021-c8a8-4e07-a973-6b14cbcb2b7e 60

:: Apply settings
powercfg -setactive 99999999-9999-9999-9999-999999999999

echo Github-RahilPathan-Optimized power plan applied successfully!
pause
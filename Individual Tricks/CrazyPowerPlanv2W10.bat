@echo off
setlocal enabledelayedexpansion

rem Set Balanced Power Plan as Active Initially
powercfg -setactive 381b4222-f694-41f0-9685-ff5bb260df2e

rem Check if the power plan exists and remove it if found
powercfg /list | findstr /i "88888888-8888-8888-8888-228888888822" >nul
if %errorlevel% equ 0 (
    powercfg /delete 88888888-8888-8888-8888-228888888822
)

rem Create and set Ultimate Performance power plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 88888888-8888-8888-8888-228888888822
powercfg -setactive 88888888-8888-8888-8888-228888888822
powercfg -changename 88888888-8888-8888-8888-228888888822 "Github-Rahilpathan" "Maximized performance settings for power users"

rem Comprehensive CPU Power Management
bcdedit /set disabledynamictick yes
bcdedit /set numproc 16
bcdedit /set processorcount 8
bcdedit /set useplatformtick yes
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 36687f9e-e3a5-4dbf-b1dc-15eb381c6863 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 45bcc044-d885-43e2-8605-ee0ec6e96b59 100
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 93b8b6dc-0698-4d1c-9ee4-0644e900c85d 1
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 5fb4938d-1ee8-4b0f-9a3c-5036b0ab995c dd848b2a-8a5d-4451-9ae2-39cd41658f6c 2
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888822 de830923-a562-41af-a086-e3a2c6bad2da 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0
powercfg /hibernate off

rem Apply Final Configuration
powercfg -setactive 88888888-8888-8888-8888-228888888822

echo Enjoy the maximum performance possible
pause

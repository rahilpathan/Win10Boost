@echo off
setlocal enabledelayedexpansion

rem Create and set Ultimate Performance power plan
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61 88888888-8888-8888-8888-228888888821
powercfg -setactive 88888888-8888-8888-8888-228888888821
powercfg -changename 88888888-8888-8888-8888-228888888821 "Github-Rahilpathan" "Maximized performance settings for power users"

rem CPU Power Management
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 0
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0

rem Disable Core Parking
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 ea062031-0e34-4ff1-9b6d-eb1059334028 0

rem Disable Idle States
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 5d76a2ca-e8c0-402f-a133-2158492d58ad 0

rem Disable C-States
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 54533251-82be-4824-96c1-47b60b740d00 68afb2d9-ee95-47a8-8f50-4115088073b1 0

rem Disable USB Selective Suspend
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0

rem Disable Hard Disk Timeout
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 0012ee47-9041-4b5d-9b77-535fba8b1442 6738e2c4-e8a5-4a42-b16a-e040e769756e 0

rem Disable Hibernate
powercfg /hibernate off

rem Disable Sleep
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 238c9fa8-0aad-41ed-83f4-97be242c8f20 29f6c1db-86da-48c5-9fdb-f2b67b1f44da 0

rem Disable Adaptive Brightness
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 7516b95f-f776-4464-8c53-06167f40cc99 fbd9aa66-9553-4097-ba44-ed6e9d65eab8 0

rem Set High Performance Graphics
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 5fb4938d-1ee8-4b0f-9a3c-5036b0ab995c dd848b2a-8a5d-4451-9ae2-39cd41658f6c 2

rem Disable Power Throttling
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 de830923-a562-41af-a086-e3a2c6bad2da 3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb 0

rem Disable PCI Express Power Management
powercfg -setacvalueindex 88888888-8888-8888-8888-228888888821 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0

powercfg -setactive 88888888-8888-8888-8888-228888888821

rem Disable dynamic frequency scaling (if desired)
powercfg /setacvalueindex SCHEME_GLOBAL 5738 0

rem Set minimum processor state to 100%
powercfg /setacvalueindex SCHEME_GLOBAL 5720 100

rem Set maximum processor state to 100%
powercfg /setacvalueindex SCHEME_GLOBAL 5724 100

rem Disable adaptive brightness (if applicable)
powercfg /setacvalueindex SCHEME_GLOBAL 5704 0

rem Disable automatic dimming (if applicable)
powercfg /setacvalueindex SCHEME_GLOBAL 5706 0

rem Set hard disk idle timeout to 0 seconds
powercfg /setacvalueindex SCHEME_GLOBAL 5728 0

rem Set hard disk spin-down timeout to 0 seconds
powercfg /setacvalueindex SCHEME_GLOBAL 5730 0

rem Set PCI Express link state power management to 0 (performance mode)
powercfg /setacvalueindex SCHEME_GLOBAL 5740 0

rem Set USB selective suspend timeout to 0 seconds
powercfg /setacvalueindex SCHEME_GLOBAL 5742 0

rem CPU Parking tweaks
powercfg /setacvalueindex SCHEME_GLOBAL 5741 0
powercfg /setacvalueindex SCHEME_GLOBAL 5743 0

rem BCEdit tweaks (modify as needed)
bcdedit /set processorcores 8 (adjust the number of cores based on your system)
bcdedit /set numprocthreads 16 (adjust the number of processor threads based on your system)

rem Other potential tweaks (explore and adjust as needed)
powercfg /setacvalueindex SCHEME_GLOBAL 5708 0 (disable idle timers)
powercfg /setacvalueindex SCHEME_GLOBAL 5716 0 (disable PCI Express bus mastering)
powercfg /setacvalueindex SCHEME_GLOBAL 5718 0 (disable PCI Express link state power management)

rem BCDEdit tweaks
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
bcdedit /deletevalue useplatformclock

rem Apply changes
powercfg -setactive 88888888-8888-8888-8888-228888888821
echo Enjoy the maximum performance possible
pause

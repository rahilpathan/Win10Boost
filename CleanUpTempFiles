@echo off
setlocal enabledelayedexpansion

:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo This script requires administrative privileges.
    echo Please run it as an administrator.
    pause
    exit /b
)

echo Windows Cleanup Utility
echo =======================
echo.
:: Run Disk Cleanup
echo Running Disk Cleanup...
cleanmgr /sagerun:1 /verylowdisk

:: Define directories to clean
set "cleanup_dirs=%TEMP% %WINDIR%\Temp %WINDIR%\Prefetch"
set "cleanup_dirs=!cleanup_dirs! %SystemRoot%\SoftwareDistribution\Download"
set "cleanup_dirs=!cleanup_dirs! %LocalAppData%\Temp"
set "cleanup_dirs=!cleanup_dirs! %LocalAppData%\Microsoft\Windows\INetCache"
set "cleanup_dirs=!cleanup_dirs! %USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer"
set "cleanup_dirs=!cleanup_dirs! %USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache"
set "cleanup_dirs=!cleanup_dirs! %USERPROFILE%\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache"

:: Clean directories
for %%d in (%cleanup_dirs%) do (
    if exist "%%d" (
        echo Cleaning: %%d
        rd /s /q "%%d" 2>nul
        md "%%d" 2>nul
    )
)

:: Define files to delete
set "cleanup_files=%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db"
set "cleanup_files=!cleanup_files! %SystemDrive%\*.tmp %SystemDrive%\*.log"
set "cleanup_files=!cleanup_files! %WINDIR%\*.bak %SystemRoot%\Logs\CBS\CBS.log"

:: Delete files
for %%f in (%cleanup_files%) do (
    if exist "%%f" (
        echo Deleting file: %%f
        del /f /s /q "%%f" 2>nul
    )
)

:: Empty Recycle Bin
echo Emptying Recycle Bin...
powershell.exe -Command "Clear-RecycleBin -Force" 2>nul

:: Clear event logs
echo Clearing Event Logs...
for /f "tokens=*" %%L in ('wevtutil el') do (
    echo Clearing event log: %%L
    wevtutil cl "%%L" 2>nul
)

echo.
echo Cleanup completed.
imeout /t 3 >nul

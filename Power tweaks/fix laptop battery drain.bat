@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrative permissions confirmed...
) else (
    echo ######## ERROR: PLEASE RUN THIS AS ADMINISTRATOR ########
    pause
    exit /b
)

echo ---------------------------------------------------------
echo 1. ENABLING HIBERNATION FEATURE
echo ---------------------------------------------------------
powercfg /hibernate on

echo ---------------------------------------------------------
echo 2. APPLYING REGISTRY TWEAKS (DISABLE NETWORK IN STANDBY)
echo ---------------------------------------------------------
:: Forces Network Connectivity to 'Never' on Battery
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "DCSettingIndex" /t REG_DWORD /d 0 /f
:: Forces Network Connectivity to 'Never' when Plugged In
reg add "HKLM\Software\Policies\Microsoft\Power\PowerSettings\f15d7e74-843b-4100-b851-7f8d6896265e" /v "ACSettingIndex" /t REG_DWORD /d 0 /f

echo ---------------------------------------------------------
echo 3. SETTING LID CLOSE ACTION TO HIBERNATE
echo ---------------------------------------------------------
:: Value 2 = Hibernate (1=Sleep, 3=Shutdown, 0=Nothing)
:: On Battery
powercfg /setdcvalueindex SCHEME_CURRENT 4f971e98-33f7-4e44-8701-4c8104130c33 5ca79f96-3741-4351-bca3-60055214b6d4 2
:: Plugged In
powercfg /setacvalueindex SCHEME_CURRENT 4f971e98-33f7-4e44-8701-4c8104130c33 5ca79f96-3741-4351-bca3-60055214b6d4 2

echo ---------------------------------------------------------
echo 4. APPLYING CHANGES
echo ---------------------------------------------------------
powercfg /setactive SCHEME_CURRENT

echo.
echo SUCCESS! Your battery should now last much longer. 
echo and your laptop will Hibernate when you close the lid.
echo.
pause
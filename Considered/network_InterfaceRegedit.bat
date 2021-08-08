@echo off
for /f "usebackq" %%i in (`reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces`) do (
Reg.exe add %%i /v "TcpAckFrequency" /d "1" /t REG_DWORD /f
Reg.exe add %%i /v "TCPNoDelay" /d "1" /t REG_DWORD /f
Reg.exe add %%i /v "TCPDelAckTicks" /d "0" /t REG_DWORD /f
Reg.exe add %%i /v "MTU" /d "450" /t REG_DWORD /f
Reg.exe add %%i /v "MSS" /d "410" /t REG_DWORD /f
Reg.exe add %%i /v "TcpWindowSize" /d "64440" /t REG_DWORD /f
)
pause

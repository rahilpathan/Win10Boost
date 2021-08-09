
netsh interface tcp set global autotuning=normal
@ECHO ON
netsh int tcp set heuristics disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabledstart cmd.exe /k ping  127.0.0.1  -t -l-n 65000
netsh int tcp set global congestionprovider=none
netsh int tcp set global autotuninglevel=high
netsh int tcp set global chimney=disabled
netsh int tcp set global dca=enable
netsh int tcp set global netdma=enable
netsh int tcp set heuristics enable
netsh int tcp set global rss=enabled
netsh int tcp set global timestamps=enable
netsh int tcp set heuristics disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
netsh int ipv4 set subinterface "Local Area Connection" mtu=80 store=persistent
netsh int tcp set global rsc=enabled
netsh int tcp set heuristics disabled
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set supplemental template=custom icw=10
netsh int tcp set heuristics disabled
netsh interface ip delete arpcache
netsh winsock reset catalog
netsh int ip reset c:resetlog.txt
netsh int ip reset C:\tcplog.txt
netsh winsock reset catalog
netsh interface ip delete arpcache
netsh winsock reset catalog
netsh int ip reset c:resetlog.txt
netsh int ip reset C:\tcplog.txt
netsh winsock reset catalog
netsh interface ipv4 set subinterface "Local Area Connection" mtu=150 store=persistent
netsh interface ipv4 set subinterface "Internet" mtu=80 store=persistent
netsh int ip reset c:resetlog.txt
netsh int ip reset C:\tcplog.txt

:echo: netsh int tcp set heuristics disabled
:echo: netsh int tcp set global autotuninglevel=disabled
:echo: netsh int tcp set global congestionprovider=ctcp
:echo: netsh int tcp set global rss=enabled
:echo: netsh int tcp set global chimney=enabled
:echo: netsh int tcp set global dca=enabled
:echo: netsh interface ipv4 set subinterface "Wireless Network Connection" mtu=1500 store=persistent
:echo: netsh int tcp set global netdma=enabled
:echo: netsh int tcp set global timestamps=disabled
:echo: netsh int tcp set global nonsackrttresiliency=disabled
:echo: netsh int tcp set supplemental template=custom icw=10
:echo: netsh int tcp set global fastopen=enabled
:echo: netsh interface tcp set heuristics enabled
:echo: netsh interface tcp set heuristics wsh=enabled
:echo: netsh interface ip set global neighborcachelimit=4096 
:echo: netsh interface ip set global defaultcurhoplimit=64       
:echo: netsh interface ip set global taskoffload=enabled mediasenseeventlog=disabled
:echo: netsh interface ip show interface level=verbose
:echo: netsh interface ip show interface "Wireless Network Connection"
:echo: netsh interface ip set interface "Wireless Network Connection" basereachable=60000 metric=1000 mtu=1500 routerdiscovery=disabled
:echo: netsh interface tcp set heuristics enabled
:echo: netsh interface tcp set heuristics wsh=enabled
:echo: netsh interface ip set global neighborcachelimit=4096 
:echo: netsh interface ip set global defaultcurhoplimit=64       
:echo: netsh interface ip set global taskoffload=enabled mediasenseeventlog=disabled
:echo: netsh interface ip show interface level=verbose
:echo: netsh interface ip show interface "Wireless Network Connection"
C: /Internet Connection /GETURL=16_Kilobyte_Blocks 
 netsh interface ip show interface "Wireless Network Connection"
C: /Internet Connection /(Your NIC) /MTU /Refresh=2000_Nanoseconds
C: /chrome.exe /MTU /REFRESH=20_Nanoseconds
C: /iexplorer.exe /MTU /REFRESH=20_Nanoseconds

:echo: netsh interface ip set global neighborcachelimit=4096 
:echo: netsh interface ip set global defaultcurhoplimit=64       
:echo: netsh interface ip set global taskoffload=enabled mediasenseeventlog=disabled
:echo: netsh interface ip show interface level=verbose




:echo: netsh int show global
:echo: ipconfig

:r
color C
cls
netsh interface tcp set global autotuning=normal
goto success

:l
color C
cls
netsh interface tcp set global autotuning=restricted
goto success

:success
color A
cls
netsh interface tcp show global
netsh int tcp show global
netsh int tcp set global chimney=disabled
netsh int tcp set global autotuninglevel=disabled
netsh int tcp set global ecncapability=disabled
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface tcp set global ecncapability=disabled
netsh int tcp show global
del /s /f /q c:\windows\temp\*.*
rd /s /q c:\windows\temp
md c:\windows\temp
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
rd /s /q %temp%
md %temp%
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers

netsh interface tcp set global autotuning=normal
netsh interface tcp set global autotuning=restricted
netsh int tcp set heuristics disabled
netsh int tcp set global rss=enabled
netsh int tcp set global chimney=enabled
netsh int tcp set global autotuninglevel=normal
netsh int tcp set global congestionprovider=ctcp
netsh int tcp set global ecncapability=disabled
netsh int tcp set global timestamps=disabled
Pause
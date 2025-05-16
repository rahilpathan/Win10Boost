WinX\Group2 control panel$path = "$env:LOCALAPPDATA\Microsoft\Windows\WinX\Group2"
$x = "UEsDBBQAAAAIAEphSkmJ5YBS0QAAAPcDAAARAAAAQ29udHJvbCBQYW5lbC5sbmvzYWBgYBRhYgCBA2CSwa2B
mQEiQAAwovEnAzEnA8MCXSBtGBwQ/Kgrwm2Pj4Xz7j/Ck9Vm5J4ThCkURtIEUxyq4TO/cr6l94oLD6/oPrz6GaRYCK
aYEU1xtW7v74sTTPz2J+St4ZykvR+kmAmm+Og13laY6SLMYM0LVMsz81Iyi1RjiiuLS1JzjY1ikvPzSoryc/RSK1KJ
8eswAKoM5QyZDHkMKUCyCMiLYShmqATiEoZUhlwGYwYjoEgyQz5QRQlQPp8hh0EPKFPBMFLCZyQBAFBLAQIUABQAAA
AIAEphSkmJ5YBS0QAAAPcDAAARAAAAAAAAAAAAAAAAAAAAAABDb250cm9sIFBhbmVsLmxua1BLBQYAAAAAAQABAD8A
AAAAAQAAAAA=".replace("`n","")
[Convert]::FromBase64String($x) | Set-Content $path\temp.zip -Encoding Byte
Expand-Archive $path\temp.zip -DestinationPath $path
Remove-Item $path\temp.zip
Stop-Process -Name Explorer
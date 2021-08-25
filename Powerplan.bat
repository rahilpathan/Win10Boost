pushd %~dp0
powercfg.exe /import %~dp0/RevisionPowerplanV2.9.pow 
popd
PAUSE
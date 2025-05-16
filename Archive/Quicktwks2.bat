del /f/q "C:\Users\%USERNAME%\Desktop\Microsoft Edge.lnk"
del /f/q "C:\Users\%USERNAME%\Desktop\Your Phone.lnk"
fsutil behavior query Disabledeletenotify
fsutil behavior set DisableDeleteNotify 0
netsh interface 6to4 set state disable disable
netsh interface isatap set state disable
netsh interface teredo set state disable
powercfg -h off
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *4DF9E0F8.Netflix* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *6Wunderkinder.Wunderlist* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *9E2F88E3.Twitter* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *22StokedOnIt.NotebookPro* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.HiddenCityMysteryofShadows* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *7458BE2C.WorldofTanksBlitz* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *41038Axilesoft.ACGMediaPlayer* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *46928bounde.EclipseManager* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *89006A2E.AutodeskSketchBook* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DisneyMagicKingdoms* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.DragonManiaLegends* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *A278AB0D.MarchofEmpires* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *CAF9E577.Plex* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *D52A8D61.FarmVille2CountryEscape | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *DolbyLaboratories.DolbyAccess* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Drawboard.DrawboardPDF* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.317180B0BB486* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.Facebook* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Facebook.InstagramBeta* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Fitbit.FitbitCoach* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *flaregamesGmbH.RoyalRevolt2* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Flipboard.Flipboard* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *INGAG.XING* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *KeeperSecurityInc.Keeper* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.BubbleWitch3Saga* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSaga* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *king.com.CandyCrushSodaSaga* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.3DBuilder* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.AgeCastles* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Appconnector* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFinance* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingFoodAndDrink* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingHealthAndFitness* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingNews* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingSports* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTranslator* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingTravel* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.BingWeather* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.CommsPhone* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ConnectivityStore* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.DesktopAppInstaller* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.FreshPaint* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.GetHelp* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Getstarted* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Messaging* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Microsoft3DViewer* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftOfficeHub* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *microsoft.microsoftskydrive* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MicrosoftStickyNotes* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MinecraftUWP* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MixedReality.Portal* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.MSPaint* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.NetworkSpeedTest* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.OneNote* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Office.Sway* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.OneConnect* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.People* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Print3D* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ScreenSketch* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.SkypeApp* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Wallet* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WebMediaExtensions* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Windows.Photos* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsAlarms* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsCamera* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.windowscommunicationsapps* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsFeedbackHub* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsMaps* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsPhone* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.WindowsSoundRecorder* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.Xbox.TCUI* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.XboxApp* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.YourPhone* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneMusic* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Microsoft.ZuneVideo* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *NAVER.LINEwin8* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Nordcurrent.CookingFever* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *PandoraMediaInc.29680B314EFC2* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ShazamEntertainmentLtd.Shazam* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SiliconBendersLLC.Sketchable* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *SpotifyAB.SpotifyMusic* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TheNewYorkTimes.NYTCrossword* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *TuneIn.TuneInRadio* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *USATODAY.USATODAY* | Remove-AppxProvisionedPackage -Online"
Powershell "Get-AppxProvisionedPackage -Online | where Displayname -EQ *WinZipComputing.WinZipUniversal* | Remove-AppxProvisionedPackage -Online"
PowerShell -Command "((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Edge'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}"
PowerShell -Command "((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq 'Microsoft Store'}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}"
Powershell -Command "Get-AppxPackage *2FE3CB00.PicsArt-PhotoStudio* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *4DF9E0F8.Netflix* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *5CB722CC.SeekersNotesMysteriesofDarkwood* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *6Wunderkinder.Wunderlist* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *9E2F88E3.Twitter* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *22StokedOnIt.NotebookPro* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *828B5831.HiddenCityMysteryofShadows* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *828B5831.TheSecretSociety-HiddenMystery* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *7458BE2C.WorldofTanksBlitz* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *41038Axilesoft.ACGMediaPlayer* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *46928bounde.EclipseManager* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *89006A2E.AutodeskSketchBook* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *A278AB0D.AsphaltStreetStormRacing* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *A278AB0D.DisneyMagicKingdoms* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *A278AB0D.DragonManiaLegends* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *A278AB0D.MarchofEmpires* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *ActiproSoftwareLLC.562882FEEB49* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *AdobeSystemsIncorporated.PhotoshopElements2018* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *alarms* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *bingweather* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *CAF9E577.Plex* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *calculator* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *camera* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *ClearChannelRadioDigital.iHeartRadio* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *communications* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *D5EA27B7.Duolingo-LearnLanguagesforFree* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *D52A8D61.FarmVille2CountryEscape | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *DB6EA5DB.CyberLinkMediaSuiteEssentials* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *DolbyLaboratories.DolbyAccess* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Drawboard.DrawboardPDF* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Expedia.ExpediaHotelsFlightsCarsActivities* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Facebook.317180B0BB486* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Facebook.Facebook* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Facebook.InstagramBeta* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Fitbit.FitbitCoach* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *flaregamesGmbH.RoyalRevolt2* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Flipboard.Flipboard* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *GAMELOFTSA.Asphalt8Airborne* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *INGAG.XING* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *KeeperSecurityInc.Keeper* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *king.com.* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *king.com.BubbleWitch3Saga* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *king.com.CandyCrushSaga* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *king.com.CandyCrushSodaSaga* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *maps* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.AgeCastles* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Appconnector* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingFinance* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingFoodAndDrink* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingHealthAndFitness* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingSports* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingTranslator* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingTravel* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.CommsPhone* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.ConnectivityStore* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.DesktopAppInstaller* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.FreshPaint* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp* -AllUsers | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MicrosoftPowerBIForWindows* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *microsoft.microsoftskydrive* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MinecraftUWP* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.OneConnect* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WebMediaExtensions* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.windowscommunicationsapps* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsPhone* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *NAVER.LINEwin8* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Nordcurrent.CookingFever* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *PandoraMediaInc.29680B314EFC2* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *Playtika.CaesarsSlotsFreeCasino* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *ShazamEntertainmentLtd.Shazam* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *SiliconBendersLLC.Sketchable* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *solitairecollection* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *soundrecorder* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *TheNewYorkTimes.NYTCrossword* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *ThumbmunkeysLtd.PhototasticCollage* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *TuneIn.TuneInRadio* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *USATODAY.USATODAY* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *WinZipComputing.WinZipUniversal* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage *zunemusic* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *3DBuilder*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ACGMediaPlayer*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ActiproSoftwareLLC*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AdobePhotoshopExpress*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AdobeSystemsIncorporated.AdobePhotoshopExpress*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Advertising.Xaml*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Advertising.Xml*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *alarm*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AppConnector*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Asphalt8Airborne*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *AutodeskSketchBook*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingFinance*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingNews*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingSports*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BingTranslator*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *BubbleWitch3Saga*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *CandyCrush*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *communi*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *connectivity*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *CyberLinkMediaSuiteEssentials*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *DisneyMagicKingdoms*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *DrawboardPDF*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Duolingo*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Duolingo-LearnLanguagesforFree*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *EclipseManager*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Facebook*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *FarmVille2CountryEscape*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *feedback*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Flipboard*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *GetHelp*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Getstarted*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *groove*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *HiddenCity*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *HiddenCityMysteryofShadows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Keeper*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *king.com.FarmHeroesSaga*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Lens*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *LinkedInforWindows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *maps*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MarchofEmpires*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Messaging*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Microsoft.MSPaint*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Microsoft3DViewer*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftOfficeHub*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftPowerBIForWindows*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftSolitaireCollection*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MicrosoftStickyNotes*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *MixedReality.Portal*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *NetworkSpeedTest*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *office*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *OneCalendar*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *OneConnect*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *OneNote*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Pandora*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *PandoraMediaInc*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *People*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *phone*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *photos*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *photoshop*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Plex*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Print3D*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *reality*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RemoteDesktop*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Roblox*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ROBLOXCORPORATION.ROBLOX*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RoyalRevolt*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *RoyalRevolt2*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *ScreenSketch*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *solit*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *SolitaireCollection*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *SpeedTest*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Sway*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *tiktok*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Twitter*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Wallet*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Whiteboard*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WindowsAlarms*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *windowscommunicationsapps*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WindowsFeedbackHub*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WindowsMaps*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WindowsPhone*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WindowsSoundRecorder*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *WinZipUniversal*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Wunderlist*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *Xbox*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *XboxSpeechToTextOverlay*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *XING*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *YourPhone*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers *zune*|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F1|Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers Microsoft.549981C3F5F10 | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage -allusers Microsoft.YourPhone* | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.Microsoft3DViewer | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.MicrosoftStickyNotes | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.MixedReality.Portal | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.MSPaint | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.SkypeApp | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.WindowsFeedbackHub | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage Microsoft.ZuneVideo | Remove-AppxPackage"
Powershell -Command "Get-AppxPackage people | Remove-AppxPackage"
reg add "HKCR\IE.AssocFile.URL" /v NeverShowExt /f
reg add "HKCR\IE.AssocFile.WEBSITE" /v NeverShowExt /f
reg add "HKCR\InternetShortcut" /v NeverShowExt /f
reg add "HKCR\LibraryFolder" /v NeverShowExt /f
reg add "HKCR\lnkfile" /v NeverShowExt /f
reg add "HKCR\Microsoft.Website" /v NeverShowExt /f
reg add "HKCR\piffile" /v NeverShowExt /f
reg add "HKCR\SHCmdFile" /v NeverShowExt /f
reg add "HKCU\Control Panel\Accessibility" /v StickyKeys /t REG_SZ /d 506 /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v AutoRepeatRate /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v DelayBeforeAcceptance /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Accessibility\Keyboard Response" /v Flags /t REG_SZ /d 122 /f
reg add "HKCU\Control Panel\Accessibility\MouseKeys" /v Flags /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Accessibility\StickyKeys" /v Flags /t REG_SZ /d 506 /f
reg add "HKCU\Control Panel\Accessibility\ToggleKeys" /v Flags /t REG_SZ /d 58 /f
reg add "HKCU\Control Panel\Desktop" /v DragFullWindows /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v FontSmoothing /t REG_SZ /d 2 /f
reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t "REG_DWORD" /d 100 /f
reg add "HKCU\Control Panel\Desktop" /v JPEGImportQuality /t REG_DWORD /d 100 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9032078010000000 /f
reg add "HKCU\Control Panel\Desktop" /v VisualFXSetting /t REG_DWORD /d 3 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate" REG_SZ /d 0 /f
reg add "HKCU\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f
reg add "HKCU\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f
reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Permissions\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v Value /t REG_SZ /d Deny /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync" /v SyncPolicy /t REG_DWORD /d 5 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Accessibility" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\AppSync" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\BrowserSettings" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Credentials" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\DesktopTheme" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Language" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Personalization" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\StartLayout" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SettingSync\Groups\Windows" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v GamePanelStartupTipIndex /t REG_DWORD /d 3 /f
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\InputPersonalization\TrainedDataStore" /v HarvestContacts /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Siuf\Rules" /v PeriodInNanoSeconds /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v SmartScreenEnabled /t "REG_SZ" /d Off /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v ContentDeliveryAllowed /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v FeatureManagementEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v OemPreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v PreInstalledAppsEverEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RemediationRequired /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v RotatingLockScreenOverlayEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SilentInstalledAppsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SoftLandingEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-310093Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-314563Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338387Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338389Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353694Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353696Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-353698Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SystemPaneSuggestionsEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 22StokedOnIt.NotebookPro_ffs55s3hze5sr /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 2FE3CB00.PicsArt-PhotoStudio_crhqpqs3x1ygc /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 41038Axilesoft.ACGMediaPlayer_wxjjre7dryqb6 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 5CB722CC.SeekersNotesMysteriesofDarkwood_ypk0bew5psyra /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 7458BE2C.WorldofTanksBlitz_x4tje2y229k00 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 828B5831.HiddenCityMysteryofShadows_ytsefhwckbdv6 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 828B5831.TheSecretSociety-HiddenMystery_ytsefhwckbdv6 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 89006A2E.AutodeskSketchBook_tf1gferkr813w /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v 9E2F88E3.Twitter_wgeqdkkx372wm /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v A278AB0D.AsphaltStreetStormRacing_h6adky7gbf63m /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v A278AB0D.DisneyMagicKingdoms_h6adky7gbf63m /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v A278AB0D.DragonManiaLegends_h6adky7gbf63m /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v A278AB0D.MarchofEmpires_h6adky7gbf63m /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v AdobeSystemsIncorporated.PhotoshopElements2018_ynb6jyjzte8ga /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v CAF9E577.Plex_aam28m9va5cke /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v DolbyLaboratories.DolbyAccess_rz1tebttyb220 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Drawboard.DrawboardPDF_gqbn7fs4pywxm /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Expedia.ExpediaHotelsFlightsCarsActivities_0wbx8rnn4qk5c /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Facebook.317180B0BB486_8xx8rvfyw5nnt /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Facebook.Facebook_8xx8rvfyw5nnt /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Facebook.InstagramBeta_8xx8rvfyw5nnt /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Fitbit.FitbitCoach_6mqt6hf9g46tw /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v GAMELOFTSA.Asphalt8Airborne_0pp20fcewvvtj /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.AgeCastles_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.BingNews_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.BingSports_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.BingWeather_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.MSPaint_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.MicrosoftSolitaireCollection_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Microsoft.MinecraftUWP_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v NAVER.LINEwin8_8ptj331gd3tyt /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v Nordcurrent.CookingFever_m9bz608c1b9ra /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v SiliconBendersLLC.Sketchable_r2kxzpx527qgj /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v SpotifyAB.SpotifyMusic_zpdnekdrzrea0 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v ThumbmunkeysLtd.PhototasticCollage_nfy108tqq3p12 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v USATODAY.USATODAY_wy7mw3214mat8 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v WinZipComputing.WinZipUniversal_3ykzqggjzj4z0 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v flaregamesGmbH.RoyalRevolt2_g0q0z3kw54rap /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v king.com.BubbleWitch3Saga_kgqvnymyfvs32 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v king.com.CandyCrushSaga_kgqvnymyfvs32 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v king.com.CandyCrushSodaSaga_kgqvnymyfvs32 /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager\SuggestedApps" /v microsoft.microsoftskydrive_8wekyb3d8bbwe /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization" /v SystemSettingsDownloadMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisablePreviewDesktop /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewAlphaSelect /t REG_DWORD /D 1 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ListviewShadow /t REG_DWORD /D 1 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v DisallowShaking /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v HideFileExt /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v LaunchTo /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowCortanaButton /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowStatusBar /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSyncProviderNotifications /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowTaskViewButton /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarAnimations /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v TaskbarGlomLevel /t REG_dWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSuperHidden /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People" /v PeopleBand /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v AllItemsIconView /d 2 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ControlPanel" /v StartupPage /d 1 /t REG_DWORD /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v {20D04FE0-3AEA-1069-A2D8-08002B30309D} /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\NamingTemplates" /v ShortcutNameTemplate /t REG_SZ /d \"%%s.lnk\" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v StartupDelayInMSec /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 0x00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects\TaskbarAnimations" /v DefaultApplied /t REG_DWORD /d 0x00000001 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v ShellFeedsTaskbarViewMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v GameDVR_Enabled /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AudioCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v CursorCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v HistoricalCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v MicrophoneCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Attachments" /v SaveZoneInformation /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BackgroundAppGlobalToggle /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaCapabilities /t REG_SZ /d  /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v DeviceHistoryEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v IsAssignedAccess /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v IsWindowsHelloActive /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v VoiceShortcut /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Windows Search" /v CortanaConsent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\DWM " /v DisablePreviewDesktop /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\DWM" /v AlwaysHibernateThumbnails /t REG_DWORD /D 0 /F
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting" /v LoggingDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultConsent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultOverrideBehavior /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotification /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v NoToastApplicationNotificationOnLockScreen /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v ExplorerRibbonStartsMinimized /t REG_DWORD /d 4 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_DSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_DXGIHonorFSEWindowsCompatible /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_EFSEFeatureFlags /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehavior /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Control Panel\International\User Profile" /v HttpAcceptLanguageOptOut /t REG_DWORD /d 1 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Input\TIPC" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v NumberOfSIUFInPeriod /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules" /v PeriodInNanoSeconds /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v EnableWebContentEvaluation /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\LooselyCoupled" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{2EEF81BE-33FA-4800-9670-1CD474972C3F}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{992AFA70-6F47-4148-B3E9-3003349C1548}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{A8804298-2D5F-42E3-9531-9C8C39EB29CE}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{C1D23ACC-752B-43E5-8448-8D0E519CD6D6}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{D89823BA-7180-4B81-B50C-7E471E6121A3}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{E5323777-F976-4f5b-9B55-B94699C46E44}" /v Value /t REG_SZ /d Deny /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v ToastEnabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" /v AutoConnectAllowedOEM /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Biometrics" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WMDRM" /v DisableOnline /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableUAR /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CredUI" /v DisablePasswordReveal /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization" /v NoLockScreenCamera /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v Start /t REG_DWORD /d 0 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v KeyboardDelay /t REG_SZ /d 0 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v KeyboardSpeed /t REG_SZ /d 31 /f
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v InitialKeyboardIndicators /t REG_SZ /d 2147483650 /f
reg add "HKLM\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features\%UID%" /v FeatureStates /t REG_SZ /d 828 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v SensorPermissionState /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer" /v AllowServicePoweredQSA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Suggested Sites" /v Enabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocation /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableLocationScripting /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableSensors /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v DisableWindowsLocationProvider /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowSearchToUseLocation /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWeb /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v DisableWebSearch /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\NetworkProvider" /v RestoreConnection /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Network\NewNetworkWindowOff /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v HibernateEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v fAllowFullControl /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Kernel" /v DisableTsx /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v DisablePagingExecutive /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v SecondLevelDataCache /t REG_DWORD /d 512 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v LargeSystemCache /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\AutoLogger-Diagtrack-Listener" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\WMI\AutoLogger\SQMLogger" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\DoSvc" /v start /t REG_DWORD /d 2 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SecurityHealthService" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Sense" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\W3SVC" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WdNisSvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinDefend" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XblGameSave" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxGipSvc" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v Status /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsoluteAsRelative /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\mouhid\Parameters" /v TreatAbsolutePointerAsAbsolute /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\wscsvc" /v Start /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\xbgm" /v Start /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters" /v EnableICSIPv6 /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PCHealth\ErrorReporting" /v ShowUI /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\current\device\System" /v AllowExperimentation /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR" /v value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\Experience\AllowCortana" /v value /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\PolicyManager\default\System\AllowExperimentation" /v value /t "REG_DWORD" /d 0 /f
reg add "HKLM\Software\Microsoft\SQMClient\Windows" /v CEIPEnable /d 0 /t REG_DWORD /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Narrator.exe" /v Debugger /t REG_SZ /d 1 /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\WindowsUpdate\UX\Settings" /v BranchReadinessLevel /t REG_DWORD /d 32 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v DODownloadMode /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v DownloadMode /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v DownloadMode /t REG_SZ /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" /v EnableEventTranscript /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer" /v SmartScreenEnabled /t REG_SZ /d Off /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v Autorun /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\OOBE" /v DisableVoice /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v HideSCAMeetNow /t REG_dWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v ConsentPromptBehaviorAdmin /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v PromptOnSecureDesktop /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Application-Experience/Steps-Recorder" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/Main" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/PfApLog" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Channels\Microsoft-Windows-Superfetch/StoreLog" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v DontShowUI /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting" /v LoggingDisabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultConsent /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Microsoft\Windows\Windows Error Reporting\Consent" /v DefaultOverrideBehavior /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v DisableSendGenericDriverNotFoundToWER /t REG_DWORD /d 00000000 /f
reg add "HKLM\Software\Policies\Microsoft\DeviceHealthAttestationService" /v EnableDeviceHealthAttestationService /t REG_DWORD /d 00000000 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Geolocation" /v PolicyDisableGeolocation /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions" /v NoUpdateCheck /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\MRT" /v DontOfferThroughWUAU /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v AllowPrelaunch /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v DoNotTrack /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v FormSuggest Passwords /t REG_SZ /d no /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v PreventLiveTileDataCollection /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v SyncFavoritesBetweenIEAndMicrosoftEdge /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\Main" /v Use FormSuggest /t REG_SZ /d no /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\PhishingFilter" /v EnabledV9 /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\SearchScopes" /v ShowSearchSuggestionsGlobal /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v AllowTabPreloading /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\MicrosoftEdge\TabPreloader" /v PreventTabPreloading /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting" /v DoReport /t REG_DWORD /d 00000000 /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v DWNoExternalURL /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v DWNoFileCollection /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\PCHealth\ErrorReporting\DW" /v DWNoSecondLevelCollection /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\SQMClient\Windows" /v CEIPEnable /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\SearchCompanion" /v DisableContentFileUpdates /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" /v DisableNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v DisableRoutinelyTakingAction /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender" /v ServiceKeepAlive /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableBehaviorMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableIOAVProtection /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" /v DisableRealtimeMonitoring /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows Defender\Reporting" /v DisableEnhancedNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo /t REG_DWORD /v DisabledByGroupPolicy /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo" /v DisabledByGroupPolicy /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v AITEnable /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v DisableEngine /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v DisablePCA /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v DisableUAR /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v DisableWizard /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v SbEnable /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppCompat" /v VDMDisallowed /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsRunInBackground /t REG_DWORD /d 2 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CloudContent" /v DisableSoftLanding /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete" /v AutoSuggest /t REG_SZ /d no /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowDeviceNameInTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DataCollection" /v DoNotShowFeedbackNotifications /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\DeliveryOptimization" /v DODownloadMode /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoNewAppAlert /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Explorer" /v NoUseStoreOpenWith /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\GameDVR" /v AllowgameDVR /t REG_DWORD /D 0 /F
reg add "HKLM\Software\Policies\Microsoft\Windows\HandwritingErrorReports" /v PreventHandwritingErrorReports /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v NoLockScreenCamera /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSync /t REG_DWORD /d 2 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\SettingSync" /v DisableSettingSyncUserOverride /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /D 0 /F
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v EnableActivityFeed /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v EnableSmartScreen /t REG_DWORD /d 2 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v PublishUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\System" /v UploadUserActivities /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\TabletPC" /v PreventHandwritingDataSharing /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v AutoApproveOSDumps /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Error Reporting" /v DontSendAdditionalData /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCloudSearch /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowCortanaAboveLock /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AllowIndexingEncryptedStoresOrItems /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v AutoIndexSharedFolders /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchPrivacy /t REG_DWORD /d 3 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchSafeSearch /t REG_DWORD /d 3 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v ConnectedSearchUseWebOverMeteredConnections /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v DoNotUseWebResults /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v PreventIndexingEmailAttachments /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Windows Search" /v PreventIndexingOutlook /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f
reg add "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" /v AUOptions /t REG_DWORD /d 2 /f
reg add "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches\Thumbnail Cache" /v Autorun /t REG_DWORD /d 0 /f
reg add "HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableBootTrace /t REG_DWORD /d 0 /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v SfTracingState /t REG_DWORD /d 0 /f
reg delete "HKLM\Software\Policies\Microsoft\Windows\System" /v ShellSmartScreenLevel /f
schtasks /Change /TN "Microsoft\Windows\AppID\SmartScreenSpecific" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\AitAgent" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\ProgramDataUpdater" /Disable
schtasks /Change /TN "Microsoft\Windows\Application Experience\StartupAppTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Autochk\Proxy" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\HypervisorFlightingTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /Disable
schtasks /Change /TN "Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /Disable
schtasks /Change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /Disable
schtasks /Change /TN "Microsoft\Windows\FileHistory\File History (maintenance mode)" /Disable
schtasks /Change /TN "Microsoft\Windows\Maintenance\WinSAT" /Disable
schtasks /Change /TN "Microsoft\Windows\NetTrace\GatherNetworkInfo" /Disable
schtasks /Change /TN "Microsoft\Windows\PI\Sqm-Tasks" /Disable
schtasks /Change /TN "Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyMonitor" /Disable
schtasks /Change /TN "Microsoft\Windows\Shell\FamilySafetyRefresh" /Disable
schtasks /Change /TN "Microsoft\Windows\Windows Error Reporting\QueueReporting" /Disable
schtasks /change /TN "Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /Disable
sc stop DcpSvc
sc stop DiagTrack
sc stop WMPNetworkSvc
sc stop WerSvc
sc stop diagnosticshub.standardcollector.service
sc stop mwappushservice
sc stop "DoSvc" & sc config "DoSvc" start=disabled
sc stop dmwappushservice
sc config "DcpSvc" start=disabled
sc config DiagTrack start=disabled
sc config SysMain start= disabled
sc config WMPNetworkSvc start=disabled
sc config WerSvc start= disabled
sc config XblAuthManager start= disabled
sc config XblGameSave start= disabled
sc config XboxGipSvc start= disabled
sc config XboxNetApiSvc start= disabled
sc config diagnosticshub.standardcollector.service start=disabled
sc config dmwappushservice start=disabled
sc config xbgm start= disabled
sc start SysMain
powershell "Disable-MMAgent -MemoryCompression"
powershell "Disable-MMAgent -PageCombining"
sc stop SysMain
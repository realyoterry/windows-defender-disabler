@echo off

echo WARNING: This will revert the changes made Proceed? (Y/N)
set /p proceed=
if /i not "%proceed%"=="Y" (
    echo Operation cancelled
    exit /b
)

NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script has to run as an admin!
    pause
    exit /b
)

set Def=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
set Real=%Def%\Real-Time Protection
set Sig=%Def%\Signature Update
set Spy=%Def%\Spynet
reg delete "%Def%" /v DisableAntiSpyware /f
reg delete "%Def%" /v DisableAntiVirus /f
reg delete "%Def%" /v DisableSpecialRunningModes /f
reg delete "%Def%" /v DisableRoutinelyTakingAction /f
reg delete "%Def%" /v ServiceKeepAlive /f
reg delete "%Real%" /v DisableBehaviourMonitoring /f
reg delete "%Real%" /v DisableOnAccessProtection /f
reg delete "%Real%" /v DisableRealTimeMonitoring /f
reg delete "%Real%" /v DisableScanOnRealtimeEnable /f
reg delete "%Sig%" /v ForceUpdateFromMU /f
reg delete "%Spy%" /v DisableBlockAtFirstSeen /f
reg delete "%Real%" /f
reg delete "%Sig%" /f
reg delete "%Spy%" /f

echo Windows Defender is restored
pause

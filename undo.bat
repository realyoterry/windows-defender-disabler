@echo off

:: Confirm action
echo WARNING: This will revert the changes made to Windows Defender settings. Proceed? (Y/N)
set /p proceed=
if /i not "%proceed%"=="Y" (
    echo Operation canceled.
    exit /b
)

echo Reverting Windows Defender Settings...

:: Define registry paths
set DefenderPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
set RealTimePath=%DefenderPath%\Real-Time Protection
set SignaturePath=%DefenderPath%\Signature Update
set SpynetPath=%DefenderPath%\Spynet

:: Revert Defender Policies
reg delete "%DefenderPath%" /v DisableAntiSpyware /f
reg delete "%DefenderPath%" /v DisableAntiVirus /f
reg delete "%DefenderPath%" /v DisableSpecialRunningModes /f
reg delete "%DefenderPath%" /v DisableRoutinelyTakingAction /f
reg delete "%DefenderPath%" /v ServiceKeepAlive /f

:: Revert Real-Time Protection
reg delete "%RealTimePath%" /v DisableBehaviourMonitoring /f
reg delete "%RealTimePath%" /v DisableOnAccessProtection /f
reg delete "%RealTimePath%" /v DisableRealTimeMonitoring /f
reg delete "%RealTimePath%" /v DisableScanOnRealtimeEnable /f

:: Revert Signature Update
reg delete "%SignaturePath%" /v ForceUpdateFromMU /f

:: Revert Spynet
reg delete "%SpynetPath%" /v DisableBlockAtFirstSeen /f

:: Cleanup empty keys
reg delete "%RealTimePath%" /f
reg delete "%SignaturePath%" /f
reg delete "%SpynetPath%" /f

:: Notify user of completion
echo Windows Defender settings have been reverted to defaults.
pause

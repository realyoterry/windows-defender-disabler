@echo off
echo WARNING: This will disable Windows defender Proceed? (Y/N)
set /p proceed=
if /i not "%proceed%"=="Y" (
    echo Operation cancelled.
    exit /b
)

fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator!
    echo Right-click the .bat file and select "Run as administrator."
    pause
    exit /b
)

echo Setting paths to registry keys...
set DefenderPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
set RealTimePath=%DefenderPath%\Real-Time Protection
set SignaturePath=%DefenderPath%\Signature Update
set SpynetPath=%DefenderPath%\Spynet

reg add "%DefenderPath%" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
if errorlevel 1 echo Failed to disable AntiSpyware
reg add "%DefenderPath%" /v DisableAntiVirus /t REG_DWORD /d 1 /f
reg add "%RealTimePath%" /v DisableBehaviourMonitoring /t REG_DWORD /d 1 /f
reg add "%RealTimePath%" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "%RealTimePath%" /v DisableRealTimeMonitoring /t REG_DWORD /d 1 /f
reg add "%SignaturePath%" /v ForceUpdateFromMU /t REG_DWORD /d 1 /f
reg add "%SpynetPath%" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f

echo Windows Defender settings have been configured.
pause

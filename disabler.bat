@echo off
echo WARNING: This will disable Windows Defender. Proceed? (Y/N)
set /p proceed=
if /i not "%proceed%"=="Y" (
    echo Operation canceled.
    exit /b
)

:: Check for administrator privileges
fsutil dirty query %systemdrive% >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator!
    echo Right-click the .bat file and select "Run as administrator."
    pause
    exit /b
)

:: Make a variable with the path to the Windows Defender key.
echo Setting paths to registry keys...
set DefenderPath=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender
set RealTimePath=%DefenderPath%\Real-Time Protection
set SignaturePath=%DefenderPath%\Signature Update
set SpynetPath=%DefenderPath%\Spynet

:: Apply Defender Policies
reg add "%DefenderPath%" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
if errorlevel 1 echo Failed to disable AntiSpyware
reg add "%DefenderPath%" /v DisableAntiVirus /t REG_DWORD /d 1 /f

:: Real-Time Protection
reg add "%RealTimePath%" /v DisableBehaviourMonitoring /t REG_DWORD /d 1 /f
reg add "%RealTimePath%" /v DisableOnAccessProtection /t REG_DWORD /d 1 /f
reg add "%RealTimePath%" /v DisableRealTimeMonitoring /t REG_DWORD /d 1 /f

:: Signature Update
reg add "%SignaturePath%" /v ForceUpdateFromMU /t REG_DWORD /d 1 /f

:: Spynet
reg add "%SpynetPath%" /v DisableBlockAtFirstSeen /t REG_DWORD /d 1 /f

echo Windows Defender settings have been configured.
pause

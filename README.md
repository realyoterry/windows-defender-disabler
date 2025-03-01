# Windows Defender Disabler

Windows Batchfile Script to disable Windows Defender.

## What it does

`disabler.bat`

Disable Windows Defender.

1. Asks for confirmation
2. Check for admin privileges
3. Set path variables that are reused
4. Add 7 `DWORD` values to the specified path

---

`undo.bat`

For reverting Windows Defender Disabler.

1. Asks for confirmation
2. Check for admin privileges
3. Set path variables to the keys that were created
4. Delete all values and keys created

## Usage

Download the 2 batch files in the latest release. Alternatively, you can [download the repository zipped](https://github.com/realyoterry/windows-defender-disabler/archive/refs/heads/main.zip).

> [!IMPORTANT]  
> The file won't work if you run with normal permissions. Make sure to Run as Administrator!

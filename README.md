# Windows Defender Disabler

A simple BAT file that adds registry values to permanently disable Windows Defender.

> [!NOTE]
> If you believe this is unsafe, check the [disabler.bat](disabler.bat) and [undo.bat](undo.bat) files. It simply adds 32-bit DWORD entries to the registry to disable Windows Defender protection. All of the code is open-source, so no need to worry about security vulnerabilities.

## Steps for Usage

1. Download the `disabler.bat` file from the [Releases](https://github.com/realyoterry/windows-defender-disabler/releases) menu.

> [!NOTE]
> An alternative way to download the files is to click the green "Code" button, and select "Download ZIP".
  
2. Extract the zipped folder
3. Run the `bat` file with **administrative permisions.**

> [!IMPORTANT]  
> The file won't work if you run with normal permissions. Make sure to Run as Administrator!

4. Restart your computer, and boom! Windows Defender disabled in 4 simple steps.

## Reverting Changes

If you want to re-enable Windows Defender for any reason, simply download & run the [undo.bat](undo.bat) file as Administrator to undo the changes.

---

Thank you for using this tool!

@echo off
SETLOCAL EnableDelayedExpansion

REM --- Filename and Directory Variables ---
SET SUBDIR=anoypc
SET VBS_FILE=anoypc.vbs
SET ON_FILE=kaoson.bat
SET OFF_FILE=kaosoff.bat
SET DEL_FILE=kaosdel.bat
SET SHORTCUT_VBS=createshortcut.vbs
SET TASK_NAME=AnoyPC

REM -- Installation path set to universal %ProgramData%\anoypc --
SET TARGET_DIR="%ProgramData%\%SUBDIR%"
SET TASK_PATH="%TARGET_DIR%\%VBS_FILE%"
SET DESKTOP_PATH="%USERPROFILE%\Desktop"

ECHO.
ECHO =========================================================
ECHO Starting AnoyingPC installation. Administrator privileges required.
ECHO =========================================================
ECHO.

REM --- 0. Create Target Directory ---
ECHO Creating target directory %SUBDIR% in %ProgramData%...
mkdir "%TARGET_DIR%"
IF ERRORLEVEL 1 (
    ECHO ERROR: Could not create directory %SUBDIR%. Aborting installation.
    GOTO END
)
ECHO.

REM --- 1. Create VBScript File (11 English Error Messages) ---
ECHO Creating %VBS_FILE% in %SUBDIR% with 11 error messages...

REM --- Writing VBScript file line-by-line using > and >> for robustness ---
ECHO ' VBScript code to generate a fake error message > "%TARGET_DIR%\%VBS_FILE%"
ECHO Randomize >> "%TARGET_DIR%\%VBS_FILE%"
ECHO Dim arrMessages(10) >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(0) = "Error 0x80070005: Key Synchronization Failure. Contact Administrator." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(1) = "The 'Print Spooler' service stopped unexpectedly. The system will restart in 30 seconds. (No, it won't...)" >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(2) = "The integrity of the NTFS subsystem has been compromised. Run chkdsk /f /r?" >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(3) = "The Kernel Security Check failed due to a critical registry corruption. Contact support immediately." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(4) = "Unmountable Boot Volume: Windows detected a serious file system error on your primary drive (C:). Data integrity may be compromised." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(5) = "Error 0x000000ED: A required device is inaccessible. Please check your hardware connections and BIOS settings." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(6) = "Your license key validation service has expired. Perpetual reactivation required. (This is still a prank, don't worry)." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(7) = "The Windows Time Service is reporting an 8-day synchronization offset. All secure connections may fail." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(8) = "System resources are critically low. Memory paging file has reached maximum size. Close all non-essential applications." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(9) = "Digital Signature for the latest security update could not be verified. Your system is now running in 'Unsecured Mode'." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO arrMessages(10) = "Critical process 'WinLogon.exe' has failed. All user sessions must be terminated. (Click OK to continue the deception)." >> "%TARGET_DIR%\%VBS_FILE%"
ECHO Message = arrMessages(Int(11 * Rnd)) >> "%TARGET_DIR%\%VBS_FILE%"
ECHO x=MsgBox(Message, 16+0, "Critical System Error - [RANDOM CPU CODE]") >> "%TARGET_DIR%\%VBS_FILE%"


REM --- 2. Create Activation File (kaoson.bat) ---
ECHO Creating %ON_FILE% in %SUBDIR%...
(
    ECHO @echo off
    ECHO ECHO Enabling the %TASK_NAME% Service.
    ECHO schtasks /Change /TN "%TASK_NAME%" /ENABLE
    ECHO ECHO Chaos Status: ON.
    ECHO TIMEOUT /T 3 /NOBREAK ^> NUL
) > "%TARGET_DIR%\%ON_FILE%"

REM --- 3. Create Deactivation File (kaosoff.bat) ---
ECHO Creating %OFF_FILE% in %SUBDIR%...
(
    ECHO @echo off
    ECHO ECHO Disabling the %TASK_NAME% Service.
    ECHO schtasks /Change /TN "%TASK_NAME%" /DISABLE
    ECHO ECHO Chaos Status: OFF. Silence restored.
    ECHO TIMEOUT /T 3 /NOBREAK ^> NUL
) > "%TARGET_DIR%\%OFF_FILE%"

REM --- 4. Create Deletion File (kaosdel.bat) ---
ECHO Creating Deletion File (kaosdel.bat)...
(
    ECHO @echo off
    ECHO ECHO Removing Scheduled Task "%TASK_NAME%"...
    ECHO schtasks /Delete /TN "%TASK_NAME%" /F
    ECHO ECHO Deleting AnoyPC directory and files...
    ECHO RD /S /Q "%TARGET_DIR%"
    ECHO ECHO AnoyPC fully removed. Order restored.
    ECHO TIMEOUT /T 3 /NOBREAK ^> NUL
) > "%TARGET_DIR%\%DEL_FILE%"

REM --- 5. Create and Schedule the Task ---
ECHO.
ECHO Configuring Scheduled Task "%TASK_NAME%" to run: %TASK_PATH%...
REM TR: Task Run / SC: Schedule (MINUTE) / MO: Modifier (5) / RU: Run Under SYSTEM / F: Force overwrite
schtasks /create /TN "%TASK_NAME%" /TR %TASK_PATH% /SC MINUTE /MO 5 /RU SYSTEM /F

REM --- 6. Enable the Prank ---
ECHO Enabling the Prank...
schtasks /Change /TN "%TASK_NAME%" /ENABLE


REM --- 7. Create and Execute Shortcut VBScript (FINAL FIX - Self-Cleaning) ---
ECHO.
ECHO Creating Desktop Shortcut for Control Folder...

REM Temporary variables to strip quotes from paths for correct VBScript syntax
SET "_TARGET_DIR_NO_Q=%TARGET_DIR:"=%"
SET "_DESKTOP_PATH_NO_Q=%DESKTOP_PATH:"=%"

REM Create VBScript file that generates the shortcut
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") > "%TARGET_DIR%\%SHORTCUT_VBS%"
ECHO Set Shortcut = WshShell.CreateShortcut("%_DESKTOP_PATH_NO_Q%\AnoyPC Control.lnk") >> "%TARGET_DIR%\%SHORTCUT_VBS%"
ECHO Shortcut.TargetPath = "%_TARGET_DIR_NO_Q%" >> "%TARGET_DIR%\%SHORTCUT_VBS%"
ECHO Shortcut.Description = "AnoyPC Prank Control Folder" >> "%TARGET_DIR%\%SHORTCUT_VBS%"
ECHO Shortcut.IconLocation = "shell32.dll,3" >> "%TARGET_DIR%\%SHORTCUT_VBS%"
ECHO Shortcut.Save >> "%TARGET_DIR%\%SHORTCUT_VBS%"

REM Execute the VBScript to create the shortcut
wscript "%TARGET_DIR%\%SHORTCUT_VBS%" //B //NOLOGO

REM *** NEW STEP: Delete the temporary VBScript file ***
ECHO Deleting temporary shortcut script...
DEL "%TARGET_DIR%\%SHORTCUT_VBS%"


ECHO.
ECHO =========================================================
ECHO INSTALLATION COMPLETE! Files are in the %SUBDIR% folder.
ECHO Chaos will be enabled every 5 minutes.
ECHO A Desktop Shortcut 'AnoyPC Control' was created for easy access.
ECHO To turn it OFF TEMPORARILY, run %SUBDIR%\%OFF_FILE% as administrator.
ECHO To REMOVE COMPLETELY, run %SUBDIR%\%DEL_FILE% as administrator.
ECHO Made by ticosoft
ECHO =========================================================

:END
ECHO.
PAUSE

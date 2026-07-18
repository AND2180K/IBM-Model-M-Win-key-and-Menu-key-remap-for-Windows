@echo off
title IBM Model M Remap for Windows

:MENU
cls
echo.
echo  =======================================================
echo   ___ ____  __  __   __  __           _      _   __  __ 
echo  ^|_ _^| __ ^)^|  \/  ^| ^|  \/  ^| ___   __^| ^| ___^| ^| ^|  \/  ^|
echo   ^| ^|^|  _ \^| ^|\/^| ^| ^| ^|\/^| ^|/ _ \ / _` ^|/ _ \ ^| ^| ^|\/^| ^|
echo   ^| ^|^| ^|_^) ^| ^|  ^| ^| ^| ^|  ^| ^| ^(_^) ^| ^(_^| ^|  __/ ^| ^| ^|  ^| ^|
echo  ^|___^|____/^|_^|  ^|_^| ^|_^|  ^|_^|\___/ \__,_^|\___^|_^| ^|_^|  ^|_^|
echo.
echo  =======================================================
echo.
echo  v1.0
echo.
echo   Remap
echo   ---------------
echo   RAlt  -^> LWin
echo   RCtrl -^> Menu
echo   ---------------
echo   Reboot required
echo.
echo  [1] INSTALL REMAP
echo  [2] RESTORE DEFAULTS
echo  [3] README
echo  [0] EXIT
echo.

set /p CHOICE=Select option: 

if "%CHOICE%"=="1" goto INSTALL
if "%CHOICE%"=="2" goto REMOVE
if "%CHOICE%"=="3" goto README
if "%CHOICE%"=="0" goto EXIT

echo.
echo Invalid selection.
pause
goto MENU


:INSTALL
cls
echo.
echo INSTALLING KEYBOARD REMAP...
echo.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" ^
/v "Scancode Map" /t REG_BINARY ^
/d 0000000000000000030000005CE038E05DE01DE000000000 /f
echo Reboot is required for changes to take effect.
echo.
pause
goto MENU


:REMOVE
cls
echo.
echo RESTORING DEFAULT KEYBOARD MAP...
echo.
reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Keyboard Layout" ^
/v "Scancode Map" /f
echo Reboot is required for changes to take effect.
echo.
pause
goto MENU


:README
cls
echo.
echo  =======================================
echo   ____  _____    _    ____  __  __ _____ 
echo  ^|  _ \^| ____^|  / \  ^|  _ \^|  \/  ^| ____
echo  ^| ^|_) ^|  _^|   / _ \ ^| ^| ^| ^| ^|\/^| ^|  _^|
echo  ^|  _ ^<^| ^|___ / ___ \^| ^|_^| ^| ^|  ^| ^| ^|___
echo  ^|_^| \_\_____/_/   \_\____/^|_^|  ^|_^|_____
echo.
echo  =======================================
echo.
echo  IBM Model M Remap For Windows v1.0
echo.
echo  Originally designed for the
echo  IBM Enhanced Keyboard but can be useful
echo  for other keyboards.
echo.
echo  This installer remaps
echo.
echo   Right Alt  -^> Right Windows Key
echo   Right Ctrl -^> Context Menu Key
echo.
echo  to improve usability of the IBM Model M
echo  under Microsoft Windows.
echo.
echo  Compatible with Windows 2000 and up.
echo.
echo  Reboot is required after installing or
echo  removing remap.
echo.
pause
goto MENU


:EXIT
exit
@echo off

echo Welcome to GSI Flash Tool by FeDeveloper95 - https://github.com/FeDeveloper95
pause

:inizio

echo.
echo Choose the current state of the device:
echo   1. Booted in Android
echo   2. Recovery
echo   3. Bootloader
echo   4. Fastboot
echo   5. Magisk
echo   6. Quit
set /p "scelta=Input: "

rem Esci se l'utente sceglie 5
if "%scelta%"=="6" exit /b 0

rem Esegui l'azione in base alla scelta dell'utente
if "%scelta%"=="5" goto magisk
if "%scelta%"=="4" goto fastboot
if "%scelta%"=="3" goto bootloader
if "%scelta%"=="2" goto recovery
if "%scelta%"=="1" goto avviato
goto inizio  

:avviato
rem Riavvia in fastboot se il dispositivo è avviato normalmente
adb reboot fastboot
goto flashing

:recovery
rem Riavvia in fastboot se il dispositivo è in recovery
adb reboot fastboot
goto flashing

:bootloader
rem Riavvia in fastboot se il dispositivo è in bootloader
fastboot reboot fastboot
goto flashing

:fastboot
rem Non riavviare se il dispositivo è già in fastboot
goto flashing

:magisk
adb sideload magisk.zip
goto inizio

:flashing
rem Esegui le operazioni di flashing
fastboot erase userdata
fastboot erase metadata
fastboot delete-logical-partition product_b
fastboot delete-logical-partition product
fastboot delete-logical-partition product_a
fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img
fastboot flash vbmeta vbmeta.img
fastboot flash system system.img
fastboot flash recovery recovery.img
fastboot erase userdata
fastboot erase metadata
fastboot reboot

echo Flashed!

rem Done

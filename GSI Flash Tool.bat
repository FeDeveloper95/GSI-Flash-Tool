@echo off

rem Verifica che adb sia installato
where adb >nul 2>&1 || (
  echo "adb non è installato. Installalo prima di eseguire questo script."
  exit /b 1
)

rem Riavvia il dispositivo in modalità recovery
color a && fastboot reboot fastboot && fastboot erase userdata && fastboot erase metadata && fastboot delete-logical-partition product_b && fastboot delete-logical-partition product && fastboot delete-logical-partition product_a && fastboot --disable-verity --disable-verification flash vbmeta vbmeta.img && fastboot flash vbmeta vbmeta.img && fastboot flash system system.img && fastboot flash recovery recovery.img && fastboot erase userdata && fastboot erase metadata && fastboot reboot

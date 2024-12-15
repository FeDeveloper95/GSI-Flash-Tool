This batch script simplifies the process of flashing a Generic System Image (GSI) on your Android device.

-If the device is in AndroidOS or Recovery, it reboots the device into fastboot mode using **adb reboot bootloader**.
-If the device is in Bootloader mode, it reboots into fastboot mode using **fastboot reboot fastboot**.
-If the device is already in Fastboot mode, it proceeds directly to the flashing process.

*The flashing process*:
Erases necessary partitions using **fastboot erase**.
Flashes the vbmeta image with verity and verification disabled.
Flashes the system image.
Flashes the recovery image.
Reboots the device.

**Requirements**:

Android device with an **unlocked** bootloader
**ADB and Fastboot tools** installed and configured on your computer
Necessary GSI **image files** (vbmeta.img, system.img, recovery.img) in the same directory as the script.

Tested on: 
   - OnePlus Nord CE 5G (*ebba*) using AOSP 15 GSI by Ponces

Disclaimer:

This script is provided as-is, without any warranty. Use it at your own risk. Make sure you have a backup of your device before flashing a GSI.

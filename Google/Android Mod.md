# Android Mod

## Ecosystem

* [Complete Guide to Flashing](https://android.gadgethacks.com/how-to/complete-guide-flashing-factory-images-android-using-fastboot-0175277/)
* [Magisk](https://magisk.me/) = Systemless rooting
* [TWRP](https://twrp.me/) (aka TeamWin Recovery Project) = custom recovery tool (boot menu, Nandroid Backup, ROM flashing in _zip_ format)
  * [How to install](https://www.xda-developers.com/how-to-install-twrp/)
  * [Here's why the Stock recovery appears even after TWRP was flashed](https://android.stackexchange.com/a/167039)
    * Solution is to enter Recovery mode from the bootloader directly after flashing TWRP without rebooting
* NANDroid Backup = 1 to 1 perfect copy of system and apps (not personal data e.g. music, photos, etc.)
* [Universal ADB Drivers](https://adb.clockworkmod.com/)
* [migroG](https://microg.org/) = Google Mobile Services open alternative
* [Open GApps](https://opengapps.org/?api=7.1&variant=nano) = Google apps open alternative
  * Several variants are available (e.g. pico is a light version while stock is full)
* MindTheGapps = Google apps open alternative
* Stores
  * [F-Droid](https://f-droid.org) = Google Play open alternative
  * [Aurora Store](https://aurora-store.en.uptodown.com/android) = Google Play open alternative
  * [APKPure](https://apkpure.com/)
* [CyanogenMod](https://cyanogenmodroms.com/) = Android OS
* [GrapheneOS](https://grapheneos.org/) = Android OS for Google Pixel phones
* [LineageOS](https://lineageos.org/) = Android OS forked from CyanogenMod
  * [Google apps on LineageOS](https://wiki.lineageos.org/gapps.html)
  * [How to Google apps on LineageOS](https://askinglot.com/how-do-i-install-google-apps-on-lineage-os)
* [/e/ Foundation](https://e.foundation/)
  * /e/ ROM = fork of Android OS (in particular LineageOS), packed with migroG
  * [Find Apps](https://doc.e.foundation/apps#do-the-phones-with-eos--support-fingerprint-banking-apps-and-android-auto)
  * [Request App](https://doc.e.foundation/apps#what-should-you-do--if-you-dont-find-an-app-you-would-like-to-use-in-the-e-app--installer)
  * <https://www.reddit.com/r/degoogle/comments/gepao6/stock_android_vs_lineageos_with_google_service/>
* MIUI = Android ROM developed by Xiaomi for its smartphones
* [Heimdall](https://www.glassechidna.com.au/heimdall/) = cross-platform open-source tool suite to flash firmware (ROMs) onto Samsung devices

## Rooting Guide

### /e/ With TWRP

1. Download appropriate TWRP recovery image, **run a checksum**, and place it in the same folder as platform-tools
2. Download appropriate /e/ OS ROM image, **run a checksum to make sure it is complete**
3. Both Developer Mode & USB Debugging must be enabled on the device (by tapping _Build number_ seven times in _About Phone_)
4. ADB Drivers must first be installed for the PC to recognize the phone, for instance [Universal ADB Drivers](https://adb.clockworkmod.com/). Restart the computer afterwards.
4a. For Samsung phones, try installing the [Samsung Android ADB Interface Driver](https://rootmygalaxy.net/download-usb-drivers-for-all-android-devices/) manually via Device Manager
4b. To install a driver manually, select the problematic device in the Manager and choose _Update Driver Software..._ > _Browse my computer..._ > _Let me pick ..._ > _Show All Devices_ > _Have Disk_
4c. Check <https://support.hidemyass.com/hc/en-us/articles/202723596-How-to-disable-Driver-Signing-check-on-Windows> in case the drivers require signing
4d. Manual install for [Samsung Galaxy Nexus](https://forum.xda-developers.com/galaxy-nexus/general/howto-install-google-sdk-adb-drivers-t1830108)
5. The phone should now be recognized in Windows Device Manager (note: under a different name whether turned on or off)
6. Install **Android SDK Platform Tools** to get `adb` & `fastboot` exes, and unzip those for instance onto `C:`
7. Try running  the `adb devices` command to list the devices - should be _{serial} (device|unauthorized)_ (both results are ok)
8. Boot into fastboot mode by typing `adb reboot bootloader` (and accepting any authorization notification on the device)
9. While in fastboot mode, try running `fastboot devices`
10. Unlock the bootloader by typing `fastboot oem unlock`. This prepares the device for image install, and **it will erase all remaining data on the device**
11. Reboot the device if it didn't reboot automatically (`fastboot reboot`). Note: this might take several minutes
12. Re-enable USB Debugging since the device was just reset
13. Run `adb reboot bootloader` and `fastboot devices` again
14. Run `fastboot flash recovery twrp.img` (note: the command is `fastboot flash boot` or `fastboot boot` on some devices)
15. Run `fastboot reboot` then `adb reboot recovery` to enter the (now TWRP) recovery mode.
15b. If the stock recovery appears at this stage instead of the just flashed TWRP, skip the reboot instead and head straight into Recovery mode from the bootloader menu
16. In TWRP, return to main menu, then tap `Wipe`, then tap `Format Data` and confirm
17. Go back to previous menu and tap `Advanced Wipe`. Select the Cache and System partitions to be wiped, then `Swipe to Wipe`
18. It's now time to _sideload_ the new OS. One action is required on the device itself (in TWRP), the other on the PC
19. Note: This process may stop abruptly at 50% and display _Total xfer: 1.00x_; this is **OK** and means it has successfully completed
20. In TWRP, select `Advanced` > `ADB Sideload`, then swipe to begin
21. On the PC, type `adb sideload package.zip`
22. Once installation is finished, return to main menu, tap `Reboot` and then `System`
23. **Warning: only do the following it a Stock OS image is installed**: Lock the bootloader again by typing `fastboot oem lock`

### Restoring Stock Image (without TWRP)

The .zip package containing the root _bat_ files, stock ROM & _bootloader & radio_ images must first be unzipped manually.
Move that content right into the _platform-tools_ folder that contains **adb** & **fastboot** exes, at the same level as those.

Finally, reboot the device into bootloader (`adb reboot bootloader`), make sure fastboot sees it (`fastboot devices`), then simply run _flash-all.bat_ which will sequentially flash all the stock images onto the devices, starting with the stock bootloader.

* <https://www.droidwin.com/uninstall-twrp-restore-stock-recovery-android/>
* <https://doc.e.foundation/pages/revert_samsung_to_stock_on_windows>
* [Samsung Galaxy Nexus images](https://developers.google.com/android/images#yakju)
* [LG Nexus 5 images](https://developers.google.com/android/images#hammerhead)
* [How to Boot into Recovery Mode on NOKIA 1 Plus](https://www.youtube.com/watch?v=KJzetyZ17Xg)

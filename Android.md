# Android

## Versions

| Name        | Major | Original |
| ----        | ----- | -------- |
| Gingerbread | 2.3   | 7        |
| Honeycomb   | 3.2   | 8        |
| ICS         | 4     | 9        |
| Jelly Bean  | 4.1   | 10       |
| Jelly Bean  | 4.2   | 10       |
| Jelly Bean  | 4.3   | 10       |
| Jelly Bean  | 4.3.1 | 10       |
| KitKat      | 4.4   | 11       |
| Lollipop    | 5     | 12       |
| Marshmallow | 6     | 13       |
| Nougat      | 7     | 14       |
| Oreo        | 8     | 15       |
| Pie         | 9     | 16       |
| Q           | 10    | 17       |
| Android 11  | 11    | 18       |
| Android 12  | 12    | 19       |

## [Partitions](https://source.android.com/devices/bootloader/partitions)

* `/boot` = kernel & ramdisk
* `/system` = entire OS outside of kernel
* `/recovery` = recovery
* `/data` (aka userdata) = contacts, messages, settings, apps. Wiping this equals a factory reset.
* `/cache` = frequently accessed data & app components (à la Temp folder)
* `/misc` = important partition - don't remove
* `/radio` = dedicated partition for radio-specific software
* `/vendor` = device-specific drivers for controlling GPS, gyro, proximity & co

## (Stock) Package Structure

This _.zip_ package must first be opened (e.g. in the _platform-tools_ folder) to access the individual ROM & images.

* `{product_name}-{build}.zip`
  * `bootloader-{product_name}-{build}.img`
  * `flash-all.bat`
  * `image-{product_name}-{build}.zip` = stock ROM
    * `boot.img`
    * `cache.img`
    * `recovery.img` = stock recovery
    * `system.img` = OS image
    * `userdata.img`
  * `radio-{product_name}-{build}-{version}.img`

Note that custom ROMs only include the system image.

## Glossary

* [AOSP](https://source.android.com/) = Android Open Source Project
* GMS (aka Google Mobile Services) = Google **Proprietary** APIs, not part of AOSP
* Google apps = stock Google branded apps (Play Store, Gmail, Maps, etc.)
* Google Play (aka Google Play Store aka Android Market) = App Store
* [Rooting, Bootloader, Recovery](https://android.stackexchange.com/a/117593)
  * [Bootloader](https://source.android.com/devices/bootloader/) = basically the BIOS (+ MBR)
    * Low-level interface used to flash images on a partition via `fastboot` commands
    * Responsible for bringing up the kernel, or launches recovery mode, etc.
    * Responsible for the base layer of security (prevents _system_ change), and unlocking the bootloader erases all previous data
  * Recovery = Side menu that can be started from bootloader for disk/partition management (wipe/format)
    * Enter recovery mode by first entering the bootloader, selecting _Recovery mode_
    * [How to enter it](https://www.reddit.com/r/Nexus5/comments/2akpco/rooted_nexus_5_but_cant_boot_into_recovery/)
    * Pre-menu of stock recovery mode looks like a lying Android logo with a **red triangle and exclamation mark**
      * From there, hold Power and pressing Volume Up **once**
* [Android Studio](https://developer.android.com/studio/) = full Android development SDK, for building apps on Android devices
  * includes Android SDK Platform Tools
* Architecture/Platform = _arm_ or _arm64_ (less commonly _x86_ or _x86\_64_) - see [Open GApps](https://opengapps.org/)
* OTA Updates = Over-the-air updates, the upgrades to the current OS
* Sideloading = installing an image onto the phone directly from a file located on the PC
* Image = _.img_ file, part of the OS, to be flashed (installed) to the partition matching its name on the device
* Vendor image = image containing device-specific drivers for controlling GPS, gyro, proximity & co
* ROM (aka Firmware) = basically the OS installed on the device, in its read-only memory. It is a bit ambiguous whether this refers to all images (most likely), or just the _system_ one
* Stock ROM = orginal factory OEM ROM
* Custom ROM = ROM not emitted by OEM. Usually contains but a subset of all images (i.e. most importantly a _system_ image), and reuse pre-existing (e.g. stock) images for non-system partitions
* OEM = the company that constructed the original component, sold to the end users by another company
* apk = file containing an app
  * [How to install apk files from a PC](https://www.wikihow.com/Install-APK-Files-from-a-PC-on-Android)
* SafetyNet = feature by which an App required higher security (e.g. banking) can enforce the device is trustworthy
  * I.e. checks the device is not rooted & bootloader is locked
  * Circumventable via microG DroidGuard Helper
* [Rooting](https://www.androidcentral.com/root)
  * Systemless Rooting = lighter rooting that does not require modifying system or boot partition

### [Android SDK Platform Tools](https://developer.android.com/studio/releases/platform-tools) (contains ADB, fastboot, systrace)

* In device manager, phones appear with different names depending on device power status
  * Powered-on phone appears as _Galaxy Nexus_
  * Powered-off phone appears as _Android 1.0_
* [How to install ADB and fastboot](https://doc.e.foundation/pages/install-adb-windows)
  * Developer mode must be enabled on the device (by clicking build number 7 times), as well as USB Debugging in developer settings
* [ADB](https://developer.android.com/studio/command-line/adb) (aka Android Debug Bridge) = CLI to interact with a (**powered-on**) device
  * `adb devices` = display connected devices IDs
  * `adb reboot bootloader` = reboot into the bootloader (alternatively, (re)starting the device while holding Volume Down, then Power)
  * `adb reboot recovery` = reboot into the recovery (alternatively, starting while holding Volume Down, then Power until a menu, then select _RECOVERY_)
  * `adb sideload`
* [Fastboot](http://adbcommand.com/fastboot) = interact with the bootloader (of a **powered-off** device)
  * `fastboot devices [-l]` = display current devices (option: with device paths).
  * `fastboot oem unlock` = unlock bootloader (**warning: this erases all previous data**)
  * `fastboot reboot` = reboot into the OS
  * `fastboot reboot-bootloader` = reboot into the bootloader
  * `fastboot reboot-recovery` = reboot into the recovery mode (warning: may not work, worse: replace TWRP with the Stock recovery)
  * `fastboot flash [boot|bootloader|radio|recovery|sytem|vendor]` = flash specific image into device partition
    * boot = kernel
    * bootloader = partition management & flash
    * radio = wifi & connectivity
    * recovery = stock or TWRP
    * system = the actual Android system
    * vendor = for newer phones
  * `fastboot update`
  * `fastboot oem lock` = lock bootloader (**Warning: only lock the bootloader when a Stock OS image is installed, as the last step**)
  * [Flashboot Stock to unbrick](https://www.droidwin.com/flash-stock-firmware-via-fastboot-commands/)
* Stock ROM contains `flash-all.bat`, which includes the following commands to automate reinstalling stock Android:
  * `fastboot flash bootloader bootloader-maguro-primemd04.img` = install stock bootloader
  * `fastboot reboot-bootloader` = restart into stock bootloader
  * `fastboot flash radio radio-maguro-i9250xxlj1.img` = install connectivity image (Wi-Fi, mobile data, etc.)
  * `fastboot reboot-bootloader` = restart again
  * `fastboot -w update image-takju-jwr66y.zip` = flash all partitions contained in the _.zip_ file
    * `-w` = Wipe userdata
* Note: Samsung devices come with a unique boot mode called _Download Mode_, very similar to Fastboot mode.
* Heimdall us a cross-platform tool for interacting with Download mode on Samsung devices.
* Odin is a utility used by Samsung to reset (or flash) their smartphones

### Modding Ecosystem

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
* [/e/ Foundation](https://e.foundation/) = Android OS, packed with migroG
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

The .zip package containing the _bat_ files, stock ROM & _bootloader & radio_ images must first be opened manually (into the _platform-tools_ folder).

* <https://www.droidwin.com/uninstall-twrp-restore-stock-recovery-android/>
* <https://doc.e.foundation/pages/revert_samsung_to_stock_on_windows>
* [Samsung Galaxy Nexus images](https://developers.google.com/android/images#yakju)
* [LG Nexus 5 images](https://developers.google.com/android/images#hammerhead)

# Android

## Environment

### Glossary

* [Activities](https://developer.android.com/guide/components/activities/intro-activities) = one app entry point, defined in _AndroidManifest.xml_
* [Android SDK Platform Tools](https://developer.android.com/tools/releases/platform-tools) = primarily **adb** & **fastboot** exe (see dedicated section below)
  * Can be installed via Android Studio's SDK Manager (default path `C:\Users\Kalex\AppData\Local\Android\Sdk\platform-tools`)
* [Android Studio](https://developer.android.com/studio/) = full Android development SDK, for building apps on Android devices
  * includes **Android SDK Platform Tools** (which are also available as standalone tools)
* Architecture/Platform = _arm_ or _arm64_ (less commonly _x86_ or _x86\_64_) - see [Open GApps](https://opengapps.org/)
  * [ARM](https://www.androidcentral.com/what-arm-cpu) (Acorn RISC Machine) = English company selling low-power processor architecture used in mobiles
* [AOSP](https://source.android.com/) = Android Open Source Project
* apk = file containing an app
  * [How to install apk files from a PC](https://www.wikihow.com/Install-APK-Files-from-a-PC-on-Android)
* GMS (aka Google Mobile Services) = Google **Proprietary** APIs, not part of AOSP
* Google apps = stock Google branded apps (Play Store, Gmail, Maps, etc.)
* Google Play (aka Google Play Store aka Android Market) = App Store
* Image = _.img_ file, part of the OS, to be flashed (installed) to the partition matching its name on the device
* OEM = the company that constructed the original component, sold to the end users by another company
* OTA Updates = Over-the-air updates, the upgrades to the current OS
* ROM (aka Firmware) = basically the OS installed on the device, in its read-only memory. It is a bit ambiguous whether this refers to all images (most likely), or just the _system_ one
  * Stock ROM = orginal factory OEM ROM
  * Custom ROM = ROM not emitted by OEM. Usually contains but a subset of all images (i.e. most importantly a _system_ image), and reuse pre-existing (e.g. stock) images for non-system partitions
* [Rooting](https://www.androidcentral.com/root)
  * Systemless Rooting = lighter rooting that does not require modifying system or boot partition
* [Rooting, Bootloader, Recovery](https://android.stackexchange.com/a/117593)
  * [Bootloader](https://source.android.com/devices/bootloader/) = basically the BIOS (+ MBR)
    * Low-level interface used to flash images on a partition via `fastboot` commands
    * Responsible for bringing up the kernel, or launches recovery mode, etc.
    * Responsible for the base layer of security (prevents _system_ change), and unlocking the bootloader erases all previous data
  * Recovery = side menu that can be started from bootloader for disk/partition management (wipe/format)
    * Enter recovery mode by first entering the bootloader, selecting _Recovery mode_
    * [How to enter it](https://www.reddit.com/r/Nexus5/comments/2akpco/rooted_nexus_5_but_cant_boot_into_recovery/)
    * Pre-menu of stock recovery mode looks like a lying Android logo with a **red triangle and exclamation mark**
      * From there, hold Power and pressing Volume Up **once**
* SafetyNet = feature by which an App required higher security (e.g. banking) can enforce the device is trustworthy
  * I.e. checks the device is not rooted & bootloader is locked
  * Circumventable via microG DroidGuard Helper
* Sideloading = installing an image onto the phone directly from a file located on the PC
* Vendor image = image containing device-specific drivers for controlling GPS, gyro, proximity & co

### Versions

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

### [Partitions](https://source.android.com/devices/bootloader/partitions)

* `/boot` = kernel & ramdisk
* `/system` = entire OS outside of kernel
* `/recovery` = recovery
* `/data` (aka userdata) = contacts, messages, settings, apps. Wiping this equals a factory reset.
* `/cache` = frequently accessed data & app components (à la Temp folder)
* `/misc` = important partition - don't remove
* `/radio` = dedicated partition for radio-specific software
* `/vendor` = device-specific drivers for controlling GPS, gyro, proximity & co

### (Stock) Package Structure

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

### [Android SDK Platform Tools](https://developer.android.com/studio/releases/platform-tools) (contains ADB, fastboot, systrace)

* In device manager, phones appear with different names depending on device power & (USB debugging session) autorization status
  * Powered-on & authorized phone appears as _Galaxy Nexus_
  * Powered-off or connection not yet accepted (on the device) phone appears as _Android 1.0_
* [How to install ADB and fastboot](https://doc.e.foundation/pages/install-adb-windows)
  * Developer mode must be enabled on the device (by clicking build number 7 times), as well as USB Debugging in developer settings
* [ADB](https://developer.android.com/studio/command-line/adb) (aka Android Debug Bridge) = CLI to interact with a (**powered-on**) device
  * `adb devices [-l]` = display connected devices IDs (option: with device information)
  * `adb reboot bootloader` = reboot into the bootloader (alternatively, (re)starting the device while holding Volume Down, then Power)
  * `adb reboot recovery` = reboot into the recovery (alternatively, starting while holding Volume Down, then Power until a menu, then select _RECOVERY_)
  * `adb sideload`
* [Fastboot](http://adbcommand.com/fastboot) = interact with the bootloader (of a **powered-off** device)
  * `fastboot devices [-l]` = display current devices (option: with device information)
  * `fastboot oem unlock` = unlocks the bootloader (**warning: this erases all previous data**), which enables installing a new (custom) OS
    * The _LOCK STATE_ is displayed on the bootloader (lying Android robot) screen
  * `fastboot oem lock` = lock bootloader (**Warning: only lock the bootloader when a Stock OS image is installed, as the last step**)
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
  * `fastboot -w update` = wipes the device's data, flash & install new firmware
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

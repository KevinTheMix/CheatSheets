# Android

## Quick Tips

* [Rooting, Bootloader, Recovery](https://android.stackexchange.com/a/117593)
* URLs can be configured to be opened via designated apps (instead of the browser by default)
* Android guarantees forward compatibility at framework level: an app can be compiled in Android 15 (**compileSdkVersion**) and run on Android 13 (**minSdkVersion**) as long as newer APIs are guarded/unused
  * compileSdkVersion = Android API level used to build the app (determines which framework APIs can be used in code)
  * minSdkVersion = lowest Android version the app can run on (controls install compatibility)
  * targetSdkVersion = behavior, security, & permissions rules

## Glossary

* _.aab_ (Android App Bundle) = device-agnostic distribution (but not installation) package format containing compiled code & resources
  * Used by Play Stores to eventually generate/distribute (smaller) optimized device-specific APK files (not itself executable)
* _.apk_ (Android Package Kit) = app installation file as a compressed ZIP archive (its content can be un-zipped) containing compiled code, resources & manifest (& signature if signed)
  * Can be ABI/CPU/device-specific (as in `flutter run --release` or when downloaded from app store) or universal (Codemagic with multiple ABIs)
* [Activities](https://developer.android.com/guide/components/activities/intro-activities) = one app's entry point, declared/defined in _AndroidManifest.xml_
* **Android** = open-source OS based on Linux, supported by many different manufacturer's devices
* **Android SDK** = can be installed via Android Studio's SDK Manager (at `%USERPROFILE%\AppData\Local\Android\Sdk`)
  * [Platform Tools](https://developer.android.com/tools/releases/platform-tools) = primarily **adb** & **fastboot** exe (see section below)
* [Android Studio](https://developer.android.com/studio) = full Android development SDK, for building apps on Android devices
  * Includes **Android SDK Platform Tools** (which are also available as standalone tools)
* **ABI** (Application Binary Interface) = low-level interface to a specific CPU architecture
* [ARM](https://www.androidcentral.com/what-arm-cpu) (Acorn RISC Machine) = English company selling low-power processor architecture used in mobiles
  * By extension, an architecture (instructions set) for low-power scalable CPUs used in mobile devices (**ARM Code** is basically a name for (mobile native) machine code)
  * Architecture/Platform = _arm_ or _arm64_ (less commonly _x86_ or _x86\_64_) - see [Open GApps](https://opengapps.org)
* [AOSP](https://source.android.com) = Android Open Source Project
* [Bootloader](https://source.android.com/devices/bootloader) = basically a BIOS & MBR (vendor-proprietary image), which brings up the kernel, launching recovery mode, etc
  * Low-level interface used to flash images on a partition via `fastboot` commands
  * Responsible for the base layer of security (prevents _system_ change), as unlocking the bootloader erases all previous data
* **GApps** = Google apps
* **GMS** (Google Mobile Services) = Google **Proprietary** apps & APIs, not part of AOSP (eg _Google Play_, _Gmail_, _Google Maps_, …)
* **Google Play (Store)** = app store
* **Google Play Services** = Google background services & libraries for use by mobile apps for gaming, geofencing, SSO, maps, ads, pay, analytics
* **Image** = _.img_ file, part of the OS, to be flashed (installed) to the partition matching its name on the device
* **IMEI** (International Mobile Equipment Identity) = uniquely identifies a hardware mobile device (actually one per fixed SIM card slot)
* **IMSI** (International Mobile Subscriber Identity) = uniquely identifies a mobile network subscriber/SIM card (stored in SIM card itself)
* **Intent** = message object for inter-components communication, a passive data structure holding abstract description of an action (ie an activity) to perform (ie start) that supports that intent's message type
  * Actions/activities can be requested from other apps/system components (ie jumping between applications eg maps, payment, open a webpage, send an email, dial, search)
* **OEM** (Original Equipment Manufacturer) = a company that constructed an original component sold to end users by another company
* **OHA** (Open Handset Alliance) = consortium (eg HTC, Sony, Dell, Motorola, Samgsung, LG) led by Google that develops Android
* **OTA Updates** = Over-the-air updates, the upgrades to the current OS
* **ROM** (aka Firmware) = basically the OS installed on the device, in its read-only memory. It is a bit ambiguous whether this refers to all images (most likely), or just the _system_ one
  * Stock ROM = orginal factory OEM ROM
  * Custom ROM = ROM not emitted by OEM. Usually contains but a subset of all images (i.e. most importantly a _system_ image), and reuse pre-existing (e.g. stock) images for non-system partitions
* **Rooting** = how users can attain privileged control (aka _root access_, or _superuser_) over various subsystems
  * Systemless Rooting = lighter rooting that does not require modifying system or boot partition
* **Recovery** = disk/partition management (wipe/format), download/apply OS update, (un)mount drives/volumes, factory reset
* **SafetyNet** = feature by which an App required higher security (eg banking) can enforce the device is trustworthy
  * Ie checks the device is not rooted & bootloader is locked
  * Circumventable via microG DroidGuard Helper
* **Sideloading** = installing an image onto the phone directly from a file located on the PC
* **Signing** = associates a signature with _.apk_ file, which ensures app identity (requires private key), integrity (untampered), compatibility (can update same version), trust between apps from same developer (can exchange data)
  * Also packs a self-signed certificate (ie not validated by any CA) acting as a simple keystore for associated public key, so no CA-based trust chain as we only need make sure it corresponds to original upload (TOFU)
  * In that case, that certificate & associated public key acts as that app's identity (Google keeps a copy of originally uploaded one, and compares future certificates against it)
* **Vendor image** = image containing device-specific drivers for controlling GPS, gyro, proximity & co

### Tools

* **Apktool** = assemble/disassemble/reverse engineer Android _.apk_ files
* **Heimdall** = a cross-platform tool for interacting with Download mode on Samsung devices
* **Odin** = utility used by Samsung to reset (or flash) their smartphones
* **ProGuard** = open source CLI to shrink/optimize/obfuscate Java code (distributed as part of Android SDK)
* **ScrCpy** (Screen Copy) = Android screen mirroring tool

### Versions

| Name        | Major | V  | Year |
| ----        | ----- | -- | ---- |
| Gingerbread | 2.3   | 7  | 2010 |
| Honeycomb   | 3.2   | 8  | 2011 |
| ICS         | 4     | 9  | 2011 |
| Jelly Bean  | 4.1   | 10 | 2012 |
| Jelly Bean  | 4.2   | 10 | 2012 |
| Jelly Bean  | 4.3   | 10 | 2013 |
| Jelly Bean  | 4.3.1 | 10 | 2013 |
| KitKat      | 4.4   | 11 | 2013 |
| Lollipop    | 5     | 12 | 2014 |
| Marshmallow | 6     | 13 | 2015 |
| Nougat      | 7     | 14 | 2016 |
| Oreo        | 8     | 15 | 2017 |
| Pie         | 9     | 16 | 2018 |
| Q           | 10    | 17 | 2019 |
| Android 11  | 11    | 18 | 2020 |
| Android 12  | 12    | 19 | 2021 |
| Android 12L | 12.1  | 19 | 2022 |
| Android 13  | 13    | 20 | 2022 |
| Android 14  | 14    | 21 | 2023 |
| Android 15  | 15    | 22 | 2024 |
| Android 16  | 16    | 23 | 2025 |

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

## [Android SDK Platform Tools](https://developer.android.com/studio/releases/platform-tools) (contains ADB, fastboot, systrace)

* In device manager, phones appear with different names depending on device power & (USB debugging session) autorization status
  * Powered-on & authorized phone appears as _Galaxy Nexus_
  * Powered-off or connection not yet accepted (on the device) phone appears as _Android 1.0_
* [How to install ADB and fastboot](https://doc.e.foundation/pages/install-adb-windows)
  * Developer mode must be enabled on the device (by clicking build number 7 times), as well as USB Debugging in developer settings
* [ADB](https://developer.android.com/studio/command-line/adb) (aka Android Debug Bridge) = CLI to interact with a (**powered-on**) device
  * `adb devices (-l)` = display connected devices IDs (option: with device information)
  * `adb reboot bootloader` = reboot into the bootloader (alternatively, (re)starting the device while holding Volume Down, then Power)
  * `adb reboot recovery` = reboot into the recovery (alternatively, starting while holding Volume Down, then Power until a menu, then select _RECOVERY_)
  * `adb sideload {file}`
* [Fastboot](http://adbcommand.com/fastboot) = interact with the bootloader (of a **powered-off** device)
  * `fastboot devices (-l)` = display current devices (option: with device information)
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

# Android

## Quick Tips

* URLs can be configured to be opened via designated apps (instead of the browser by default)

* [Codemagic - Android Code Signing](https://docs.codemagic.io/flutter-code-signing/android-code-signing)
  * **upload key** = to sign app before uploading to Codemagic or Google Play Store, associated with a certificate
    * Stored within a **keystore** (that can hold multiple keys), both generated (using same password) via either:
      * `keytool` Java command (installed with Android Studio)
      * Android Studio > Build > _Generate Signed Bundle/APK_ dialog
    * For Flutter, once an _upload-keystore.jks_ file is generated:
      * Reference it from a _key.properties_ file (in _android_ folder, `/!\` both files must be excluded from git public source version control)
      * Modify _android/app/build.gradle.kts_ to setup signing whenever building for release (ie `flutter build apk --release`)
        * See <https://docs.flutter.dev/deployment/android#sign-the-app>
  * Requires an **app signing key** (to let Google sign app to Users)
    * This step is only mandatory when actually registering the app to Google Play Store
* [Rooting, Bootloader, Recovery](https://android.stackexchange.com/a/117593)

## Glossary

* [Activities](https://developer.android.com/guide/components/activities/intro-activities) = one app entry point, defined in _AndroidManifest.xml_
* **Android App Bundle** (AAB) = device-agnostic package format containing compiled code & resources, used by Play Stores to eventually generate/distribute (smaller) device-specific APKs
* **Android SDK** = can be installed via Android Studio's SDK Manager (at `%USERPROFILE%\AppData\Local\Android\Sdk`)
  * [Platform Tools](https://developer.android.com/tools/releases/platform-tools) = primarily **adb** & **fastboot** exe (see section below)
* [Android Studio](https://developer.android.com/studio) = full Android development SDK, for building apps on Android devices
  * Includes **Android SDK Platform Tools** (which are also available as standalone tools)
* **Application Binary Interface** (ABI) = low-level interface to a specific CPU architecture
* [ARM](https://www.androidcentral.com/what-arm-cpu) (Acorn RISC Machine) = English company selling low-power processor architecture used in mobiles
  * By extension, an architecture (instructions set) for low-power scalable CPUs used in mobile devices (**ARM Code** is basically a name for (mobile native) machine code)
  * Architecture/Platform = _arm_ or _arm64_ (less commonly _x86_ or _x86\_64_) - see [Open GApps](https://opengapps.org)
* [AOSP](https://source.android.com) = Android Open Source Project
* apk = file containing an app ([How to install apk files from a PC](https://www.wikihow.com/Install-APK-Files-from-a-PC-on-Android))
* [Bootloader](https://source.android.com/devices/bootloader) = basically a BIOS & MBR (vendor-proprietary image), which brings up the kernel, launching recovery mode, etc
  * Low-level interface used to flash images on a partition via `fastboot` commands
  * Responsible for the base layer of security (prevents _system_ change), as unlocking the bootloader erases all previous data
* **GApps** = Google apps
* **GMS** (Google Mobile Services) = Google **Proprietary** apps & APIs, not part of AOSP (eg _Google Play_, _Gmail_, _Google Maps_, …)
* **Google Play (Store)** = app store
* **Google Play Services** = Google background services & libraries for use by mobile apps for gaming, geofencing, SSO, maps, ads, pay, analytics
* **Heimdall** = a cross-platform tool for interacting with Download mode on Samsung devices
* **Image** = _.img_ file, part of the OS, to be flashed (installed) to the partition matching its name on the device
* **Odin** = utility used by Samsung to reset (or flash) their smartphones
* **OEM** (Original Equipment Manufacturer) = a company that constructed an original component sold to end users by another company
* **OTA Updates** = Over-the-air updates, the upgrades to the current OS
* **ProGuard** = open source CLI to shrink/optimize/obfuscate Java code (distributed as part of Android SDK)
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
* **Vendor image** = image containing device-specific drivers for controlling GPS, gyro, proximity & co

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

# Android Studio

Google's official Android IDE.

## Glossary

* **AGP** (Android Gradle Plugin) = Gradle plugin building Android apps, see [Android Gradle Plugin](<Android Gradle Plugin.md>)
* **AVD** = Android Virtual Device
* **Java Keystore** (JKS) = file holding multiple named (eg *upload*) key entries (ie a private key associated with a public key certificate chain used by stores to verify legitimacy, see Upload Key in [Google Play](<Google Play.md>))
  * Key themselves have a password (often same as keystore's) and an alias (ie their non-secret name)
  * Generated via `keytool` CLI (bundled with JDK, included with Android Studio), or Build > *Generate Signed Bundle/APK* dialog
  * Legacy format, default type is PKCS12 since Java 9 (both accepted by Android, *.jks* extension commonly used for either)

## Environment

### Install

1. Download Android Studio
2. Complete the wizard
3. Create/Open a project (wait while gradle downloads its ~1GB cache, in *Users/{user}/.gradle*)
4. Choose a device in the top-right combobox
5. Enable the computer's UEFI (aka BIOS) VT-x hardware acceleration virtualization feature
6. Exclude locations from antivirus (see <https://developer.android.com/studio/intro/studio-config?utm_source=android-studio#antivirus-impact>)

# KeePass

Open-source password manager with plugin extensibility and an active community.
Saves its data in a .kdbx file, that can be published to the cloud, as long as its master password is strong.

[Why](https://www.youtube.com/watch?v=7U-RbOKanYs)
[Master Password](https://www.youtube.com/watch?v=3NjQ9b3pgIg)

## Environment

* [Keepass2Android vs Keepass2Android Offline](https://github.com/PhilippC/keepass2android/blob/master/docs/Comparison-of-Keepass-apps-for-Android.md) = Android apps comparison

### Setup

* Password Generation Options
  * Length = 20 characters
  * Upper-case
  * Lower-case
  * Digits
  * Underline (_)
  * Special
    * include `%!&@#~$*`
    * include `!&@#~$*`
    * include `#$`
  * Brackets

### Plugins

* **Kee** = FireFox Extension
  * Requires KeePassRPC plugin (the extension is a simple client that connects to KeePass and performs DOM manipulation).
  * Used to Generate, Save and auto-Fill passwords.
* **KeePassRPC** = Used to communicate with the FireFox extension
* **KeeOtp2** = 2FA Timed One-Time Password (TOTP) for KeePass
  * Not built-in on the desktop program (but it is on the _Keepass2Android_/_Keepass2Android Offline_ app)
  * Websites (Hotmail, Google, Facebook, etc.) offer 2FA via phone/QR code/**key**
    * Use that key to initialize TOTP generator for that site (might be a step further hidden than Phone/QR Code)
    * Also save the associated recovery codes if provided (in the same KeePass entry for the site)
  * [2FA setup guide](https://nidkil.me/2014/12/10/adding-two-factor-authentication-to-keepass-keepass2android/)

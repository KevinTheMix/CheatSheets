# KeePass

Open-source password manager with plugin extensibility and an active community.
Saves its data in a .kdbx file, that can be published to the cloud, as long as its master password is strong.

* [Why](https://www.youtube.com/watch?v=7U-RbOKanYs)
* [How to Choose a (master) Password](https://www.youtube.com/watch?v=3NjQ9b3pgIg)

## Glossary

* **2FA** (2-Factor Authentication) = websites (Hotmail, Google, Facebook, etc.) offer 2FA via phone/QR code/**key**
  * Use that key to initialize TOTP generator for that site (might be a step further hidden than Phone/QR Code)
  * Also save the associated recovery codes if provided (in the same KeePass entry for the site)
* **TOTP** = Timed One-Time Password

## API

* File > _Database Settings…_ > Security > _Iterations_ = 10000077 (depends on the DB file itself)
* Tools > _Generate Password…_
  * Length = 20 characters
  * Upper-case, Lower-case, Digits, Underline (`_`)
  * Special
    * include `%!&@#~$*`
    * include `!&@#~$*`
    * include `#$`
  * Brackets
* Tools > Options
  * Security > _Lock workspace after global user inactivity (seconds)_
  * Interface (1) > _Minimize to tray instead of taskbar_
  * Interface (1) > _Esc keypress in main window_
  * Advanced > _Automatically save when/after …_

## [Plugins](https://keepass.info/plugins.html)

* [Kee](https://www.kee.pm) = browsers extension performing DOM manipulation to generate, save & auto-fill passwords (requires _KeePassRPC_)
* [KeePassRPC](https://keepass.info/plugins.html#keepassrpc) = Used to communicate with the FireFox extension
* [KeeOtp2](https://github.com/tiuub/KeeOtp2) = 2FA (TOTP) for KeePass (desktop)
* [Keepass apps for Android](https://github.com/PhilippC/keepass2android/blob/master/docs/Comparison-of-Keepass-apps-for-Android.md)
  * _Keepass2Android_ vs _Keepass2Android Offline_ (both have built-in TOTP)

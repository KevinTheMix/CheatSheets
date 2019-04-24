# KeePass

Open-source password manager with plugin extensibility and an active community.
Saves its data in a .kdbx file, that can be published to the cloud, as long as its master password is strong.

[Why](https://www.youtube.com/watch?v=7U-RbOKanYs)
[Master Password](https://www.youtube.com/watch?v=3NjQ9b3pgIg)

## Plugins

* Kee = FireFox Extension
  * Requires KeePassRPC plugin (the extension is a simple client that connects to KeePass and performs DOM manipulation).
  * Used to Generate, Save and auto-Fill passwords.
* KeePassRPC = Used to communicate with the FireFox extension
* KeeOtp = 2FA for KeePass (not native)
  * Websites (Hotmail, Google, Facebook, etc.) with 2FA capabilities either use a phone, a QR code or a key. It is that key that can be used to generate a OTP.

## Apps

* Keepass2Android & Keepass2Android Offline
  * Just needs an access to a .kdbx file (local, web, ftp, DropBox, etc.)
  * Handles OTP natively.

## Setup

### Password Generator

Create custom Password Generator using the following character sets

* Alphanumeric
* _ (Underline)
* Brackets
* Special Characters or %!&@#~$* or !&@#~$* or #$

### Timed One-Time Password (TOTP)

1. Install KeeOtp plugin
2. Find 2FA generation key on website (might be a step further than QR Code or Phone)
3. Enter the key in KeePass entry (save recovery codes if provided).
4. Generate TOTP (Ctrl + T)

On the Keepass2Android Android App, TOTP are native.
See <http://nidkil.me/2014/12/10/adding-two-factor-authentication-to-keepass-keepass2android/>.
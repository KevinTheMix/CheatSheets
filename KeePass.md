# KeePass

Open-source password manager with plugin extensibility and an active community.
Saves its data in a database.kdbx file, that can be published to the cloud, as long as its master password is strong.

## Context

### Why

<https://www.youtube.com/watch?v=7U-RbOKanYs>

### Master Password

<https://www.youtube.com/watch?v=3NjQ9b3pgIg>

## Setup

### Password Generator

Create custom Password Generator using the following character sets

  Alphanumeric
  _ (Underline)
  Brackets
  Special Characters or %!&@#~$* or !&@#~$* or #$

## Plugins

### KeePassRPC

Used to communicate with the FireFox extension

### KeeOtp

Used to enable 2FA.
Websites (Hotmail, Google, Facebook, etc.) with 2FA capabilities offer either a QR code or a key. We can use that key to generate a OTP.

## Kee (FireFox Extension)

Requires KeePassRPC plugin (the extension is a simple client that connects to KeePass and performs DOM manipulation).
Used to Generate, Save and auto-Fill passwords.

## Keepass2Android (Android App)

Just needs an access to a database.kdbx file (local, web, ftp, DropBox, etc.)
Handles OTP natively.

## OTP (2FA)

OTP = One-Time Password
2FA = Two Factor Authentication
Install KeeOtp plugin, and find 2FA key on website and adds it to KeePass to generate a OTP.
OTP is native on the Keepass2Android Android App.
See <http://nidkil.me/2014/12/10/adding-two-factor-authentication-to-keepass-keepass2android/>.

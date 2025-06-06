# Shorebird

Created by Flutter creators (ex-Google engineers).
Pushes small Dart VM-related patches via OTA updates.
Cannot update native changes (such as plugins using platform channels).

## Quick Tips

* Use [Shorebird Console](https://console.shorebird.dev) to delete a registered application (with all its builds/releases)

## Glossary

## Install

Two options:

* Powershell = `Set-ExecutionPolicy RemoteSigned -scope CurrentUser # Needed to execute remote scripts` then `iwr -UseBasicParsing 'https://raw.githubusercontent.com/shorebirdtech/install/main/install.ps1'|iex` (installs in _~/.shorebird/bin_)
* Git = `git clone -b stable https://github.com/shorebirdtech/shorebird.git` (then add that /bin/ to Windows _PATH_)

## CLI

* `shorebird doctor`
* `shorebird login`
  * Stores credentials in _C:\Users\Kalex\AppData\Roaming\shorebird\credentials.json_
  * Set git long path via (administrator rights) command prompt `git config --system core.longpaths true`
* `shorebird login:ci` = generate a token (eg for a Codemagic release workflow)
* `shorebird logout`
* `shorebird init` = initialize a Flutter app (adds a _shorebird.yaml_ file)
* `shorebird init --display-name "Koko App"`
* `shorebird init --force` = recreates a _shorebird.yaml_ from scratch
* `shorebird release android`
* `shorebird preview` = run app created by `release` command
* `shorebird patch android` = create a (small) patch

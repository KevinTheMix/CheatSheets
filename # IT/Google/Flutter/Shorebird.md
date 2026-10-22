# Shorebird

Codepush for Flutter, created by Flutter creators (ex-Google engineers).
Pushes small Dart VM-related patches via OTA updates.
Supports Android, iOS, macOS, Windows & Linux (requires Flutter ≥ 3.27).

## Quick Tips

* iOS patches only run on physical devices (not on simulators)
* Mostly intended to push quick emergency patches without app store latency
* Can only patch Dart code (ie app code/generated code/Dart dependencies without native code)
* Cannot patch native code, assets (images, fonts) & Flutter version (needs a new store release)
* Checks & downloads patches in the background at launch, and applies them at the next startup
  * Hence 2 launches are needed to see a patch: 1st downloads/installs it, 2nd boots from it
  * `auto_update: false` in *shorebird.yaml* + `package:shorebird_code_push` = manual control of when updates are checked/installed
* Only active in release builds: `flutter run` (debug/profile) disables it, use `shorebird preview` to test a release/patch locally
* [Shorebird Console](https://console.shorebird.dev)
  * Delete a registered application (with all its builds/releases)
  * Create [API Keys](https://console.shorebird.dev/account/api-keys) & set it as Codemagic secret `SHOREBIRD_TOKEN` environment variable
  * Use a service account for keys not tied to one person

## Glossary

## Install

Two options:

* Powershell = `Set-ExecutionPolicy RemoteSigned -scope CurrentUser # Needed to execute remote scripts` then `irm https://shorebird.dev/install.ps1 | iex` (installs in *~/.shorebird/bin*)
* Git = `git clone -b stable https://github.com/shorebirdtech/shorebird.git` (then add that */bin/* to Windows *PATH*)

## CLI (`shorebird`)

* `create <name>` = create a new Flutter app with Shorebird
* `doctor`
* `init` = initialize an existing Flutter app (creates an `app_id` in a *shorebird.yaml* file, bundled as an asset in *pubspec.yaml*)
  * `--display-name "Koko App"`
  * `--force` = recreates a *shorebird.yaml* from scratch
* `login`
  * Opens a browser for authentication
  * Stores credentials in *C:\Users\Kalex\AppData\Roaming\shorebird\credentials.json*
  * Set git long path via (administrator rights) command prompt `git config --system core.longpaths true`
* `login:ci` (*deprecated* since 2026.10.01, replace them with API keys) = tokens
* `logout`
* `patch android` = create a (small) patch
  * `--release-version <version|latest>` = release to patch
  * `--track staging` = publish to a staging track first (default `stable`)
  * `--dry-run` = build & validate without uploading (CI sanity check)
  * `--platforms android,ios` = patch several platforms at once
* `preview` = run app created by `release` command
  * `--release-version <version>`
  * `--track staging`
* `release android` = like `flutter build`, also uploads compiled Dart artifacts to Shorebird's servers as baseline future patches are diffed against (*.aab* still has to be uploaded to store manually)
  * `--artifact apk` = also build an *.apk*
  * `--flutter-version <version>`
  * `--flavor <flavor>` / `--target <file>`
  * `--platforms android,ios` = release several platforms at once
* `upgrade` = update Shorebird CLI

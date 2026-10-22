# Codemagic

CI/CD for Android, iOS, Flutter & React Native.

## Quick Tips

* Codemagic is linked to git repo via a GitHub Webhook that is setup to call a Codemagic API, triggering calls on desired event (push/PR update/**tag creation**)
* [Google Play publishing with Flutter workflow editor](https://docs.codemagic.io/flutter-publishing/publishing-to-google-play)
  * In Google Cloud, create a service account with *Service Account User* role (which provides an email address), then create a credentials JSON key for that server account (which downloads a JSON file)
  * In Google Cloud, in *API and Services* > *Library*, type **Google Play Android Developer API** and enable it
  * In Google Play Console, in *Users and Permissions*, invite that Google Cloud email address as user on given app, and give it all 3 *Versions* rights for an app (ie *update/deploy/manage tests*)
  * In Codemagic, in Distribution section, drop that Google Cloud service account credentials JSON file
  * [The very first version of the app must be added to Google Play manually](https://docs.codemagic.io/flutter-publishing/publishing-to-google-play/#setting-up-publishing-to-google-play-on-codemagic)

## Glossary

* **App Signing Key** & **Upload Key** = see [Google Play](<../Google Play.md>)
* **Workflow Editor** = GUI alternative to configuring *codemagic.yaml*

## Menus

* Settings > *Code signing identities* = where you setup [Android Code Signing](https://docs.codemagic.io/flutter-code-signing/android-code-signing)
  * Local app signing setup (keystore, *key.properties*, *build.gradle.kts*): see [Flutter](Flutter.md#android-code-signing)
  * *upload-keystore.jks* file gets uploaded as-is, but not *key.properties*: its values are simply filled in GUI fields, and Codemagic regenerates the file at build time (so it must not be committed)
  * *build.gradle.kts* must use the variable names from Flutter's signing docs, as Codemagic relies on them (with `codemagic.yaml`, it exposes `CM_KEYSTORE_PATH`/`CM_KEYSTORE_PASSWORD`/`CM_KEY_ALIAS`/`CM_KEY_PASSWORD` env vars instead)
  * Note that in *GitHub Settings > Actions > Repository secrets*, a  keystore file appears as base-64 encoded (write-only secret) text

### GUI Workflow Editor

* Set a [Github Webhook](https://github.com/<user>/<repository>/settings/hooks) pointing to Codemagic endpoint URL (in *Webhooks* tab)
* Build for platforms = *Android*
* Publish updates to user devices using Shorebird = *Disabled/Release/Patch*
* Build triggers = *Trigger on tag creation* (same as GitHub)
* Environment variables
  * `CM_CLONE_UNSHALLOW: true` = provides git commit history (for Sentry commit association to work, because in shallow mode there are no provided commits)
  * (`CM_CLONE_DEPTH: 100` = alternatively, specify an arbitrary git history depth)
* Dependency caching
  * `$HOME/.pub-cache` = Flutter/Dart
  * `$HOME/.gradle/caches` = Android (Gradle)
  * `$HOME/Library/Caches/CocoaPods` = iOS/CocoaPods
* Pre-build script = (see dedicated section below)
* Shorebird (aka Build step)
  * Flutter version = (choose Shorebird default or specific if more advanced, eg *3.35.3* at the moment ie 2025.11.19)
  * Build arguments
    * `--artifact apk` (for **Shorebird Release only**, specifies an *apk* must be generated in addition to default *aab*)
    * `-- --obfuscate --split-debug-info=build/symbols` (mind leading `--` to separate/indicate those are `flutter build` arguments, not shorebird's) = obfuscate and produce debug symbols
* Post-build script = (removed renaming *apk*, as that removes it from result artifacts)
* Distribution > Android code signing = (enabled)
  * Keystore = *upload-keystore.jks*
  * Keystore password = (set)
  * Key alias = *upload*
  * Key password = (set)
  * Note that that lets Codemagic generate its own *upload-keystore.jks* (in android/app/) & *key.properties* files using those settings
* Notifications > Email = (enabled)

#### Pre-build script

Generate freezed/riverpod files (with caching):

```bash
set -e  # abort build immediately if code-gen throws an error

# Regenerate Freezed / json_serializable / Hive adapters, etc.
# Remove this block if you keep generated files in Git.
dart run build_runner build --delete-conflicting-outputs
```

(**Obsolete**) automatic version computation based on tag:

```bash
# Extract the latest Git tag (e.g., v1.2.3)
TAG=$(git describe --tags --abbrev=0)

# Strip the 'v' prefix → 1.2.3
VERSION=${TAG#v}

# Get total commit count as build number
BUILD=$(git rev-list --count HEAD)

# Update pubspec.yaml version line
echo "Setting version to $VERSION+$BUILD"
sed -i.bak "s/^version:.*/version: $VERSION+$BUILD/" pubspec.yaml
```

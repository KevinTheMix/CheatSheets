# Codemagic

CI/CD for Android, iOS, Flutter & React Native.

## Quick Tips

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

## Glossary

* **Workflow Editor** = GUI alternative to configuring _codemagic.yaml_

## Configuration

### Repository settings

* Application name = _Timewalk_
* Repository URL = <https://github.com/KevinTheMix/timewalk>

### Webhooks

* Set a [Github Webhook](https://github.com/KevinTheMix/timewalk/settings/hooks) with API URL provided by Codemagic in _Webhooks_ tab

### Workflow Editor

* Build for platforms = _Android_
* Publish updates to user devices using Shorebird = _Disabled/Release/Patch_
* Build triggers = _Trigger on tag creation_ (same as GitHub)
* Environment variables
  * `CM_CLONE_UNSHALLOW: true` = provides git commit history (for Sentry commit association to work, because in shallow mode there are no provided commits)
  * (`CM_CLONE_DEPTH: 100` = alternatively, specify an arbitrary git history depth)
* Dependency caching
  * `$HOME/.pub-cache` = Flutter/Dart
  * `$HOME/.gradle/caches` = Android (Gradle)
  * `$HOME/Library/Caches/CocoaPods` = iOS/CocoaPods
* Pre-build script = (see dedicated section below)
* Shorebird (aka Build step)
  * Flutter version = (choose Shorebird default or specific if more advanced)
  * Build arguments
    * `--artifact apk` (specifies an _apk_ must be generated in addition to default _aab_)
    * `-- --obfuscate --split-debug-info=build/symbols` (mind leading `--` to separate/indicate those are `flutter build` arguments, not shorebird's) = obfuscate and produce debug symbols
* Post-build script = (removed renaming _apk_, as that removes it from result artifacts)
* Distribution > Android code signing = (enabled)
  * Keystore = _upload-keystore.jks_
  * Keystore password = (set)
  * Key alias = _upload_
  * Key password = (set)
  * Note that that lets Codemagic generate its own _upload-keystore.jks_ (in android/app/) & _key.properties_ files using those settings
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

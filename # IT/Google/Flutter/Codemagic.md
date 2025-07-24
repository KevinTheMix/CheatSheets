# Codemagic

CI/CD for Android, iOS, Flutter & React Native.

## Quick Tips

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
* Environment variables = (none)
* Dependency caching
  * `$HOME/.pub-cache` = Flutter/Dart
  * `$HOME/.gradle/caches` = Android (Gradle)
  * `$HOME/Library/Caches/CocoaPods` = iOS/CocoaPods
* Pre-build script = (see dedicated section below)
* Shorebird Build arguments = `--artifact apk` (specifies an _apk_ must be generated in addition to default _aab_)
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

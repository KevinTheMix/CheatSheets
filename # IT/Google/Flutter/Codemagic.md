# Codemagic

## Quick Tips

## Glossary

## Configuration

### Repository settings

* Application name = _timewalk_
* Repository URL = <https://github.com/KevinTheMix/timewalk>

### Workflow Editor

* Build for platforms = Android
* Publish updates to user devices using Shorebird = Disabled/Release/Patch
* Build triggers = Trigger on tag creation (same as GitHub)
* Environment variables = (none)
* Dependency caching = (todo)
* Pre-build script
  * `# Extract the latest Git tag (e.g., v1.2.3)`
  * `TAG=$(git describe --tags --abbrev=0)`
  * `# Strip the 'v' prefix → 1.2.3`
  * `VERSION=${TAG#v}`
  * `# Get total commit count as build number`
  * `BUILD=$(git rev-list --count HEAD)`
  * `# Update pubspec.yaml version line`
  * `echo "Setting version to $VERSION+$BUILD"`
  * `sed -i.bak "s/^version:.*/version: $VERSION+$BUILD/" pubspec.yaml`
* Shorebird Build arguments = `--artifact apk` (specifies an _apk_ must be generated in addition to default _aab_)
* Post-build script = (removed renaming _apk_, as that removes it from result artifacts)
* Distribution > Android code signing = (enabled)
  * Keystore = _upload-keystore.jks_
  * Keystore password = (set)
  * Key alias = _upload_
  * Key password = (set)
  * Note that that lets Codemagic generate its own _upload-keystore.jks_ (in android/app/) & _key.properties_ files using those settings
* Notifications > Email = (enabled)

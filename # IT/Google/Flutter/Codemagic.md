# Codemagic

CI/CD for Android, iOS, Flutter & React Native.

## Quick Tips

* Environment variables (eg `CM_CLONE_UNSHALLOW`) can be defined either:
  * In *codemagic.yaml* (`environment.vars`) as plain-text
  * In Codemagic GUI (*Application* > *Environment variables* tab, appropriate for secrets-only)
    * Variables defined here are only injected if their group is listed in `environment.groups` (unlike [Workflow Editor](#gui-workflow-editor), which applies them automatically)
* [Free tier](https://codemagic.io/pricing) (personal plan) = 500 free build minutes/month on *macOS M2* machines (refilled monthly), 1 parallel build, 120 min max per build, 30 days build history/artifact storage, 3GB cache per build
  * Beyond 500 minutes, standard rates apply (eg *M2* $0.095/min, *Linux X2*/*Windows* $0.045/min)

### [Publishing to Google Play](https://docs.codemagic.io/flutter-publishing/publishing-to-google-play)

* In Google Cloud, create a service account with *Service Account User* role (which provides an email address), then create a credentials JSON key for that server account (which downloads a JSON file)
* In Google Cloud, in *API and Services* > *Library*, type **Google Play Android Developer API** and enable it
* In Google Play Console, in *Users and Permissions*, invite that Google Cloud email address as user on given app, and give it all 3 *Versions* rights for an app (ie *update/deploy/manage tests*)
* In Codemagic, in Distribution section, drop that Google Cloud service account credentials JSON file
* [The very first version of the app must be added to Google Play manually](https://docs.codemagic.io/flutter-publishing/publishing-to-google-play/#setting-up-publishing-to-google-play-on-codemagic)

## Glossary

* **App Signing Key** & **Upload Key** = see [Google Play](<../Google Play.md>)
* **Workflow Editor** = GUI alternative to configuring *codemagic.yaml*

## Environment

### codemagic.yaml

* Placed at repo root; defines one or more workflows (each = independent build config)
* Top-level keys
  * `definitions` (optional) = reusable YAML anchors (eg shared scripts/env)
  * `workflows` = map of workflow ids
* Workflow keys (under `workflows.<id>`)
  * `artifacts` = glob patterns of files to keep (eg `build/**/outputs/**/*.aab`)
  * `cache` = `cache_paths` list
  * `environment` = build setup
    * `android_signing` = keystore reference(s) from *Code signing identities* (exposes `CM_KEYSTORE_*` & `CM_KEY_*` env vars)
    * `flutter`/`xcode`/`java` = tool versions (eg `stable`)
    * `groups` = references UI-defined variable groups (secrets go there, marked *Secure*)
    * `vars` = plain-text environmment variables, stored in repo
  * `instance_type` = build machine (eg `mac_mini_m2`, `linux_x2`)
  * `max_build_duration` = minutes before build is killed
  * `name` = display name
  * `publishing` = `email`, `google_play` (`credentials`, `track`), `slack`...
  * `scripts` = ordered build steps (`name` + `script`), run before `artifacts`
  * `triggering` = `events` (`push`/`pull_request`/`tag`), with `branch_patterns`/`tag_patterns`

### GUI Menus

* **Applications** = edit application configuration, start new build
  * *codemagic.yaml* = versioned config-as-code alternative to [Workflow Editor](#gui-workflow-editor) (workflows, scripts, triggers, publishing), committed at repo root
  * *Environment variables* = per-app/group variables & secrets, injected in build, secrets are encrypted & can be shared across apps via groups
  * *Caching* = dependency cache paths kept between builds (eg `$HOME/.pub-cache`, `$HOME/.gradle/caches`), 3GB max
  * *Webhooks* = URL to register in git provider (eg GitHub) so push/PR/tag events trigger builds, recent deliveries history/log
  * *Scheduled builds* = cron-like recurring builds (eg nightly) on chosen branch/workflow
  * *Repository settings* = application name, icon, **archive/delete**
* **Builds** = view & restart all past/ongoing builds, download AAB/APK artifacts
* **Settings**
  * *General settings*
  * *codemagic.yaml settings*
    * *Code signing identities* = where you setup [Android Code Signing](https://docs.codemagic.io/flutter-code-signing/android-code-signing)
      * Local app signing setup (keystore, *key.properties*, *build.gradle.kts*): see [Flutter](Flutter.md#android-code-signing)
      * *upload-keystore.jks* file gets uploaded as-is, but not *key.properties*: its values are simply filled in GUI fields, and Codemagic regenerates the file at build time (so it must not be committed)
      * *build.gradle.kts* must use the variable names from Flutter's signing docs, as Codemagic relies on them (with `codemagic.yaml`, it exposes `CM_KEYSTORE_PATH`/`CM_KEYSTORE_PASSWORD`/`CM_KEY_ALIAS`/`CM_KEY_PASSWORD` env vars instead)
      * Note that in *GitHub Settings > Actions > Repository secrets*, a  keystore file appears as base-64 encoded (write-only secret) text
  * *Danger zone* = delete account

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

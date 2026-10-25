# Android Gradle Plugin

Gradle plugin (AGP) orchestrating Android build toolchain (*javac*/*kotlinc*, *AAPT2*, *D8*/*R8*, signing) to produce *.apk*/*.aab* files.
Gradle itself is a generic task runner and knows nothing about Android or compilation.
AGP registers Android-specific tasks, and each task calls a real tool (Java and/or Kotlin compiling/linking, dexing/shrinking, resources, signing/packaging).

## Quick Tips

* AGP version is a project-wide setting (declared once in top-level build/settings file, applies to all modules), distinct from Gradle's version (set in *gradle/wrapper/gradle-wrapper.properties*)
* Each AGP version requires a minimum Gradle, JDK, SDK Build Tools & Android Studio version (Studio only opens/syncs projects with an AGP version it supports)
  * Upgrade AGP & Gradle together, via Studio's AGP Upgrade Assistant (Tools > *AGP Upgrade Assistant*) or *File > Project Structure > Project*
  * Avoid dynamic versions (eg `9.4.+`): cause unexpected updates
* Run Gradle via wrapper (`gradlew`) rather than a global install, so everyone builds with same Gradle version
  * Upgrading wrapper requires running `gradlew wrapper --gradle-version <version>` twice (1st updates Gradle, 2nd the wrapper itself)
* `compileSdk` = API used to compile, `minSdk` = lowest supported device, `targetSdk` = behavior/permissions rules (see [Android](Android.md))
  * Each AGP version has a maximum supported `compileSdk` (a warning is raised if higher)
* Debug builds are signed automatically with a debug keystore (*~/.android/debug.keystore*), release builds need a signing config (see Signing in [Android](Android.md))
* In Flutter projects, AGP & Gradle versions live in *android/settings.gradle(.kts)* (`com.android.application` in `plugins` block) & *android/gradle/wrapper/gradle-wrapper.properties* (see [Flutter](<Flutter/Flutter.md>))

### Resources

* [AGP & Gradle compatibility](https://developer.android.com/build/releases/about-agp)
* [AGP release notes](https://developer.android.com/build/releases/gradle-plugin)
* [AGP roadmap](https://developer.android.com/studio/releases/gradle-plugin-roadmap) (upcoming breaking changes)

## Glossary

* *mapping.txt* = produced by R8 (or ProGuard via `-printmapping`) to de-obfuscate Java/Kotlin stack traces (upload to Play Console/Crashlytics/Sentry), found in *build/outputs/mapping/\<variant>/*
* **AAPT2** (Android Asset Packaging Tool) = compiles & links resources (*res/*, *AndroidManifest.xml*) into binary format & generates `R` class
* `androidComponents` = variant API (replacing `applicationVariants`, removed in AGP 9.0) to customize variants/artifacts/tasks from plugins
* **Build Tools** = SDK component (`buildToolsVersion`) bundling AAPT2, D8, `zipalign`, `apksigner`, selected by AGP (minimum depends on AGP version)
* **Build Type** = build configuration variant (eg `debug`, `release`) setting minification, signing, debuggable flag, etc
* **BuildConfig** = generated class exposing build-time constants (eg `DEBUG`, `VERSION_NAME`); generation is opt-in since AGP 8.0 (`buildFeatures { buildConfig = true }`)
* **D8** = dexer converting Java bytecode (*.class*) to DEX (Dalvik Executable, executed by ART), replacing DX
* **Dexing** = converting Java bytecode (*.class*) to DEX (*classes.dex*), done by D8 (or R8 when shrinking)
  * Single DEX file is limited to 65,536 methods: beyond that, code is split into several files (multidex, native since `minSdk` 21)
* **Dynamic Feature Module** = module delivered on demand via an *.aab* (plugin `com.android.dynamic-feature`)
* **Flavor** (product flavor) = variant dimension for different versions of an app (eg `free`/`paid`, `dev`/`prod`)
  * A **build variant** is a build type × flavor(s) combination (eg `devDebug`), each with its own tasks (eg `assembleDevDebug`)
* **Namespace** = package for generated `R`/`BuildConfig` classes, set by `namespace` in build file (replaces `package` attribute of *AndroidManifest.xml*, mandatory since AGP 8.0)
* **ProGuard** = open source CLI to shrink/optimize/obfuscate Java code (distributed as part of Android SDK), superseded by R8 in AGP but its rules files (*proguard-rules.pro*)
* **R8** = default shrinker/obfuscator/optimizer (also does dexing, replacing ProGuard), enabled via `isMinifyEnabled = true` (Flutter release builds do by default, see `--no-shrink` in [Flutter](<Flutter/Flutter.md>))
  * Removes unused code (& resources with `isShrinkResources = true`), reads ProGuard-format *proguard-rules.pro* (keep rules)
* **Version Catalog** = *gradle/libs.versions.toml* centralizing dependency & plugin versions (including AGP), referenced as `libs.<alias>`

### Plugins

* `com.android.application` = builds an app (*.apk*/*.aab*)
* `com.android.dynamic-feature` = on-demand feature module
* `com.android.kotlin.multiplatform.library` = Android target of a Kotlin Multiplatform library module
* `com.android.library` = builds a library (*.aar*, Android ARchive: code, resources & manifest)
* `com.android.test` = separate test module (eg instrumentation/macrobenchmark)

### Versions

| Year | AGP  | Min Gradle | Min JDK | Notes                                                                                           |
| ---- | ---- | ---------- | ------- | ----------------------------------------------------------------------------------------------- |
| 2021 | 7.x  | 7.0 - 7.5  | 11      |                                                                                                 |
| 2023 | 8.0  | 8.0        | 17      | `namespace` mandatory, `BuildConfig` generation off by default, non-transitive `R` classes on   |
| 2025 | 8.13 | 8.13       | 17      | Last 8.x                                                                                        |
| 2026 | 9.0  | 9.1.0      | 17      | New DSL interfaces only, built-in Kotlin (no more `org.jetbrains.kotlin.android`), KGP ≥ 2.2.10 |
| 2026 | 9.4  | 9.6.0      | 17      |                                                                                                 |

## Environment

### Folder Structure

* **app/**
  * *build.gradle(.kts)* = module config (`android { namespace, compileSdk, defaultConfig, buildTypes, productFlavors }`, `dependencies`)
* **gradle/wrapper/** > *gradle-wrapper.properties* = Gradle version (`distributionUrl`)
* *build.gradle(.kts)* (root) = build settings shared by all modules (eg plugin versions `id("com.android.application") version "9.4.0" apply false`)
* *gradle.properties* = Gradle/AGP flags (eg `org.gradle.jvmargs`, `android.useAndroidX`)
* *local.properties* = machine-specific `sdk.dir` (not committed)
* *proguard-rules.pro* = R8 keep rules
* *settings.gradle(.kts)* = declares modules (`include(":app")`) & plugin/dependency repositories (`google()`, `mavenCentral()`), plugin versions in `pluginManagement`/`plugins`

### CLI (`gradlew`)

* `assembleDebug` = build debug *.apk* (output in *app/build/outputs/apk/debug/*)
* `assembleRelease` = build release *.apk*
* `bundleRelease` = build release *.aab* (output in *app/build/outputs/bundle/release/*)
* `clean` = delete *build/* directories
* `connectedAndroidTest` = instrumented tests on device/emulator
* `installDebug` = build & install debug *.apk* on connected device
* `lint` = Android lint checks
* `signingReport` = list signing configs & fingerprints (SHA-1/SHA-256) per variant
* `test` = local unit tests (JVM)
* `--stop` = stop Gradle daemons
* `<module>:dependencies` = print dependency tree (`--configuration <name>` to filter)
* Common options
  * `--info`/`--stacktrace` = more diagnostics on failure
  * `--no-daemon` = single-use process (eg CI)
  * `--offline` = use only cached dependencies
  * `--refresh-dependencies` = ignore cached dependency resolution

# Sentry

## Quick Tips

* A project can easily be deleted (via *Project Settings* page) and recreated (with a new DSN, via *All Projects* page)

### Community

* [Infinite recursion in SentrySqfliteDatabaseFactory](https://github.com/issues/created?issue=getsentry%7Csentry-dart%7C3229) (**Fixed** by *buenaflor*)
  * (obsolete: You may need to specify `databaseFactory = SentrySqfliteDatabaseFactory(databaseFactory: databaseFactory);` instead to work around a known recursion bug (version 9.6.0) causing a stack overflow.)
* [Clarifying how to get to transactions page](https://github.com/getsentry/sentry-docs/pull/14802)

## Glossary

* **Debug Symbol** = symbol necessary to parse stack trace
* **DSN** (Data Source Name) = write-only URL endpoint towards which relevant information is sent (no authentication required for logging), safe to hardcode/commit
* **dSYM** (debug SYMbol) = Apple debug symbols
* **In-App** = application code vs **Not In-App** = framework, SDK, system libraries
* **OpenTelemetry Protocol** (OTLP) = vendor-neutral standard/protocol for emitting traces/logs/metrics (Sentry accepts them via its OTLP endpoint)
* **PII** (Personaly Identifiable Information) = request headers and IP for users (see <https://docs.sentry.io/platforms/dart/data-management/data-collected>)
* **Sentry CLI** = administrative tool (eg to upload symbols/sources/maps or delete projects)
* **Source Context** = sources uploaded to display inline context (surrounding code snippets) in stack traces (by setting  **upload_sources** to true)
  * Uploading sources *after* errors were already sent to Sentry (without sources) retroactively add sources to those exceptions
* **Stack Frame** = each entry in a call stack (ie active non-inline function calls/hops)

## Environment

### GUI Menus

* `<Organization>`
  * *All Projects* > select a `<project>` = insights/monitoring/statistics
* **Issues**
* **Explore** > *Releases*
* **Dashboard**
* **Monitors**
* **Settings** (with a project not selected)
  * **Organization**
    * *Organization Settings*
    * *Projects* > select a `<project>`
  * Seer
  * Integrations
  * **Developer Settings** > *Organization Tokens* = create/revoke tokens (used by CI/CD or CLI, required to upload debug symbols, set minimal scope eg `org:ci` for Codemagic)
* **Settings** (with a project selected)
  * *Project* > *General Settings* = details, connected repositories, email, spike protection, event settings
  * *SDK Setup* > *Client Keys (DSN)* = manage DSN key (and copy OTLP endpoint URL)

### [CLI](https://docs.sentry.io/cli)

### Flutter

* *.symbols* (Debug Information File) = Dart debug info from `--split-debug-info` (**mandatory** for readable stack traces of obfuscated builds), uploaded by Sentry Dart Plugin
* *mapping.txt* = R8/ProGuard mapping for Android Java/Kotlin stack traces (**mandatory** only if R8/ProGuard enabled, ie Flutter release default), uploaded by Sentry Android Gradle Plugin (see [Android Gradle Plugin](<../Android Gradle Plugin.md>))
* *obfuscation.map.json* (Dart Symbol Map) = Dart name pairs from `--save-obfuscation-map` for readable obfuscated issue titles (**optional**), set via `dart_symbol_map_path`
* *sentry.properties* = git-ignored file holding secret **auth_token** (**optional**, alternative = `SENTRY_AUTH_TOKEN` env variable), created by Sentry Wizard, read by Sentry Dart Plugin
* **DSN** setting = `options.dsn` in `SentryFlutter.init`, hardcoded (or set at build time via `--dart-define=<KEY>=<dsn>` + `const String.fromEnvironment('<KEY>')` combo)
  * If `options.dsn` is unset, SDK reads `SENTRY_DSN` env variable (not applicable in runtimes without process env, eg browser), else sends no events
* **Install** via Sentry Wizard & configure Sentry Dart Plugin (symbol uploads, see *sentry_flutter* & *sentry_dart_plugin* in [Packages](Packages.md))
  * Plugin uploads *.symbols* & *obfuscation.map.json*, run via `dart run sentry_dart_plugin` after `flutter build`
* [sqflite integration](https://docs.sentry.io/platforms/dart/guides/flutter/integrations/sqflite-instrumentation)
* [Troubleshooting](https://docs.sentry.io/platforms/dart/guides/flutter/troubleshooting)

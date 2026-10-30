# Google Play

Google's Android app store.

## Quick Tips

* Google fee = 15 % on first $1M/year
* To activate the *Send app for review* button, I had to create a new release
* [Set up and manage monetization options](https://playacademy.exceedlms.com/student/path/6407-set-up-and-manage-monetization-options)
* [App pricing rules](https://support.google.com/googleplay/android-developer/answer/6334373)
* [Billing setup](https://developer.android.com/google/play/billing/getting-ready) = publish a version that includes Google Play Billing Library to any track (including internal) to enable billing features & configure products
* [Test purchases](https://support.google.com/googleplay/android-developer/answer/6062777)
  * Publish the app to a track & publish products before testing
  * License testers can then sideload newer/debug builds with the same package name
  * Add **license testers** (Play Console settings → License testing) to test purchases without real charges
* Gate paid features on confirmed owned purchases
  * Offer **Restore purchases** to re-sync entitlements after reinstall/device change
  * [Verify purchase tokens on a secure backend](https://developer.android.com/google/play/billing/security) before granting entitlements (Google recommendation)

## Glossary

* **App Signing Key** = key whose certificate identifies the app: devices only accept updates signed with the same one
  * With Play App Signing, Google holds it & re-signs uploaded bundles with it (developer never signs with it)
  * Cannot be reset, unlike Upload Key
* **Developer Account** = proxy for real users (should be linked to a user account + a Google Cloud Platform service account given all 3 *Versions* rights for an app, ie *update/deploy/manage tests*)
* [Google Play Console](https://play.google.com/console) = app testing & publishing management
* **Play App Signing** = default scheme where Google holds the App Signing Key & the developer only signs uploads (with a distinct Upload Key)
  * Legacy alternative: developer signs with the App Signing Key directly, & Google compares each upload's certificate against the first one
  * Not needed for Shorebird OTA patches (see [Shorebird](<Flutter/Shorebird.md>))
* [Release Tracks](https://support.google.com/googleplay/android-developer/answer/14151465)
  * Each release goes through Google review except internal
  * An app in Internal & Closed Testing track cannot be found in Play Store and can be accessed via a Play Store dedicated link (in in *Test and publish* > *Tests* > *Internal|Closed tests* > *Testers*)
  * **Internal Testing** (optional) = rapidly test Play Store features (up to 100 hand-picked users), no human review necessary
  * **Closed Testing** = invite-only (email lists / Google Groups) with wide group of external friends & family users
    * Multiple parallel closed testing tracks can be created (eg *Alpha* default closed track)
  * **Open Testing** (optional) = public beta that anyone can join via Play listing (available when production access is obtained)
  * **Production** = public release to billions, staged rollout (% of users) possible
    * New personal accounts must keep **≥ 12+ opted-in closed testers continuously for 14 consecutive days** to apply for production access (only personal accounts created after 2023.11, older & organization accounts are exempt)
    * That 12 × 14 gate is one-time, later updates go straight to any track
* **Upload Key** = key used to sign app bundle (ie AAB/APK, not the source code) before uploading to Google Play
  * Proves app comes from you when uploading (an AAB manually from local computer or via CI/CD platform) to Google Play, which then re-signs it with its own Play App Signing key
  * Essentially a private key associated with a public certificate (both contained in a keystore file & password-protected, see [Android Studio](<Android Studio.md>))
  * Per-app registration, but it can be shared across apps
  * Resettable via Play support if lost

## Payments

* **Auto-renewing subscription** = recurring purchase that renews & charges again at each billing interval until cancelled
* **Consumable product** = one-time product that is used up & can be bought repeatedly (eg in-game currency)
* **Free app** = app with no upfront download price (it can still sell **one-time products & subscriptions**, à la free-mium)
  * Paid → free is allowed, but once offered for free, an app cannot become paid again (create a new app with a new package name to charge upfront)
* **Google Play Billing** = Play billing system for in-app digital products & subscriptions
* **Installment subscription** = subscription with required recurring payments over a commitment period (available only in some countries)
* **Merchant account** = Google Payments Center profile linked to a Play developer account to receive payments from paid apps, one-time products & subscriptions
* **Non-consumable product** = one-time product that grants a lasting entitlement, such as a permanent feature unlock
* **One-time product** = digital item or content bought with one charge, which may be consumable, grant one-off use, or unlock a lasting entitlement
* **Paid app** = app users pay for upfront to download (distinct from in-app purchases)
* **Premium** = informal label, not a Play Billing product type, which may mean a paid app, a one-time upgrade, or a subscription tier
* **Prepaid subscription** = subscription access paid for upfront for a set period (it does not renew automatically, so users must top it up to continue)
* **Subscription** = product granting access to benefits for a period, with plans that can auto-renew, be prepaid, or use installments

## Environment

### GUI Menus

* *Accueil* = see all apps
* *Gérer le compte*
  * *Détails du compte*
  * *Utilisateurs et autorisations* = accounts that can access that developer account, invite new users, manage their rights
  * *Journal d'activité* = activity log/history
  * *Groupes de testeurs* = manage testers e-mails lists
  * [Validation des développeurs Android](https://developer.android.com/developer-verification/guides) (mandatory since 30/09/2026) = real entities (ie people/organisations) validation
* `<My app>` = switch app
* *Tableau de bord* = checklists of remaining required steps for each test & publishing tracks
* *Statistiques*
* *Vue d'ensemble de la publication* = verify & send configuration modifications for review
* *Protégé avec Play* > *Protection Play Store* > *Gérer la signature d'application Play* = manage/reset import (aka upload) and signing key, download certificates, copy hashes
* *Tester et publier*
  * *Versions et bundles les plus récents* = latest app deployed versions (per track) & available bundles/packages
  * *Production* = releases dashboard, versions, countries/regions
  * *Tests* = note that countries/regions of **Closed/Open** tracks can be synchronized with **Production** parameters
    * *Tests ouverts* = versions, countries/regions, testers
    * *Tests fermés* > *Gérer le canal* = versions, countries/regions, testers
    * *Tests internes* = versions & testers
  * *Préinscription*
  * *Intégrité des applis* = moved to *Protégé avec Play*
  * *Paramètres avancés*
* *Surveiller et améliorer*
* *Accroître le nombre d'utilisateurs*
* *Monétiser avec Play*

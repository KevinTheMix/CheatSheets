# Google Play

Google's Android app store.

## Quick Tips

* To activate the *Send app for review* button, I had to create a new release

## Glossary

* **App Signing Key** = key whose certificate identifies the app: devices only accept updates signed with the same one
  * With Play App Signing, Google holds it & re-signs uploaded bundles with it (developer never signs with it)
  * Cannot be reset, unlike Upload Key
* **Developer Account** = proxy for real users (should be linked to a user account + a Google Cloud Platform service account given all 3 *Versions* rights for an app, ie *update/deploy/manage tests*)
* **Google Play Billing** = service to sell digital products & contents in an Android app (mandatory for all in-app purchases)
* [Google Play Console](https://play.google.com/console) = app testing & publishing management
* **Play App Signing** = default scheme where Google holds the App Signing Key & the developer only signs uploads (with a distinct Upload Key)
  * Legacy alternative: developer signs with the App Signing Key directly, & Google compares each upload's certificate against the first one
  * Not needed for Shorebird OTA patches (see [Shorebird](<Flutter/Shorebird.md>))
* [Tracks](https://support.google.com/googleplay/android-developer/answer/14151465)
  * **Internal Testing** = optional phase for dev team to quickly test Play Store features (up to 100 users), no human review necessary
    * Link is (well hidden) in *Test and publish* > *Tests* > *Internal tests* > *Testers* tab > **Copy link**
  * **Closed Testing** = share with wide group of external friends & family users
    * Multiple parallel closed testing tracks can be created (eg *Alpha* default closed track)
  * **Open Testing** = publish so anyone can test (à la open beta version, available when production access is obtained)
  * **Production** = publish to billions
    * Requires 12+ testers opted in Closed Testing continuously for 14 days (only for personal accounts created after 2023.11.13, older & organization accounts are exempt)
  * An app in Internal & Closed Testing track cannot be found in Play Store and can be accessed via a Play Store dedicated link
* **Upload Key** = key used to sign app bundle (ie AAB/APK, not the source code) before uploading to Google Play
  * Proves app comes from you when uploading (an AAB manually from local computer or via CI/CD platform) to Google Play, which then re-signs it with its own Play App Signing key
  * Essentially a private key associated with a public certificate (both contained in a keystore file & password-protected, see [Android Studio](<Android Studio.md>))
  * Resettable via Play support if lost

## Console Menus

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

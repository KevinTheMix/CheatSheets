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
  * **Closed Testing** = share with wide group of at least 12 external friends & family users (**mandatory step to publish to production**)
  * **Open Testing** = publish so anyone can test (à la open beta version, available when production access is obtained)
  * **Production** = publish to billions
  * An app in Internal & Closed Testing track cannot be found in Play Store and can be accessed via a Play Store dedicated link
* **Upload Key** = key used to sign bundle before uploading to Google Play, only proving uploader identity (Google replaces its signature with the App Signing Key's)
  * Essentially a private key associated with a public certificate (both contained in a keystore file & password-protected, see [Android Studio](<Android Studio.md>))
  * Resettable via Play support if lost

## Menus

* *Accueil* > *Applications épinglées* > *Voir l'application*
  * *Tableau de bord* = voir les étapes restantes requises pour procéder aux différents canaux de test et à la publication
  * *Vue d'ensemble de la publication* = vérifier & envoyer des modifications effectuées pour validation
  * *Tester et publier*
    * *Versions et bundles les plus récents* = packages dispos et deployés dans les différents canaux de test
    * *Production* = Tableau de bord des releases, Versions, Pays/Régions
    * *Tests* = configurer les différents canaux de test
      * *Tests ouverts* = Versions, Pays/Régions (peut être synchronisés aka copiés des paramètres Pays/Régions de Production), **Testeurs**
      * *Tests fermés* > Gérer le canal = Versions, Pays/Régions, **Testeurs**
      * *Tests internes* = Versions, **Testeurs**
* *Users and permissions* = accounts that can access that developer account, invite new users, manage their rights
* [Validation des développeurs Android](https://developer.android.com/developer-verification/guides) (requis àpd 30/09/2026) = validation des entités réelles (individus ou organisations)

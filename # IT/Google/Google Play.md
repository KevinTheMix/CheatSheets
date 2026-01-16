# Google Play

## Quick Tips

* [Google Play Console](https://play.google.com/console)
* To publish via Codemagic:
  * [The very first version of the app must be added to Google Play manually](https://docs.codemagic.io/flutter-publishing/publishing-to-google-play/#setting-up-publishing-to-google-play-on-codemagic)
  * In Google Cloud, create a service account with _Service Account User_ role (which provides an email address), then create a credentials JSON key for that account (which downloads a JSON file)
  * In Google Cloud, in _API and Services_ > _Library_, type **Google Play Android Developer API** and enable it
  * In Google Play Console, in _Users and Permissions_, invite that Google Cloud email address as user on given app, and give it versions rights (ie _update/deploy/manage tests_)
  * In Codemagic, in Distribution section, drop credentials JSON file
  * Google Cloud project name does not matter (but can be changed)
* To activate the "Send app for review" button, I had to create a new release

## Glossary

* **Google Play Billing** = service to sell digital products & contents in an Android app (mandatory for all in-app purchases)
* [Tracks](https://support.google.com/googleplay/android-developer/answer/14151465)
  * **Internal Testing** = optional phase for dev team to quickly test Play Store features (up to 100 users), no human review necessary
    * Link is (well hidden) in _Test and publish_ > _Tests_ > _Internal tests_ > _Testers_ tab > **Copy link**
  * **Closed Testing** = share with wide group of at least 12 external friends & family users (**mandatory step to publish to production**)
  * **Open Testing** = publish so anyone can test (à la open beta version, available when production access is obtained)
  * **Production** = publish to billions
  * An app in Internal & Closed Testing track cannot be found in Play Store and can be accessed via a Play Store dedicated link

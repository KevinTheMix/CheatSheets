# [Firebase](https://firebase.google.com)

Google's BaaS cloud platform for building & scaling mobile/web apps, built on top of Google Cloud Platform (subject to privacy controversies).

Offers data storage, authentication, messaging, analytics, A/B testing & a rich ecosystem of extensions (payments, translation, emails, ElasticSearch/TypeSense, etc).

Very cheap for starting apps until they grow an active userbase, with a well-documented SDK.

## Quick Tips

### TODO

* [Firebase: What's new in Firebase](https://www.youtube.com/watch?v=i0VNBvCqpgI)
* [Fireship: Firebase - Back to the Basics](https://www.youtube.com/watch?v=q5J5ho7YUhA)
* [Fireship: Flutter Firebase Setup for Power Users](https://www.youtube.com/watch?v=Mx24wiPilHg)

* [Realtime Database triggers](https://firebase.google.com/docs/functions/database-events)
* [Firebase Security Rules](https://firebase.google.com/docs/database/security/get-started)
* [Keeping track of IDs](https://stackoverflow.com/a/15250474/3559724)
* [Understand Firebase Realtime Database Security Rules](https://firebase.google.com/docs/database/security/)
* [Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup)

## Glossary

* **Cloud Firestore** = newer more structured document-based DB
  * [Cloud Firestore vs Realtime Database](https://stackoverflow.com/a/46549816/3559724)
* **Firebase Cloud Messaging** = push messages to apps
* **firebase-tools** = FOSS CLI tools to test, manage, and deploy Firebase projects
* _firestore.rules_ = file that configures DB access authorization, using Common Expression Language
* **Realtime Database** = historical all-JSON DB
* (DB) **Stream** = subscription to real-time changes

## Environment

### Install

* Create a free Firebase project (via the website)
* Install the Firebase SDK: `npm install firebase`
* Paste the project credentials into the (JS) app: `const app = initializeApp(json_auth_config);`

## CLI

* `firebase init firestore` = Firestore
* `firebase init functions` = Firebase Cloud Functions i.e. serverless backend, for server-side code e.g. HTTP endpoints
  * Trigger-like event-based functionalities (DB written, user authenticated, file uploaded)
* `firebase emulators:start` = run emulator in a dev/mock environment
* `firebase deploy` = push code to the cloud and allocate infrastructure to scale up/down

## API

* Get user = `const auth = getAuth(app); onAuthStateChanged(auth, user => ...);`
* React to DB changes in real-time = `onSnapshot(boatRef, snapshot => { const boat = snapshot.data(); } );`

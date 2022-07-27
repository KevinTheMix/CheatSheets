# [Firebase](https://firebase.google.com/)

Firebase is a development platform developed by Google for creating and scaling mobile/web applications, and built on top of Google Cloud platform.

It is essentially a BaaS, Backend as a Service, cloud platform offering an array of Backend features for Data storing, Authentication, Messaging, Analytics, A/B testing, and with a rich ecosystem of additional extensions for payments, translating, emails, ElasticSearch/TypeSense, etc.

It is also very cheap for starting applications until they grow an active userbase, and its SDK is well-documented.

## Environment

### Install

* Create a free Firebase project (via the website)
* Install the Firebsae SDK: `npm install firebase`
* Paste the project credentials into the (JS) app: `const app = initializeApp(json_auth_config);`

## CLI

* `firebase init firestore` = Firestore
* `firebase init functions` = Firebase Cloud Functions i.e. serverless backend, for server-side code e.g. HTTP endpoints
  * Trigger-like event-based functionalities (DB written, user authenticated, file uploaded)
* `firebase emulators:start` = run emulator in a dev/mock environment
* `firebase deploy` = push code to the cloud and allocate infrastructure to scale up/down

## API

* Get user
  * `const auth = getAuth(app); onAuthStateChanged(auth, user => ...);`
* React to DB changes in real-time
  * `onSnapshot(boatRef, snapshot => { const boat = snapshot.data(); } );`

## Firestore

A realtime document DB.

Use _firestore.rules_ file configures DB access authorization, using Common Expression Language.

## TODO

[Firebase: What's new in Firebase](https://www.youtube.com/watch?v=i0VNBvCqpgI)
[Fireship: Firebase - Back to the Basics](https://www.youtube.com/watch?v=q5J5ho7YUhA)
[Fireship: Flutter Firebase Setup for Power Users](https://www.youtube.com/watch?v=Mx24wiPilHg)

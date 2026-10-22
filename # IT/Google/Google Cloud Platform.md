# Google Cloud Platform (GCP)

Suite of cloud computing services offered by Google (for computing, data storage, data analytics, machine learning).

## Quick Tips

* [Google Cloud Console](https://console.cloud.google.com)
* Google Cloud project name does not matter (and can be changed)

## Glossary

* **Cloud Hub** = unified, application-centric view of the resources, health, costs, deployments & support cases across projects
* **IAM** (Identity & Access Management) = controls who (principal) can do what (role) on which resource; policies set at org/folder/project/resource level, inherited downwards
* **Project** = base container for all resources (VMs, buckets, databases, APIs…), with its own ID, billing account, IAM policies & enabled APIs
* **Service Account** = non-human identity for an app/VM/workload to call Google Cloud APIs, with permissions via IAM roles; prefer attached identity over JSON keys (security risk)
  * Required to publish an Android app on Google Play from CI/CD (eg *Codemagic*, *Fastlane*) as the *Google Play Developer API* only accepts authenticated identities
  * A CI/CD pipeline can't log in interactively (2FA) with a personal Google account, so it authenticates with the service account's JSON key instead
  * It acts as a dedicated robot user, with least-privilege rights granted in *Google Play Console* (eg *Releases* permissions) & easy to revoke without affecting real users
  * Setup: enable *Google Play Android Developer API* in a project, create service account & JSON key, then invite its email in *Play Console* > *Users & permissions*

## Menus

* Dashboard = view & edit a project information
  * Access project parameters = *IAM & Administration* > *Resources Management* section > *Settings*
* Left menu (`.`)
  * *Products*
    * *IAM & Administration*
      * *Identities & Accesses* section > *Service Accounts* = create or view service accounts
        * Pick account > *Keys* = view existing keys metadata, or create new key pair to download JSON private key (Google only keeps public key (certificate))
      * *Resources Management* section > *Settings* = rename project
    * *API & Services* > *Library* > search for [Google Play Android Developer API](https://console.cloud.google.com/apis/library/androidpublisher.googleapis.com) > *Enable*

## CLI

* `gcloud services enable androidpublisher.googleapis.com --project <project-id>` = enable *Google Play Android Developer API* in a project (equivalent of *API & Services* > *Library* > *Enable*)

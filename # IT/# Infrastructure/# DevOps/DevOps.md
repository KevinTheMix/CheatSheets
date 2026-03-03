# DevOps

## Glossary

* **Artifact** = versioned immutable file(s) produced/consumed by a CI/CD pipeline step, stored to be reused/audited (eg _.apk/exe/jar_, checksums, Docker images, test reports)
* **Continuous Delivery** (CD) = code changes passing integration are automatically prepared for release to production but a human still approves/triggers actual deployment
* **Continuous Deployment** (CD) = every change that passes all automated tests is deployed to production automatically
* **Continuous Integration** (CI) = frequent merging small changes into a shared repo, triggering automated builds & tests
* **Progressive Delivery** = gradually release changes to a subset of users, evaluating results then expanding rollout/rolling back (ie an evolution of CD with more control & safety to release process)
  * **Blue-Green Deployment** = all-or-nothing switch between two identical environments (ie prepare inactive one to go live then flip traffic over entirely, à la A/B test)
  * **Canary Deployment** = roll out to a tiny percentage first to monitor for errors then gradually increase if everything goes smoothly
  * **Regional Rollout** = deploy to one datacenter/region first, verify it's healthy then proceed to others

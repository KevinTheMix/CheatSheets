# DevOps

## Glossary

* **Artifact** = versioned immutable file(s) produced/consumed by a CI/CD pipeline step, stored to be reused/audited (eg _.apk/exe/jar_, checksums, Docker images, test reports)
* **CI/CD** (Continuous Integration & Continuous Delivery) = frequent merging small changes into main branch + rapidly repeatedly release reliable software in short cycles
* **Progressive Delivery** = gradually release changes to a subset of users, evaluating results then expanding rollout/rolling back (ie an evolution of CD with more control & safety to release process)
  * **Blue-Green Deployment** = all-or-nothing switch between two identical environments (ie prepare inactive one to go live then flip traffic over entirely, à la A/B test)
  * **Canary Deployment** = roll out to a tiny percentage first to monitor for errors then gradually increase if everything goes smoothly
  * **Regional Rollout** = deploy to one datacenter/region first, verify it's healthy then proceed to others

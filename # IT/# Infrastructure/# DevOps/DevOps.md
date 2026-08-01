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

* **Artifactory** (_JFrog_) = repository manager to store/manage/version/distribute software artifacts (ie software binaries/packages eg .NET nugets, Docker images, npm packages, Python packages, Helm charts, etc)
* **Datadog** = American company providing observability service for cloud-scale applications (servers/DBs/tools/services monitoring through a SaaS-based data analytics platform)
* **Grafana** (not to be confused with Elastic Kibana) = open-source analytics/visualization web app to display metrics, logs & traces
* **OpenTelemetry** (aka OTel) = vendor-neutral open standard & general purpose toolkit for collecting and exporting traces/metrics/logs from applications
* **Prometheus** (by SoundCloud) = open-source systems monitoring & alerting toolkit (metrics, time series, PromQL query language)
* **Sentry** = error & crash tracking tool to capture exceptions/stacktrace/context when things go wrong (_what broke & why?_)
* **Splunk** = SIEM (security information & event management), SOAR (security orchestration, automation, response), observability solutions

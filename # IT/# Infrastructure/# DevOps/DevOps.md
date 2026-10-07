# DevOps

## Quick Tips

* Where to store configuration?
  * **Secrets vault** (eg Azure Key Vault, AWS Secrets Manager, HashiCorp Vault) = credentials/keys/certs with access control, rotation & audit, fetched at runtime (ideally via managed identity, so no bootstrap secret)
  * **Environment variables** (eg `.env` locally, K8s Secrets/ConfigMaps, CI/CD variables) = per-deployment values injected by the platform (12-Factor), flat key/values only, beware leaks via logs/crash dumps (K8s Secrets are only base64-encoded)
  * **Config files** (per-environment eg `appsettings.Production.json`, `config/prod.yaml`) = non-secret structured/hierarchized settings (eg defaults eg logging level, retries/timeouts), versioned & reviewed alongside code
  * **Centralized config service** (eg Azure App Configuration, AWS Parameter Store, Consul, Spring Cloud Config) = scalar & more complex structurs, shared across services, changeable at runtime without redeploy (eg feature flags)
  * Usually layered with increasing precedence: default files < env-specific files < env vars < CLI args, secrets only referenced from the vault

## Glossary

* **Artifact** = versioned immutable file(s) produced/consumed by a CI/CD pipeline step, stored to be reused/audited (eg _.apk/exe/jar_, checksums, Docker images, test reports)
* **Continuous Delivery** (CD) = code changes passing integration are automatically prepared for release to production but a human still approves/triggers actual deployment
* **Continuous Deployment** (CD) = every change that passes all automated tests is deployed to production automatically
* **Continuous Integration** (CI) = frequent merging small changes into a shared repo, triggering automated builds & tests
* **Progressive Delivery** = gradually release changes to a subset of users, evaluating results then expanding rollout/rolling back (ie an evolution of CD with more control & safety to release process)
  * **Blue-Green Deployment** = all-or-nothing switch between two identical environments (ie prepare inactive one to go live then flip traffic over entirely, à la A/B test)
  * **Canary Deployment** = roll out to a tiny percentage first to monitor for errors then gradually increase if everything goes smoothly
  * **Regional Rollout** = deploy to one datacenter/region first, verify it's healthy then proceed to others

### Tools

* **Artifactory** (_JFrog_) = repository manager to store/manage/version/distribute software artifacts (ie software binaries/packages eg .NET nugets, Docker images, npm packages, Python packages, Helm charts, etc)
* **Datadog** = American company providing observability service for cloud-scale applications (servers/DBs/tools/services monitoring through a SaaS-based data analytics platform)
* **Grafana** (not to be confused with Elastic Kibana) = open-source analytics/visualization web app to display metrics, logs & traces
* **Jenkins** = open-source automation server that enables CI/CD by automating software building/testing/deployment (à la Azure Devops Pipelines/Release features)
* **OpenTelemetry** (aka OTel) = vendor-neutral open standard & general purpose toolkit for collecting and exporting traces/metrics/logs from applications
* **Prometheus** (by SoundCloud) = open-source systems monitoring & alerting toolkit (metrics, time series, PromQL query language)
* **Sentry** = error & crash tracking tool to capture exceptions/stacktrace/context when things go wrong (_what broke & why?_)
* **Splunk** = SIEM (security information & event management), SOAR (security orchestration, automation, response), observability solutions
  * Splunk HEC (HTTP Event Collector) token = (sensitive) authentication secret that authorizes a client to send data/events into a Splunk instance via HEC API
  * Uses **Search Processing Language** (SPL), consisting of a search part (finding events) & a pipeline part (transforming/analyzing results)

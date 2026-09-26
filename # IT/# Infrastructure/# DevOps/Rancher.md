# Rancher

Rancher is an open-source multi-cluster Kubernetes management platform.
Rancher itself doesn't run workloads; it's a control plane that talks to each provider's API to provision/manage clusters then presents them all under one interface.

## Quick Tips

## Glossary

* **Provider** = underlying infrastructure on which a Kubernetes cluster runs on (eg AWS EKS, Azure AKS, Google GKE, vSphere, bare-metal/on-prem nodes, or Rancher's own lightweight distros RKE2 & K3s)
* **Rancher CLI** = command-line client (`rancher`) for interacting with a Rancher server (login, manage clusters/projects/apps, `kubectl` context switching) as an alternative to the web UI

## Menus

* **Clusters** = list/manage Kubernetes clusters (provisioned or imported) managed by Rancher
* **Workloads** = running application resources within a cluster/namespace
  * _CronJobs_ = jobs scheduled to run repeatedly on a time-based schedule
  * _DaemonSets_ = ensures a copy of a pod runs on every (or selected) node in the cluster
  * _Deployments_ = manages replicated, self-healing sets of stateless pods with rolling updates (set _environment variables_ & _number of running pods_)
  * _Jobs_ = runs a pod to completion for a one-off/batch task
  * _StatefulSets_ = manages replicated pods with stable identities/storage, for stateful applications
  * _Pods_ = smallest deployable unit, one or more co-located containers sharing network/storage (_Execute Shell & View Logs_)
* **Apps** = catalog for installing/managing Helm charts (packaged applications) on the cluster
* **Service Discovery** = manage Services (stable network endpoints routing traffic to pods)
* **Storage** = cluster storage resources
  * _PersistentVolumes_ = cluster-wide storage resource provisioned independently of pods
  * _StorageClasses_ = defines how PersistentVolumes are dynamically provisioned (backend/type/policy)
  * _ConfigMaps_ = non-secret key-value configuration data injected into pods
  * _PersistentVolumeClaims_ = a pod's request/binding to a PersistentVolume
  * _Secrets_ = sensitive key-value data (credentials, tokens, certs) injected into pods (configure by namespace, pick _Opaque_ Kind secrets)
  * _Project Secrets_ = secrets shared/scoped across a Rancher "project" (group of namespaces)
* **Policy** = admission control/governance rules (e.g. Pod Security Policies) applied to the cluster
* **Monitoring** = metrics, alerting, and dashboards (Prometheus/Grafana) for cluster health
* **More Resources** = catch-all view for other Kubernetes API resources not covered by dedicated menus

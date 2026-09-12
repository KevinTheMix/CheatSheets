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
  * **CronJobs** = jobs scheduled to run repeatedly on a time-based schedule
  * **DaemonSets** = ensures a copy of a pod runs on every (or selected) node in the cluster
  * **Deployments** = manages replicated, self-healing sets of stateless pods with rolling updates (**set number of running pods**)
  * **Jobs** = runs a pod to completion for a one-off/batch task
  * **StatefulSets** = manages replicated pods with stable identities/storage, for stateful applications
  * **Pods** = smallest deployable unit, one or more co-located containers sharing network/storage (**Execute Shell & View Logs**)
* **Apps** = catalog for installing/managing Helm charts (packaged applications) on the cluster
* **Service Discovery** = manage Services (stable network endpoints routing traffic to pods)
* **Storage** = cluster storage resources
  * **PersistentVolumes** = cluster-wide storage resource provisioned independently of pods
  * **StorageClasses** = defines how PersistentVolumes are dynamically provisioned (backend/type/policy)
  * **ConfigMaps** = non-secret key-value configuration data injected into pods
  * **PersistentVolumeClaims** = a pod's request/binding to a PersistentVolume
  * **Secrets** = sensitive key-value data (credentials, tokens, certs) injected into pods
  * **Project Secrets** = secrets shared/scoped across a Rancher "project" (group of namespaces)
* **Policy** = admission control/governance rules (e.g. Pod Security Policies) applied to the cluster
* **Monitoring** = metrics, alerting, and dashboards (Prometheus/Grafana) for cluster health
* **More Resources** = catch-all view for other Kubernetes API resources not covered by dedicated menus

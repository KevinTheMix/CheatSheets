# Kubernetes

Kubernetes (K8s) is an open-source production-grade orchestrating platform for placing & executing (not necessarily Docker) containers, enabling availability/flexility/scalability.
Based on an internal Google product called Borg open-sourced in 2014.

## Quick Tips

* [Roadmap](https://roadmap.sh/kubernetes)
* [Tutorials](https://kubernetes.io/docs/tutorials)
* Can run on-premise, in public cloud or in a hybrid environment
* Implement Progressive Delivery via tools like Argo Rollouts or Flagger that automatically roll back if error rates spike
* Drawbacks = complexity (distributed system requires expertise to setup/operate), costs (high upfront cost, requires minimum level of resources to run & support all its features)
* Some complexity can be offloaded to a managed Kubernetes cloud service (eg Microsoft AKS, Amazon EKS, Google GKE) to avoid handling underlying infrastructure & expertise (eg setting up control plane, scaling, maintenance)
* [Microsoft Learn: What is Azure Kubernetes Service (AKS)?](https://learn.microsoft.com/en-us/azure/aks/what-is-aks)
* [Microsoft Learn: Introduction to Kubernetes](https://learn.microsoft.com/en-us/training/modules/intro-to-kubernetes)
* [Microsoft Learn: Introduction to Azure Kubernetes Service](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-kubernetes-service)

## [Glossary](https://kubernetes.io/docs/reference/glossary)

* **Cluster** = a set of (at least one) worker machines (ie nodes) that run containerized applications
* **ConfigMap** = API object to store non-confidential data in key-value pairs, consumed by pods as environment variables, CLI arguments, configuration files in a volume
* **Container Runtime** = runs containers effectively by managing their execution & lifecycle (pulls images from registry, start/stops containers, manages their resources)
* **Container Runtime Interface** (CRI) = main gRPC protocol for communication between kubelet & container runtime (implemented nnatively by eg containerd & CRI-O)
* **Control Plane** = central control system for nodes in a cluster, which creates/manages pods
  * **API Server** = primary interface between control plane & rest of cluster, and allows clients (admin UI & CLI) to interact with control plane & submit requests to manage cluster
    * **API Resource** = anything that can be created/managed through API server, as a resource type with its own schema
    * **Core API Resource** = resources that are natively built into Kubernetes itself & understood by every cluster out of the box (as opposed to Custom Resource Definitions (CRD) which extend API with new resource types)
  * **Controller Manager** = runs controllers managing cluster state
    * **Deployment Controller** = manages rolling update & rollback of deployments
    * **Ingress Controller** = software that reads ingress resources & implements routing (eg _Traefik_, _Nginx Ingress Controller_)
    * **Replication Controller** = ensures designed number of pod replicas are running
* **Deployment** = API object that manages a replicated application
* **Dockershim** = was a translation layer built into kubelets that converted CRI calls into Docker API calls
* **etcd** = distributed key-value store to store all cluster (persistent) state, used by API server & other control plane components to store/retrieve cluster information
* **Horizontal Pod Autoscaling** = scale horizontally as neded by adding more nodes to a cluster
* **Ingress** = Kubernetes API object for routing external HTTP(S) traffic to services (with load balancing & TLS termination)
* **kube-proxy** = network proxy that runs on each worker node to route traffic to correct pods, and provides load-balancing to make sure traffic is evenly distributed across pods
* **Kubelet** = daemon running on each node that ensures containers described in PodSpecs obtained through various sources are running/healthy in a pod (communicate with control plane to receive instructions on desired pods state)
* **Kubernetes API** = application that serves functionality through a RESTful interface & stores cluster state
* **Namespace** = a way to divide cluster resource between teams or environments
* **Node** = (physical or virtual) machine in cluster that has daemons/services to host pods
* **Object** = an API entity/resource representing cluster state (or "record of intent")
  * Can be created via a declarative (YAML/JSON) manifest/configuration file that control plane will work to ensure it exists or imperatively (via `kubectl` commands), or via custom controllers/Helm charts
* **Orchestrator** = manages lifecycle & locations of various containers, with error control & restart capabilities (eg Azure Fabric Service, Docker Swarm, Kubernetes, Mesosphere)
* **Pod** = smallest & simplest deployable unit in a node designed as a shared execution context for a set of running containers (sharing network namespace/IP address, storage volumes, lifecycle together)
* **PodSpec** = specification within a pod manifest that defines containers/volumes/runtime configuration for that pod
* **Recreate** = another deployment strategy, which kills everything then start new pods
* **Replica** = running copy/duplicate of a pod (set) ready to go live at any given time that ensures high availability/scalability/fault tolerance/rolling updates/efficient resources distribution across nodes
* **ReplicaSet** = set of replicas
* **Rolling Update** = default deployment strategy that incrementally replaces old pods with new ones, ensuring an application remains available throughout update process
* **Scheduler** = schedules/makes decision about placing pods onto worker nodes in cluster according to available resources (eg current load)
* **Scheduling** = assigning a pod to a specific node in cluster
* **Secret** = stores sensitive information (eg passwords, OAuth tokens, SSH keys) in etcd (**unencrypted**) by default
* **Self-Healing** = auto-renew dead nodes
* **Service** = stable network endpoint (IP address & DNS name, with load balancing) for reaching (a logical set of) pods even as underlying pods are created/destroyed/rescheduled
  * **ClusterIP** = (default) exposeos service on internal IP within cluster (only reachable from inside cluster)
  * **ExternalName** = maps service to DNS name rather than a selector (acting as a CNAME record)
  * **LoadBalancer** = provisions an external load balancer (in cloud environments) that routes traffic to service
  * **NodePort** = exposes service on each node's IP at a static port (accessible from outside cluster via `{NodeIP}:{NodePort}`)
* **Service Mesh** = infrastructure layer that handls service-to-service communication and provides features like traffic management, observability, mutual TLS (eg Istio, Linkerd)
* **Volume** = directory containing data, accessible to containers in a pod to access/share data via filesystem

* _ArgoCD_ = blue-green
* _Argo Rollouts_ = Kubernetes controller that provides advanced progressive deployment strategies (canary, blue-green), replacing standard Deployment resource with custom Rollout resource
* _containerd_ = high-level container runtime (but lower-level daemon compared to Docker) that manages container lifecycle & sits between orchestrator & low-level runtimes (eg runc)
* _CRI-O_ = lightweight container runtime built specifically for Kubernetes implementing CRI with minimal overhead
* _Flagger_ = Kubernetes operator for progressive delivery, working alongside standard Deployments & manages canary resources automatically
* _Kustomize_ = similar to Helm
* _Helm_ = package manager for Kubernetes that uses templated manifests (charts) to deploy & manage applications, helps reducing number of YAML manifest/configuration files
* _Minikube_ = cross-platform tool for running Kubernetes locally
* _Spinnaker_ = blue-green

## CLI

* **Kubectl** = CLI for communicating with a cluster's control plane using Kubernetes API

* `kubectl drain {node}` = evicts (ie rescheduled to other nodes if there are replicas) all pods from it so node can be taken offline for maintenance/upgrade/decommissioning/OS update
* `kubectl rollout undo {}` = roll  back a previous rollout

## TODO

* [AKS](https://preview.portal.azure.com)

# Azure

Azure provides more than 100 services that enable you to do everything from running your existing applications on virtual machines to exploring new software paradigms, such as intelligent bots and mixed reality.

## Quick Tips

* [Azure Portal](https://portal.azure.com)
* [Azure Portal (Preview)](https://preview.portal.azure.com) = sandbox
* [Microsoft Learn: Azure Fundamentals](https://learn.microsoft.com/en-us/credentials/certifications/azure-fundamentals) (AZ-900)

## Glossary

* **Azure Active Directory** = provides single sign-on, multifactor authentication, conditional access
* **Azure Advisor** = provides (admin/developer) recommendations for potential improvements on installed services (cost, performance, reliability (eg backups, redundancy), security (eg 2FA), operational excellence)
* **Azure Analysis Services** = (à la SSAS)
* **Azure API Management** (APIM) = API Gateway with caching/discoverability/observability/security, a management plane (for administration), and developer portal (a customizable API documentation website for consumers)
* **Azure Arc** = manage hybrid cloud environment (whether private, public, hybrid, multi)
* **Azure Cloud Solution Provider** = Microsoft-partner intermediary that resells MS cloud products (Microsoft 365, Azure, Dynamics) to customers at their set price then manages their relationship, billing, support
* **Azure Data Factory** = (à la SSIS)
* **Azure Devops** (formerly Team Foundation Server) = end-to-end application lifecycle CI/CD DevOps pipelines (version control, requirements/project/release management, automated builds, testing)
  * **Artifacts** = manages project dependencies (eg nuget packages, tools) & deliverables (release (CI/CD) outputs)
  * **Boards** = track work (à la Jira)
  * **Pipelines** = automated CI/CD workflows (build, test, deploy)
  * **Repos** = code collaboration & versioning for project & deliverables
  * **Test Plans** = manual/exploratory testing
* **Azure DevTest Labs** (PaaS) = unified service sandbox environment for developers/testers to provision/run/deallocate/delete self-managed VMs to try different configs, ruled by admin policies
* **Azure Event Grid** = fully managed serverless publishers topics to subscribers message routing service, for event-based & near-realtime applications, able to react to Azure services events (eg a VM was created)
* **Azure Logic App** (PaaS) = serverless enterprise integration service for orchestration of business processes & applications workflowcharts via a no-code visual GUI (à la Zapier), with I/Os connectors (eg storage, web, e-mails)
* **Azure Notification Hub** = push notifications
* **Azure Resource Manager** (ARM) = shared layer for all Azure UIs (portal, REST, PowerShell, CLI, SDKs eg C#) to manage resources
* **Azure Resource Manager Template** = declarative JSON-like script language to define resources
* **Azure Service Bus** = entreprise message broker (à la RabbitMQ) with topics & subscriptions
* **Azure Service Fabric** = distributed systems platform to package/deploy/manage scalable reliable microservices & containers
* **Azure Stack Hub** = extension that provides a way to run apps in an on-premises environment and deliver Azure services in your datacenter
* **Azure VMware Solution** = runs VMware on cloud (for when configured VMware on-premise and want to move it to cloud)
* **Dynamics** = Microsoft's line of business applications for day-to-day operations like sales/accounting/customer support, or in short Microsoft’s suite of CRM and ERP software
* **Microsoft Foundry** (formerly Azure AI Studio) = unified AI development platform for building popular LLM-powered applications & agents tailored to specific business needs at enterprise scale
* [Microsoft Marketplace](https://marketplace.microsoft.com) = 1st-party (Azure) & 3rd-party products/services (ie IaaS, PaaS, SaaS) shop
* **Power BI** = Microsoft's analytics & visualization reporting (à la SSRS, part of **Microsoft Power Platform** or embedded in **Azure**)
* **Resource** = specific deployed instance of a service, with its own configuration (as a JSON template) & lifecycle
* **Resource Group** = logical container for resources, organized by type (all DBs together, all web servers together), by application lifecycle (one group with DB/web/VM/storage), by department, by billing or location/region
* **Scope** = hierarchical tree organization of entities on which configurations can be broadly/granularly applied, with top-down inheritance to lover level subtrees
  * **Management Group** (root) > **Subscription** (paying) > **Resource Group** > **Resource**
* **Service** = category/offering that defines what kind of resources you can create and their capabilities (eg a DB, VM, web server/service)
* **Service Lifecycle** = phases of a Microsoft service (**not** a user custom application)
  * **Development** = being built
  * **Private Preview** = release to a narrower audience (MS employees, MvPs, regional directors), covered by an NDA (à la Apple _TestFlight_)
  * **Public Preview** = beta version to let customers experiment & provide feedback, at discounted price, but no guaranteed SLA (ie 0% SLA) so designed for testing not production
  * **General Availability** (GA) = service is official, might still get improved with new features over time
* **Tag** = simple key-value extra metadata information applied to resource/resource group/subscription scopes (but they are not inherited by default, except via Azure Policy), that can then be used eg for filtering
  * Typically categorize by function (eg _environment=production_), policies used (eg _classification=restricted_), finance/accounting for billing a department (eg _department=finance_), collaboration (eg _spoc=koko_)
* Interfaces
  * **Azure CLI** = manage Azure through multi-platform (Python) more-Unix-like command terminal (`az login` to login, `az group list/create` to list/create resource groups, `az vm create` to create VMs)
  * **Azure Cloud Shell** = cloud-based scripting environment, ie a CLI/PowerShell to manage Azure from anywhere via scripts, based on Ubuntu container
    * Multiple client interfaces/integration = Azure Portal, [Shell Portal](https://shell.azure.com), VS Code extension, Windows Terminal, Azure Mobile App, Microsoft Docs (run code inline from documentation snippets)
  * **Azure Portal** = public web-based customizable gateway/interface/platform to self-manage Azure resources, for simple tasks (<https://portal.azure.com>)
  * **Azure PowerShell** = manage Azure through a PowerShell command terminal (`Connect-AzAccount` to login, `Get/New-AzResourceGroup` to list/create resource groups, `New-AzVm` to create VMs)

### Compute Services

* **Azure App Services** (Paas) = web (GUI) application or (API) services, supports multiple programming languages & containers
* **Azure Container Instances** (Paas) = run a (serverless because we don't need to manage underlying server) container in Azure, with medium scalability
* **Azure Kubernetes Service** (AKS, Paas) = open-source container orchestration platform, highly scalable & customizable
* **Azure Functions** (Paas or FaaS) = highly scalable serverless coding PaaS (similar to app services) with granular pricing for micro/nano-services, in popular languages/frameworks (.NET/Java/Python/PowerShell)
* **Azure Virtual Machines** (IaaS) = custom software & requirements, specialized, high degree of control
* **Azure Virtual Machine Scale Sets** (IaaS) = auto-scaled (from marketplace or custom-made) images across multiple identical VMs (ie a IaaS) hidden behind a load balancer handling traffic from users

### Network Services

* **Azure Application Gateway** = load balancer & firewall for (public) web traffic to/from VMs or (web) app services, provides redirections, session affinity, URL routing, SSL termination
* **Azure Content Delivery Network** (CDN) = caches/distributes static content (eg JS, CSS, images, static HTML pages) via **Points of Presence** (PoP) all around the world to minimize latency
* **Azure DDoS Protection** = blocks malicious traffic while keeping legitimate requests in, also prevents auto-scaling that could result from increased volume of malicious requests
  * Comes in 2 tiers: **Basic** is free & automatically enabled for all installed services, **Standard** is paying and provides additional capabilities (uses machine learning to analyze traffic patterns for accuracy)
* **Azure Firewall** (PaaS) = managed cloud-based high availability scalable firewall service, integrates with Azure Monitor for logging/analytics
* **Azure Load Balancer** = distributes bidirectional non-web traffic across VMs for scaling (eg two VMs in different zones behind a single load balancer guarantees availability from 99.9% to 99.99% as per Microsoft SLA)
* **Azure Virtual Network** = cloud emulation of physical network infrastructure connects & protects resource (cloud & on-premise), divided into subnets, belongs to one region, linked to others via **VNet Peering** or VPN Gateway
  * **Azure Application Security Groups** (ASG) = groups VMs located in Virtual Network to reduce maintenance effort (ie assign ASG instead of explicit IP addresses)
  * **Azure Network Security Groups** (NSG) = filters in/outbound traffic to/from resources located in Virtual Network according to rules (source/destination IP ranges, port ranges, protocol, direction, priority)
  * **Azure Route Server** = dynamic routing between NVAs & Azure Virtual Networks
  * **Network Virtual Appliance** (NVA) = VM images optimized for certain tasks (firewall, gateway/router), including top industry 3rd-party brands
  * **User-Defined Routes** (UDR) = establish custom routes to override Azure default routing or add new routes, configured via a Route Table resource
  * **Subnet** =  effective address allocation unit, with network filtering via **Network Security Groups** (NSG, ie a sort of firewall/network rules) or **Application Security Groups** (ASG)
* **Azure VPN Gateway** = connects cross-regional VNs to each other, or to on-premise environment (encrypted over public internet)

### Storage Services

* **Azure Disk Storage** = provides persistent drive storage to VM/apps via cloud disk emulation (à la Windows _C:_), comes in different sizes, types (HDD/SSD), performance tiers (hence price)
* Storage Account = highly durable (99.999999999%) & scalable (PB of data) group of storage services to store files, messages & semi-structured data
  * **Azure Blob Storage** = store data as unstructured blobs (eg objects or files) grouped in containers
  * **Azure Files** = file shares, accessible via SMB shared drive protocol (à la Windows _Map network drive…_), to extend on-premise file shares or implement lift-and-shift scenarios
  * **Azure Queue Storage** = messaging service to process small messages asynchronously in a queue (à la RabbitMQ)
  * **Azure Tables Storage** = semi-structured NoSQL DB for when foreign joins/keys, relationships or strict shema are not needed, for fast access
* Storage Tiers
  * _Hot_ = live, frequently accessed data
  * _Cool_ = infrequently accessed data (lower availability, high durability, cheaper eg for backups)
  * _Archive_ = rarely (if-ever) accessed data (longest access times eg in hours, cheapest)

### Database Services

* **Azure Cosmos DB** = globally distributed (easily replicated across regions) low-latency (< 10ms for small objects) semi-structured multi-model (both NoSQL & vector) DB service, organized as collections (instead of tables)
  * Implemented over many APIs (SQL, MongoDB, Cassandra, Gremlin, Table Storage) so has relational or graph or distributed capabilities
* **Azure SQL** = family of SQL DBs with backup, replication, security, monitoring, OS auto-updates capabilities
  * **Azure SQL Database** (PaaS or DBaaS) = structured relational SQL DB (à la Microsoft SQL Server)
  * **Azure Database for MySQL** = open-source MySQL DB
  * **Azure Database for PostgreSQL** = open-source PostgreSQL DB
  * **Azure SQL Elastic Pool**
  * **Azure SQL Managed Instance** (PaaS) = Microsoft-managed (takes care of OS updates, DB backups) SQL Server engine with same capabilities as on-premise (more custom hence expensive)
  * **Azure SQL VM** (IaaS) = full-fledged SQL Server installed on Windows or Linux VM (with low-level sysadmin/OS access)

### IoT

* **Azure IoT Central** (SaaS) = application delivery platform to build IoT applications from industry-standardized templates rather than from scratch, with device management & centralization purposes
* **Azure IoT Hub** (PaaS) = highly secure/scalable/reliable managed service for bi-directional communication, with programmable SDKs for popular languages (C, C#, Java, Python, Node.js) & multiple protocols (HTTPS, AMQP, MQTT)
  * [Raspberry Pi Azure IoT Web Simulator](https://azure-samples.github.io/raspberry-pi-web-simulator) = hardware emulator to play & use a IoT client to Hub
* **Azure Sphere** = IoT application development platform with integrated communications & end-to-end security features, composed of a standardized chip, OS & service
  * **Sphere OS** = Linux-based OS on which to run IoT apps
  * **Sphere chips & hardware** = Sphere-certified (SoC) chips & hardware
  * **Sphere Security Service** (AS3) = cloud-based service for secure communication between cloud & IoT device, for maintenance/update/control of their chips

### Big Data

* **Azure Databricks** (PaaS) = Apache Spark based collaborative (between data engineers & analysts) analytics platform for large scale data transformation, with unified workpace for notebooks/clusters/data/access management
* **Azure HDInsight** (PaaS) = flexible fully-managed multi-purpose big data platform handling clusters in multiple open-source Apache technologies (Spark, Storm, Hadoop, HBase, Hive, Kafka)
* **Azure Synapse Analytics** (PaaS, formerly Azure SQL Data Warehouse) = modern end-to-end big data warehousing/analytics platform, ingest from sources (DB, files, web services), transform, store & serve analytics
  * **Synapse Studio** = unified experience with **Synapse Pipelines** (Data Factory/ETL), Apache Spark, **Synapse SQL** (SQL pools, SQL on-demand), integrates nicely with **Azure Data Lake Storage Gen2**

### AI

* **Azure Machine Learning** (PaaS) = cloud-based platform for creating/managing/publishing machine learning models
  * **Machine Learning Studio** = web portal for end-2-end development
  * **Machine Learning Workspace** = top-level resource
  * Author
    * **Automated ML** (AutoML) = run multiple algorithms/parameters combinations, choose best model
    * **Designer** = flowchart-style no-code visual designer to build ML models via D&D
    * **Notebooks** = build ML model via collection Microsoft or custom Python & R scripts
  * Assets = Datasets, Endpoints, Experiments, Models, Pipelines (orchestrate model training, deployment & management tasks)
  * Manage = Compute (compute resources), Datastores (connect to Azure storage eg Blob storage, file share), Data Labeling

### Costs

* **Azure Monitor** = find & scale down underutilized resources
* **Azure Monitor Application Insights** = OpenTelemetry feature of Azure Monitor that offers vendor-neutral Application Performance Monitoring (APM) for live web applications
* **Azure Pricing Calculator** = estimate costs, depends on **Resource Type** (eg VM/DB/Compute), **Services** offers/channels (Enterprise, CSP), **Location** (eg specific data center operation costs), **Bandwidth** (in/out)
* **Azure Total Cost of Ownership** (TCO) = compares costs of running workloads on-premises datacenter vs on Azure
* **Cost Management** = centralized self-service portal for monitoring/reporting usage & billing of Azure environment (can export billing information as a .csv on Blob storage)
  * **Advisor Recommendations** = cost recommendations
  * **Budgets** & **Cost Alerts** = track spending on Azure services, get alerts when nearing custom thresholds
  * **Cost Analysis** = high-level overview of subscriptions during current billing period per resource types (storage, VM, DDOS protection, DB, logic apps, etc)
* **Cost Reduction** = **Reservations**, **Spot Pricing**, **Azure Hydrid Benefit**
  * **Azure Hybrid Benefit** = reuse already purchased local on-premises licenses (eg RedHat, SQL Server, SUSE Linux, Windows) for on cloud VMs
  * **Reservations** = discount for static configurations (ie for stable workloads that don't require scaling), made for 1 (-30%) or 3 years (-60%)
    * **Reserved Instances** = Azure Virtual Machines
    * **Reserved Capacity** = Azure Storage, SQL Database vCores, Databricks DBUs, Cosmos DB RUs
    * **Software Plans** = Red Hat, Red Hat OpenShift, SUS Linux, etc
* 7 steps to minimizing costs
  1. **Azure Pricing Calculator** = choose low-cost region with good latency, all required services, data sovereignty/compliance requirements
  2. **Hybrid Benefit** & **Azure Reservations**
  3. **Azure Cost Management** monitoring/budgets/recommendations
  4. Understand service lifecycle & automate environments
  5. Use auto-scaling features
  6. Azure Monitor to find & scale down underutilized resources
  7. Use tags & policies (eg prevent expensive resources in dev/test environments) for effective governance

### Governance

* **Azure Blueprints** = defines a formula/makefile/script/design pattern as a reusable package of various artifacts (resource groups, ARM templates, policies, roles) to automate resources deployment/allocation/configuration
  * **Blueprint Definition** = describes what should happen (reusable package)
  * **Blueprint Assignment** = describes where it should happen (package deployment)
* **Azure Policy** = wider (governance/security/compliance/cost management) configuration rules to condition & effect resource operations
  * It constitutes a third level of validation once request properties & user permission have already passed
  * There are plenty of built-in policies defined by Microsoft (eg _Allowed locations_, _Allowed resource types_, _Allowed SKUs_, _Inherit resource tags_), and custom definitions can be added
  * **Policy Assignment** = assign a policy definition/initiative to a(ny) scope (or exclude them)
  * **Policy Definition** = defines what should happen, ie condition (if/else) & effect (deny/audit/append/modify/etc)
  * **Policy Initiative** = group of policiy definitions (to apply in bulk)
* **Azure Service Level Agreement** (SLA) = a promise of per-service's monthly availability (ie uptime & connectivity) in range 99% to 99.999%, with service credits given if not met (note that free/preview services provide no SLAs)
* [Microsoft Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework) (CAF) = best practices, documentation, guidance, guidelines, tools to help companies with cloud divided into 7 stages
  * **Azure Cost Management**, **Azure Pricing Calculator**, **Azure Total Cost of Ownership** (TCO) = helps business justification phase of strategy stage
  * **Organize** = transversal concern about roles & responsabilities, via **RACI** matrix (Responsible, Accountable, Consulted, Informed)
  1. Strategy = stakeholder **Motivations** triggers (migration or innovation), measurable **Business Outcomes**, **Business Justification** (financial ROI), First Project (currently operating, involved owner, small scope)
  2. Plan = **Digital Estate** (inventory of assets, five R's of rationalization: rehost, refactor, rearchitect, rebuild, replace), **Initial Organization Alignment**, **Skills Readiness Plan**, **Cloud Adoption Plan**
  3. Ready = **Azure Setup Guide**, **Azure Landing Zone**, **Extend Landing Zone**
  4. Adopt = **Migrate** (first migration, migration scenarios, best practices, process improvements), **Innovation** (business value consensus strategy, innovation guide tools, best practices, process improvements)
  5. Govern = define governance solutions (business needs, agility, control risks), manage cloud environments (stability & costs)
  6. Secure = protect workload against evolving cyber threats/vulnerabilities (implement zero-trust security controls, deploy continuous threat monitoring)
  7. Manage = operational excellence & continuous optimization (optimization, high availability SLA, continous improvement through automation/monitoring/DevOps best practices)

### Identity, Authentication & Authorization

* **Actions** = all that can be performed in Azure services (eg create a disk, start a VM, update a DB, deploy an app, change settings)
* **Azure Active Directory** = manages identity (users, groups, applications) & access (subscriptions, resources groups, roles, role assignments, authentication/authorization settings), and supports MFA by default
  * Not only for Azure but all Microsoft cloud platforms: Live.com (Outlook, Skype, OneDrive), Microsoft/Office 365 (Power BI, Teams), and also user custom apps
  * It is also possible to use same account in both on-premises & cloud environment through sync services, enabling hybrid cloud
* **Azure Defender for Cloud** = Microsoft's CNAPP for comprehensive code-to-runtime security, composed of three core components
  * **Cloud Security Posture Management** (CSPM) = check/improve security posture of cloud resources
  * **Cloud Workload Protection Platform** (CWPP) = defends workloads (VMs, containers, storage, DBs, serverless functions) from threats
  * **Development Security Operations** (DevSecOps) = manages code-level security across multicloud & multi-pipeline environments
* **Azure Key Vault** (PaaS) = centralized/logged/monitored secure storage for sensitive information: platform & application keys (eg disk encryption), secrets (eg DB login) & certificates
* **Azure Security Center** = centralized/unified infrastructure & platform security management service, feeds Azure Advisor more general recommendations, comes in two tiers:
  * **Azure Defender OFF** (free) = natively embedded/included in all Azure services, provides continuous assessments, security score, actionable security recommendations (à la Windows Security)
  * **Azure Defender ON** (paid) = hybrid security (through on-premises agents), threat protection alerts, vulnerability scanning, JIT VM access, etc
* **Cloud Native Application Protection Platform** (CNAPP) = unified solution combining multiple cloud security tools to protect applications across their entire lifecycle
* **Identity** = fact of being someone (eg user with username/password) or something (eg application or server, via secret keys or certificates)
* **Locks** = prevent accidental deletion and/or modification by locking down resource/group/subscription-scoped configuration (à la Unix `chattr ±i`) so that even owner cannot perform certain operations, in conjunction with RBAC
  * Only Owner & User Access Administrator built-in roles can manage locks
* **Managed Identity** = application account tied to a specific service
* **Microsoft Entra** = family of identity & network access products, let organizations implement Zero Trust security strategy, and verify/validate/check identity & permissions, OAuth/OIDC
* **Role-Based Access Control** (RBAC) = authorization system built on Azure Resource Manager, designed for fine-grained access management of resources
* **Role** = collection of actions that assigned identities will be able to perform (ie Microsoft default or custom named permissions, eg _DB Admin_ role can create/update a DB)
* **Role Assignment** = combination of role definition + security principal + scope
* **Security Principal** = Azure (identity) object (ie user/group/service principal/managed identity) that can be assigned a role (authorization context)
* **Security Principal Assignment** = _who can do it?_
* **Service Principal** = Azure application account

### Security, Privacy, Compliance

Documents & platforms to manage legal requirements and formalize security concerns between an organization's teams (business managers, administrators, security, legal).

* **Azure Compliance Documentation** = Azure-specific portal (besides Trust Center) providing compliance information divided into categories (national, US, industry, regional eg EU)
* **Azure Sovereigh Regions** = highly regulated environments with separate physically isolated Azure instances & lifecycle accessible to authorized personel only
  * **Azure Government** = US
  * **Azure China** = China (operated by a Chinese company called 21vianet, as Microsoft is US-based which conflicts with foreign interests rules)
* **Data Protection Addendum** (DPA) = document describing mutual obligations between an organization & Microsoft to process personal/customer data to use online services
* **Microsoft Privacy Statement** = document describing what how personal data is treated (collection, purpose, usage) for each services (Azure, Office, Surface, X-Box, Windows)
* **Online Services** = (eg Azure, Office 365, Bing Maps)
* **Online Services Terms** (OST) = document describing legal agreement (licensing terms about what users can/cannot do) to use online services
* **Trust Center** = a one-stop-shop website to review all info about security/compliance/privacy/policies/practices for all online services

## TODO

* Deploy a web app to Azure App Service (episode 9 @ 18:00)
* [Create an Azure resource](https://learn.microsoft.com/en-us/training/modules/describe-core-architectural-components-of-azure/7-exercise-create-azure-resource)

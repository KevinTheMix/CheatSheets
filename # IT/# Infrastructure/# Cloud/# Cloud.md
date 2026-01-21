# Cloud

## Quick Tips

* [Cloudflare: How are serverless computing and PaaS different?](https://www.cloudflare.com/learning/serverless/glossary/serverless-vs-paas)

## Glossary

* **Availability Geography** = discrete continent-wide market, containing two or more regions
* **Availability Region** = a group of data centres located in same geographical region (each region belongs to exactly one geography), constituted of several availability zones
  * **Region Pair** = each region is paired with another (fixed) region in same geography to maintain high connectivity, separated by at least 300 miles, also enables gradual updates rollout (A ok => B)
* **Availability Zone** = groups of data centres far enough to prevent large-scale outage but close enough to guarantee low latency
  * **Zonal** Service = lets user choose zone for deploying VM/storage
  * **Zone-Redundant** Service = replicate data/systems (eg DB) to multiple zones for redundancy
* **Big Data** = field of technology dealing with extraction/processing/analysis of data sets too large or complex for traditional data-processing software
* **CDN** (Content Distribution Network) = cloud-backed geographically-distributed data provider (eg **CloudFlare**)
* **Cloud Solution Provider** (CSP) = a provider of cloud services (eg Microsoft) to customers (ie users or organizations)
* **Consumption-Based Model** = compute/storage/network(-weighted) granular pay-as-you-go
  * Advantages = no upfront costs, use full potential of infrastructure (no wasted resources), pay for more when needed (eg Tomorrowland), stop paying when not needed
* **Data Center** = facility holding multiple servers, along with power source, cooling & rapid networking capabilities
* **Disaster** = serious disruption of services caused by natural or human-induced causes
* **Entreprise Resource Planning** (ERP) = software that runs a company's core internal operations in one place (eg accounting/financing, procurement, inventory/supply chain, manufacturing/operations, orders, reporting/compliance)
* **Functions** = event-driven serverless no-code applications
* **Massively Parallel (Processing)** = use large number of processors (or separate computers) to simultaneously perform a set of coordinated computations in parallel (eg a GPU)
* **No-code** = application creation via visual-based GUIs rather than programming, aimed at businesses
* **Provisioning** = order more resources (either manually or automatically via API/scripting)
* **Scale-to-Zero** = no active compute instances when there are no incoming requests/executions (so nothing to pay during that time)
* **Serverless** = cloud provider fully manages server provisioning, lifecycle & horizontal scaling as needed, while customer only pays for actual execution/usage
* **Service Level Agreement** (SLA) = formal agreement between a service provider (eg Microsoft) & a customer of a service's availability
  * **Composite SLA** = combined (ie not per-service) SLA of all components in your application (eg web server + DB), for a _AND_ formula of `availability S1 * availability S2`
  * When components are duplicated for redundancy, SLA formula becomes a logical _OR_ `100% - (unavailability S1 * unavailability S2)`
* **Shared Responsibility Model** = splitting upkeep responsabilities between cloud provider (eg physical security, power, cooling, network connectivity) & customer (data itself & its accesses)
* **Stock Keeping Unit** (SKU) = inventory management unique reference (eg an ID or barcode) common to identical items
* **Lift & Shift** (aka Rehosting) = migrate an existing application & surrounding environment (storage) as-is from one environment to another (eg send local VM to cloud)
* **VPS** (Virtual Private Server) = VM as a service (either IaaS but with fixed resources or Paas) by Internet hosting company simulating a dedicated physical server environment but actually shared with other users
* Characteristics
  * **HA/DR** = High Availability / Disaster Recovery
  * **Agility** = time to accessing extra resources
  * **Availability** = (often contractual) measure of system uptime (uptime divided by total time, per year/month/day, SLA number of nines eg 99.9%)
  * **Disaster Recovery** = ability to recover in event of a disaster (or right after it), by having redundant running machines or ready-to-go backups
  * **Durability** = preservation of data (or will data not get lost)
  * **Elasticity** = adapt/scale resources to current workload dynamically
  * **Fault Tolerance** = ability to remain up & running during component/service failures (resiliance to server or storage failures)
  * **Scalability** = increase performance on one machine (vertical) or increase number of machines (horizontal)
* Cloud Models
  * **Private** = in-house on-premise cloud (one customer)
  * **Public** = 3rd-party
  * **Hybrid** = both
  * **Multi** = multiple public
* Service Types
  * **Bare-Metal Server** (or Physical Server) = a non-VM non-shared machine
  * **BaaS** (Backend as a Service) = (eg **FireBase**)
  * **DBaaS** = DB PaaS
  * **FaaS** (Function as a Service) = individual stateless functions that are executed on demand (eg triggered in response to HTTP request, message/event, storage event, scheduled-based), without managing servers
  * **IaaS** (Infrastructure as a Service) = (dead) storage/networks/(running) servers + virtualization (if any) => provides base bare machine
  * **PaaS** (Platform as a Service) = OS + middleware (auth, logging, transactions) + development tools (eg DB, .NET, Java, IIS, Docker) => provides functional machine with OS & runtimes
  * **SaaS** (Software as a Service) = data & applications (ie you manage nothing but buy/subscribe off-the-shelf web app eg Outlook, One Drive)

### Delivery & Deployment

* **Feature Flags** = individual switches that control activation of newly added functionalities so they can be turned on/off (always off first in production) until cleaned up when ready, piloted remotely (eg Firebase Remote Config)

* **AppVeyor** = desktop CI/CD service used to build/test projects hosted on GitHub & co (GitLab, BitBucket)
* **Fastlane** = open source CLI automation toolkit for mobile app tasks (screenshots, beta, app stores, code signing), part of CI/CD pipeline (acquired by Google)
* **GitLab** = web-based DevOps for Git (wiki, issue tracking, CI)
* **Vercel** = cloud infrastruture, build & deploy (CI/CD), generates URL on git push

## Tools

* Amazon
  * **Amazon Web Services** (AWS) = cloud platform & API
  * **Elastic Compute Cloud** (EC2) = IaaS (virtual machines)
  * **Simple Storage Service** (S3) = objet storage via web services
* Apache
  * **Mesos** = open-source project to manage computer clusters (developed at UC Berkeley)
  * **Spark** = leading technology for big data analytics & transformation
  * **Storm** = cross-platform distributed & fault-tolerant realtime stream processing computation framework
  * **Hadoop** = collection of open-source software utilities for reliable/scalable distributed computing, a software framework for distributed storage & processing of bid data using MapReduce
  * **HBase** = open-source non-relational distributed DB (modeled after Google's Bigtable)
  * **Hive** = data warehouse software project built on top of Hadoop for providing data query & analysis
  * **Kafka** = open-source distributed event store & realtime stream-processing platform
* **AppSheet** = Google's no-code mobile/web app development platform
* **Appwrite** = open-source BaaS, all-in-one development platform (built-in backend infrastructure & web hosting)
* **Cloudflare** = CDN, cloud cybersecurity, DDoS mitigation, ICANN domain registration services
* **Couchbase** = NoSQL Cloud Database
* **DigitalOcean** = cloud IaaS/PaaS platform, where _Droplet_ is a (Linux) VM
* **Firebase** = Google's mobile/web apps development cloud platform (subject to privacy controversies)
* **Google Cloud Platform** (GCP) = suite of cloud computing services offered by Google (for computing, data storage, data analytics, machine learning)
* **Heroku** = cloud PaaS supporting several programming languages (ie _polyglot_, eg Node.js, Ruby, Java, PHP, Python, Go, Scala, Clojure, and others eg Elixir via Buildpacks)
* **Honeycode** = Amazon's no-code mobile/web app development platform
* [Hostinger VPS](https://www.hostinger.com/fr/vps)
* **Hystrix** = Netflix's microservices defensive circuitry (_not actively maintained_)
* **Lemon Squeezy** = online payment, handles local taxes
* **Linode** = Linux machines (over SSH, $0.01/hour)
* [MacinCloud](https://www.macincloud.com) = rent a Mac in the Cloud
* **Nextcloud** = in cloud or on-premises online collaboration platform, with an extension-based [app store](https://apps.nextcloud.com) (eg DICOM viewer)
  * **Nextcloud Hub** = integrated on-premises (ie self-hosted) platform with four key Nextcloud products (Files/Talk/Groupware/Office, basically Drive + Zoom + Outlook + Office)
* **openHAB** (open Home Automation Bus) = open-source home automation software (written in Java, by Eclipse)
* **Sevalla** = PaaS (use [Fireship](https://sevalla.com/fireship))
* **Shopify** = turnkey online stores for e-commerce entrepreneurs
* **Slack** = online text/mediasharing/videocalls team communication platform (à la Discord/Teams, by Salesforce)
* **Stripe** = online payment
* **Supabase** = open-source Firebase alternative (Postrgres DB, Authentication, instan APIs, Edge Functions, Realtime subscriptions, Storage, Vector embeddings)
* **Terraform** (_Hashicorp_) = infrastructure as code (cloud APIs as declarative configuration files)
* **Twilio** = CPaaS (Communications Platform as a Service), APIs for 2FA, SMS, voice, video, authentication
* **Webflow** = SF-based no-code website development & hosting SaaS

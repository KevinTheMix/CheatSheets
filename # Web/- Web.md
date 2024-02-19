# Web

## Glossary

* **Cookie** = small amount of strings
* **CSS Transitions** = easing effect for property values modifications
* [IndexedDB](https://javascript.info/indexeddb) = NoSQL DB of (JSON) objects manipulated via JS, maintained by W3C, as a much alternative to **Web storage** with fewer limits
  * [Guide](https://www.freecodecamp.org/news/a-quick-but-complete-guide-to-indexeddb-25f030425501)
* **PWA** (Progressive Web Application) = website augmented for mobile with near-full native features (ie push notification, desktop icon, work offline, high performance, access to the phone API)
* **REST** (Representational state transfer) = software architectural style with the following communication constraints/properties: Client-server, Stateless, Caching, Layered
* **REST vs SOAP**
  * REST is an architecture whilst SOAP is a protocol
  * REST uses JSON/HTML/XML whilst SOAP uses XML + envelope
  * REST uses HTTP CRUD calls whilst SOAP uses HTTP/TCP/UDP/SMTP
* **Server-Sent Events** = unidirectional (unlike WebSockets) server push technology (via HTTP connection)
* **Web SQL** = a now deprecated & unsupported wrapper around SQLite (it was never standard)
* [Web Storage](https://en.wikipedia.org/wiki/Web_storage) = `localStorage` (persistent per same origin) & `sessionStorage` (tab)
  * [Web Storage vs IndexDB](https://stackoverflow.com/a/37105645/3559724)
* **WebDAV** = HTTP extension methods on resources (_COPY_, _LOCK_, _MOVE_)

* **CDN** (Content Distribution Network) = cloud-backed geographically-distributed data provider (eg **CloudFlare**)
* **SaaS** = Software as a Service aka Software on demand. Subscription-based web app
* **IaaS** = Infrastructure as a Service, a cloud-based VM to setup & install apps on
* **BaaS** = Backend as a Service (eg **FireBase**)
* **PaaS** = Platform as a Service, a (DB/.NET/Java) platform space/repo on which to deploy such apps
* **Serverless computing** = cloud servers that are virtualized and treated as a single pay-per-use platform instead of discrete units
* **No-code** = application creation via visual-based GUIs rather than programming, aimed at businesses

### Tools

* **daisyUI** = **Tailwind CSS** components library (eg accordions, alerts, avatars, carousel)
* **Honeycode** = Amazon's no-code mobile/web app development platform
* **Jekyll** = open-source static site generator (written in Ruby)
* **Nginx** = web server often used as a load balancer (but also mail proxy, reverse proxy, HTTP cache)
* **Selenium** = open-source scripting/playback tools for automating web apps/browser tasks (eg for testing, debugging), for a variety of languages (eg C#, Java, JS, Python)
* **Shopify** = turnkey online stores for e-commerce entrepreneurs
* **Twilio** = communication APIs for SMS, voice, video, authentication

* **Amazon**
  * **Amazon Web Services** (AWS) = cloud platform & API
  * **Elastic Compute Cloud** (EC2) = IaaS (virtual machines)
  * **Simple Storage Service** (S3) = objet storage via web services
* **AppSheet** = Google's no-code mobile/web app development platform
* **AppVeyor** = desktop CI/CD service used to build/test projects hosted on GitHub & co (GitLab, BitBucket)
* **Couchbase** = NoSQL Cloud Database
* **Cloudflare** = CDN, cloud cybersecurity, DDoS mitigation, ICANN domain registration services
* **DigitalOcean** = cloud IaaS/PaaS platform (where **Droplet** = a VM)
* **GitLab** = DevOps for Git
* **Heroku** = Cloud Application platform (Node.js, Ruby, Java, PHP, Python, Go, Scala, Clojure, as well as all Linux run languages via buildpacks)
* **Power BI** = Microsoft's analytics & visualization reporting (part of **Microsoft Power Platform** or embedded in **Azure**)
* **Supabase** = open-source Firebase alternative (Postrgres DB, Authentication, instan APIs, Edge Functions, Realtime subscriptions, Storage, Vector embeddings)
* **Terraform** (_Hashicorp_) = infrastructure as code (cloud APIs as declarative configuration files)
* **Vagrant** (_Hashicorp_) = (à la Docker)
* **Webflow** = SF-based no-code website development & hosting SaaS

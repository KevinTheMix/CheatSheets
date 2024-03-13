# Web

* [Fireship](https://www.youtube.com/@Fireship)

## Glossary

* **Cookie** = small amount of strings
* _GraphQL_ (by _Meta_) = open-source data query/manipulation language for APIs
* [IndexedDB](https://javascript.info/indexeddb) = NoSQL DB of (JSON) objects manipulated via JS, maintained by W3C, as a much alternative to **Web storage** with fewer limits
  * [Guide](https://www.freecodecamp.org/news/a-quick-but-complete-guide-to-indexeddb-25f030425501)
* **REST** (Representational state transfer) = software architectural style with the following communication constraints/properties: Client-server, Stateless, Caching, Layered
* **REST vs SOAP**
  * REST is an architecture whilst SOAP is a protocol
  * REST uses JSON/HTML/XML whilst SOAP uses XML + envelope
  * REST uses HTTP CRUD calls whilst SOAP uses HTTP/TCP/UDP/SMTP
* **Server-Sent Events** (SSE) = unidirectional (unlike WebSockets) server-to-client push technology (via HTTP connection, once it's initially established)
* **Service Worker** = makes a web site/app behave like a native app, solves loss of connectivity issues, by enabling caching data locally & working offline-first (acts as a proxy for requests & responses)
* **Web SQL** = a now deprecated & unsupported wrapper around SQLite (it was never standard)
* [Web Storage](https://en.wikipedia.org/wiki/Web_storage) = `localStorage` (persistent per same origin) & `sessionStorage` (tab)
  * [Web Storage vs IndexDB](https://stackoverflow.com/a/37105645/3559724)
* **WebDAV** = HTTP extension methods on resources (_COPY_, _LOCK_, _MOVE_)

* _Emmet_ = text editors plugin for HTML & CSS (interprets complex snippets, cycle-browse through markup elements)
* _Jekyll_ = open-source static site generator (written in Ruby)
* _Nginx_ = web server often used as a load balancer (but also mail proxy, reverse proxy, HTTP cache)
* _Selenium_ = open-source scripting/playback tools for automating web apps/browser tasks (eg for testing, debugging), for a variety of languages (eg C#, Java, JS, Python)

* [web.dev](https://web.dev) = guidance by the Chrome team to build modern cross-browser web apps (eg accessibility, CSS, HTML, performance, privacy, PWA)

### Backend & Cloud

* **CDN** (Content Distribution Network) = cloud-backed geographically-distributed data provider (eg **CloudFlare**)
* **SaaS** = Software as a Service aka Software on demand. Subscription-based web app
* **IaaS** = Infrastructure as a Service, a cloud-based VM to setup & install apps on
* **BaaS** = Backend as a Service (eg **FireBase**)
* **PaaS** = Platform as a Service, a (DB/.NET/Java) platform space/repo on which to deploy such apps
* **Serverless computing** = cloud servers that are virtualized and treated as a single pay-per-use platform instead of discrete units
* **No-code** = application creation via visual-based GUIs rather than programming, aimed at businesses

* _Amazon_
  * _Amazon Web Services_ (AWS) = cloud platform & API
  * _Elastic Compute Cloud_ (EC2) = IaaS (virtual machines)
  * _Simple Storage Service_ (S3) = objet storage via web services
* _AppSheet_ = Google's no-code mobile/web app development platform
* _Cloudflare_ = CDN, cloud cybersecurity, DDoS mitigation, ICANN domain registration services
* _Couchbase_ = NoSQL Cloud Database
* _DigitalOcean_ = cloud IaaS/PaaS platform (where _Droplet_ = a VM)
* _Firebase_ = Google's mobile & web apps cloud platform
* _Heroku_ = Cloud Application platform (Node.js, Ruby, Java, PHP, Python, Go, Scala, Clojure, as well as all Linux run languages via buildpacks)
* _Honeycode_ = Amazon's no-code mobile/web app development platform
* _Hystrix_ = Netflix's microservice defensive circuitry (_not actively maintained_)
* **Lemon Squeezy** = online payment, handles local taxes
* _Nextcloud_ = in the cloud or on-premises services (basically Drive + Zoom + Outlook + Office), with an extension-based [app store](https://apps.nextcloud.com) (eg DICOM viewer)
  * _Nextcloud Hub_ = single on-premises platform for four Nextcloud online collaboration products (Files, Talk, Groupware & Office)
* _openHAB_ (open Home Automation Bus) = open-source home automation software (written in Java, by Eclipse)
* **Shopify** = turnkey online stores for e-commerce entrepreneurs
* **Slack** = online text/mediasharing/videocalls team communication platform (à la Discord/Teams, by Salesforce)
* **Stripe** = online payment
* _Supabase_ = open-source Firebase alternative (Postrgres DB, Authentication, instan APIs, Edge Functions, Realtime subscriptions, Storage, Vector embeddings)
* _Terraform_ (_Hashicorp_) = infrastructure as code (cloud APIs as declarative configuration files)
* **Twilio** = CPaaS (Communications Platform as a Service), APIs for 2FA, SMS, voice, video, authentication
* _Webflow_ = SF-based no-code website development & hosting SaaS

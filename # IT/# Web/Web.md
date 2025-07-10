# Web

## Quick Tips

* Include a referrer URL catcher (to index.php/master page) to find out where people come from (+ good for CSRF)

## Glossary

* **GraphQL** (by _Meta_) = open-source data query/manipulation language for APIs
* **Microfrontend** = web development pattern in which a single app may be built from disparate builds, à la microservices for client-side SPAs written in JavaScript (eg Spotify)
* **REST** (Representational state transfer) = software architectural style with the following communication constraints/properties: Client-server, Stateless, Caching, Layered
* **REST vs SOAP**
  * REST is an architecture whilst SOAP is a protocol
  * REST uses JSON/HTML/XML whilst SOAP uses XML + envelope
  * REST uses HTTP CRUD calls whilst SOAP uses HTTP/TCP/UDP/SMTP
* **Server-Sent Events** (SSE) = unidirectional (unlike WebSockets) server-to-client push technology (via HTTP connection, once it's initially established)
* **Service Worker** = makes a web site/app behave like a native app, solves loss of connectivity issues, by enabling caching data locally & working offline-first (acts as a proxy for requests & responses)
* **Shadow DOM** = DOM encapsulation/nesting technique, isolates (without barbaric iframes) inner DOM as a standalone component (eg CSS is contained)
* **Text Fragment** (`#:~:text=`) = (browser-specific) URL suffix to search & highlight a given string (if present) on web page
* **URL Rewriting** = rewrite a URL (eg turn GET parameters into URL fragments)
* **URL Slug** = human-readable last part of a URL address explaining its content as a non-technical ID
* **WebDAV** = HTTP extension methods on resources (_COPY_, _LOCK_, _MOVE_)
* **Web Components** = features supporting a standard web component model, allowing encapsulation & interoperability of HTML elements (Custom Elements, Shadow DOM, HTML Templates)
* **Web sockets** = communication protocol for two-way simultaneous channel over a single TCP connection

* [HTML-Kit](http://www.htmlkit.com) (build 292 = last free version)
* _HTTrack_ = Web crawler/copier (also as no install)
* _Jekyll_ = open-source static site generator (written in Ruby)
* _Nginx_ = FOSS **web server** (à la Apache HTTP) that can be used as a reverse proxy, load balancer (used for this by large fraction of web servers), mail proxy & HTTP cache
* [Opquast Web Quality Assurance Checklist](https://checklists.opquast.com/en/web-quality-assurance) = web page guidelines/rules
* _Plausible_ = Google Analytics alternative
* _Selenium_ = open-source scripting/record/playback tools for automating web apps/browser tasks (eg for testing, debugging), for a variety of languages (eg C#, Java, JS, Python)
* _Swagger_ = framework & tools for designing/documenting/consuming RESTful web services
  * **OpenAPI Specification** (OAS) = core of Swagger, a language-agnostic format describing APIs
  * _Swagger Codegen_ = generates client libraries, server stubs, API documentation from an OAS
  * _Swagger Hub_ = commercial platform with a collaborative environment for designing/documenting APIs
  * _Swagger Editor_ = open-source editor to write OAS
  * _Swagger UI_ = web-based UI automatically generated from a OAS, that documents an API and is able to make direct request/response to it
* [web.dev](https://web.dev) = guidance by the Chrome team to build modern cross-browser web apps (eg accessibility, CSS, HTML, performance, privacy, PWA)
* [Wix](https://www.wix.com) = build a website

### Storage

* **Cookie** = small amount of strings
* [IndexedDB](https://javascript.info/indexeddb) = NoSQL DB of (JSON) objects manipulated via JS, maintained by W3C, as a much alternative to **Web storage** with fewer limits
  * [Guide](https://www.freecodecamp.org/news/a-quick-but-complete-guide-to-indexeddb-25f030425501)
* **Web SQL** = a now deprecated & unsupported wrapper around SQLite (it was never standard)
* [Web Storage](https://en.wikipedia.org/wiki/Web_storage) = `localStorage` (persistent per same origin) & `sessionStorage` (tab)
* [Web Storage vs IndexDB](https://stackoverflow.com/a/37105645/3559724)

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
* _DigitalOcean_ = cloud IaaS/PaaS platform, where _Droplet_ is a (Linux) VM
* _Firebase_ = Google's mobile/web apps development cloud platform (subject to privacy controversies)
* _Heroku_ = cloud PaaS supporting several programming languages (ie _polyglot_, eg Node.js, Ruby, Java, PHP, Python, Go, Scala, Clojure, and others eg Elixir via Buildpacks)
* _Honeycode_ = Amazon's no-code mobile/web app development platform
* _Hystrix_ = Netflix's microservices defensive circuitry (_not actively maintained_)
* _Lemon Squeezy_ = online payment, handles local taxes
* _Nextcloud_ = in the cloud or on-premises online collaboration platform, with an extension-based [app store](https://apps.nextcloud.com) (eg DICOM viewer)
  * _Nextcloud Hub_ = integrated on-premises (ie self-hosted) platform with four key Nextcloud products (Files/Talk/Groupware/Office, basically Drive + Zoom + Outlook + Office)
* _openHAB_ (open Home Automation Bus) = open-source home automation software (written in Java, by Eclipse)
* _Shopify_ = turnkey online stores for e-commerce entrepreneurs
* _Slack_ = online text/mediasharing/videocalls team communication platform (à la Discord/Teams, by Salesforce)
* _Stripe_ = online payment
* _Supabase_ = open-source Firebase alternative (Postrgres DB, Authentication, instan APIs, Edge Functions, Realtime subscriptions, Storage, Vector embeddings)
* _Terraform_ (_Hashicorp_) = infrastructure as code (cloud APIs as declarative configuration files)
* _Twilio_ = CPaaS (Communications Platform as a Service), APIs for 2FA, SMS, voice, video, authentication
* _Vercel_ = cloud infrastruture, build & deploy (CI/CD), generates URL on git push
* _Webflow_ = SF-based no-code website development & hosting SaaS

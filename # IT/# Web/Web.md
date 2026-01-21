# Web

## Quick Tips

* Include a referrer URL catcher (to index.php/master page) to find out where people come from (+ good for CSRF)

## Glossary

* **ARIA** (Accessible Rich Internet Applications) = roles/attributes defining ways to make web applications more accessible
* **Core Web Vitals** = set of metrics defined by Google measuring real-world web user experience in 3 areas: loading, interactivity, visual stability
  * **Cumulative Layout Shift** (CLS) = measures visual stability (how much unexpected layout shift happens while loading)
  * **First Input Delay** (FID) = measures interactivity (how quickly a page responds to first user interaction)
  * **Largest Contentful Paint** (LCP) = measures loading performance (how fast main/largest visible content element becomes visible)
* **GraphQL** (by _Meta_) = open-source data query/manipulation language for APIs
* **Hydration** = making a server-rendered HTML page interactive by attaching client-side JavaScript behavior to it
* **Microfrontend** = web development pattern in which a single app may be built from disparate builds, à la microservices for client-side SPAs written in JavaScript (eg Spotify)
* **Progressive Web Application** (PWA) = app delivered via web, for browsers or as a mobile app with near-full native capabilities thanks to service workers (eg push notif, desktop icon, work offline, phone API access)
* **REST** (Representational state transfer) = software architectural style with the following communication constraints/properties: Client-server, Stateless, Caching, Layered
* **REST vs SOAP**
  * REST is an architecture whilst SOAP is a protocol
  * REST uses JSON/HTML/XML whilst SOAP uses XML + envelope
  * REST uses HTTP CRUD calls whilst SOAP uses HTTP/TCP/UDP/SMTP
* **Server-Sent Events** (SSE) = unidirectional (unlike WebSockets) server-to-client push technology (via HTTP connection, once it's initially established)
* **Server-Side Rendering** (SSR) = generates fully rendered HTML pages (generally from a JS backend), then JS may hydrate any interactive content afterwards (fast initial load, better SEO)
* **Service Worker** = makes a (progressive) web app behave like a native app, provides local caching for offline(-first) use, acts as a proxy for requests & responses, background sync, push notifications
* **Shadow DOM** = DOM encapsulation/nesting technique, isolates (without barbaric iframes) inner DOM as a standalone component (eg CSS is contained)
* **Single-Page Application** (SPA) = minimal HTML shell then JS-heavy web app dynamically (eg using AJAX) builds UI with data from a web server (instead of loading new full pages), making websites feel like native apps (eg Gmail)
* **Static Site Generation** (SSG) = static pages are pre-built ahead at build time and served as-is to user browser, then JS still loads (fast initial load, good for mostly-static content)
* **Text Fragment** (`#:~:text=`) = (browser-specific) URL suffix to search & highlight a given string (if present) on web page
* **URL Rewriting** = rewrite a URL (eg turn GET parameters into URL fragments)
* **URL Slug** = human-readable last part of a URL address explaining its content as a non-technical ID
* **WebDAV** = HTTP extension methods on resources (_COPY_, _LOCK_, _MOVE_)
* **Web Components** = features supporting a standard web component model, allowing encapsulation & interoperability of HTML elements (Custom Elements, Shadow DOM, HTML Templates)
* **Web Sockets** = bidirectional communication protocol for two-way simultaneous channel over a single TCP connection
* [Web Standard Project](https://www.webstandards.org) (WaSP) = was a web standardization (accessibility, uniformity) effort
  * **Acid3** = web test oage checking web browser's compliance with various web standards

* [HTML-Kit](http://www.htmlkit.com) (build 292 = last free version)
* _HTTrack_ = Web crawler/copier (also as no install)
* _Jekyll_ = open-source static site generator (written in Ruby)
* [Opquast Web Quality Assurance Checklist](https://checklists.opquast.com/en/web-quality-assurance) = web page guidelines/rules
* _Plausible_ = Google Analytics alternative
* **Selenium** = open-source tools & libraries for browser tasks automation (ie script/record/playback à la DOM AutoHotKey, eg for testing & debugging)
  * Uses a DSL (Selenese) to write tests for various languages (C#, Java, JS, Python)
* **Swagger** = framework & tools for designing/documenting/consuming RESTful web services
  * **OpenAPI Specification** (OAS) = machine-readable IDL for describing/procuding/consuming/visualizing web services, a language-agnostic (YAML or JSON) format that describes APIs
  * **Swagger Codegen** = generates client libraries, server stubs, API documentation from an OAS
  * **Swagger Editor** = open-source editor to write OAS
  * **Swagger Hub** = commercial platform with a collaborative environment for designing/documenting APIs
  * **Swagger UI** = web-based UI automatically generated from a OAS, that documents an API and is able to make direct request/response to it
* [web.dev](https://web.dev) = guidance by the Chrome team to build modern cross-browser web apps (eg accessibility, CSS, HTML, performance, privacy, PWA)
* [Wix](https://www.wix.com) = build a website

### PWA

* _Bubblewrap_ = set of CLI tools & libraries to create an Android app launching a PWA (via a Trusted Web Activity)
* _HNPWA_ (Hacker News Progressive Web App) = list of unofficial Hacker News client PWA in a variety of JavaScript-affine UI frameworks, to use as guide/examples
* _Lightouse_ = open-source Chrome DevTools extension (or Node module) that audits/scores a web page/app quality (with metrics, diagnostics, accessibility)
* [pwa-asset-generator](https://github.com/elegantapp/pwa-asset-generator) = generates (fav)icons/images for all size & their HTML/manifest declaration snippets
* **Trusted Web Activity** = way for an Android app to open a PWA (ie a PWA _is not_ the Android app, but gets launched by it)
* _Workbox_ = Chrome's boilerplate Service Worker library

### Storage

* **Cookie** = small amount of strings
* [IndexedDB](https://javascript.info/indexeddb) = NoSQL DB of (JSON) objects manipulated via JS, maintained by W3C, as a much alternative to **Web storage** with fewer limits
  * [Guide](https://www.freecodecamp.org/news/a-quick-but-complete-guide-to-indexeddb-25f030425501)
* **Web SQL** = a now deprecated & unsupported wrapper around SQLite (it was never standard)
* [Web Storage](https://en.wikipedia.org/wiki/Web_storage) = `localStorage` (persistent per same origin) & `sessionStorage` (tab)
* [Web Storage vs IndexDB](https://stackoverflow.com/a/37105645/3559724)

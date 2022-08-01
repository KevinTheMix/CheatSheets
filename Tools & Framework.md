# Tools

## Glossary

* PowerBuilder = SAP primarily CRUD DataWindow-based and .NET compatible IDE
* Plataformatec = Elixir's company (José Valim)
* Phoenix = Elixir's web framework
* Django = Python's web framework
* LYME = Erlang's LAMP

## Cloud & Platforms

* GitLab = web-based Git DevOps (wiki, issue tracking, CI)
* CDN (Content Distribution Network) = cloud-backed geographically-distributed data provider
  * CloudFlare
* SaaS = Software as a Service aka Software on demand. Subscription-based web app
* IaaS = Infrastructure as a Service. A cloud-based VM to setup & install apps on
* BaaS = Backend as a Service (e.g. FireBase)
* PaaS = Platform as a Service. A (DB/.NET/Java) platform space/repo on which to deploy such apps
* DigitalOcean = cloud IaaS/PaaS platform
  * Droplet = a VM
* Heroku = cloud app platform (Node.js, Ruby, Java, PHP, Python, Go, Scala, Clojure, as well as all Linux run languages via buildpacks)
  * [Elixir Heroku Buildpack](https://elements.heroku.com/buildpacks/hashnuke/heroku-buildpack-elixir)
* AWS = Amazon Web Services = cloud platform & API
* Serverless computing = cloud servers that are virtualized and treated as a single pay-per-use platform instead of discrete units
* EC2 (Elastic Compute Cloud) = IaaS (VMs)
  * S3 (Simple Storage Service) = objet storage via web services
* [Nginx](https://en.wikipedia.org/wiki/Nginx) = web server often used as a load balancer (but also mail proxy, reverse proxy, HTTP cache)

## Mobile & Web

* Android Studio = official Google android IDE
* Flutter = Google's open-source Dart-powered UI SDK for cross mobile/web/desktop applications from a single codebase
  * Dart = programming language developed by Google for building apps on multiple platforms, that can be compiled to native code or JavaScript
* Firebase = Google's mobile/web app development platform. Subject to privacy controversies
* [Deno](https://deno.land/) = JS runtime similar to Node.js, built for typescript natively
* [Astro](https://astro.build/) = HTML/CSS websites with less client-side JS
* [Progressive Web Application](https://en.wikipedia.org/wiki/Progressive_web_application) (aka PWA)
  * a website augmented for mobile with near-full native features, i.e. push notification, desktop icon, work offline, high performance, access to the phone API
* No-code = application creation via visual-based GUIs rather than programming, aimed at businesses
  * AppSheet = Google's no-code mobile/web app development platform
  * Honeycode = Amazon's no-code mobile/web app development platform
  * Webflow = SF-based no-code website development & hosting SaaS

## AI

* GPT-3 = Deep learning language model created by OpenAI that can process complex questions and even generate websites
* OpenAI = SF-based AI company founded by Elon Musk, Sam Altman & co
* DeepMind = British AI company acquired by Google

## Network & Security

* OTP (One-Time Pad) = Encryption technique that's unbreakable (even with quantum computing), but necessitate a key that's longer than the message, and that must be passed safely beforehand
* [WireGuard](https://en.wikipedia.org/wiki/WireGuard) = FOSS VPN (Ubuntu native)
* [DMZ](https://en.wikipedia.org/wiki/DMZ_(computing)) = network area that's neither internal or public, where public-faced (email/web) servers get placed.
  * Traffic with a DMZ is mostly one-way towards it, i.e. it has very limited connectivity towards the internal network (as much as the firewall allows basically).
  * In a DMZ, clients still connect "directly" (through the firewall) to different servers within the DMZ. That is unlike a reverse proxy that hides all the internal servers behind it.
* [Proxy](https://en.wikipedia.org/wiki/Proxy_server) = intermediary in a client-server network. Can be forward (at the client) or reverse (at the server).
* [Reverse proxy](https://en.wikipedia.org/wiki/Reverse_proxy) = server that retrieves resources on behalf of clients from one or more servers, as if they originated from it.
  * Can be used for security (as in a DMZ), caching, logging, monitoring user (employee) activty

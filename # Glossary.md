# Glossary

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
* REST (Representational state transfer) = software architectural style
  * with the following communication constraints/properties: Client-server, Stateless, Caching, Layered
  * REST vs SOAP
    * REST is an architecture whilst SOAP is a protocol
    * REST uses JSON/HTML/XML whilst SOAP uses XML + envelope
    * REST uses HTTP CRUD calls whilst SOAP uses HTTP/TCP/UDP/SMTP

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

## Multithreading

* [Multithreading](https://en.wikipedia.org/wiki/Multithreading_(computer_architecture)): _Ability of a single CPU (or CPU core) to provide multiple threads of execution concurrently_
* [Asynchrony](https://en.wikipedia.org/wiki/Asynchrony_(computer_programming)) = when the CPU control is able to be given up to a parent up the callstack while a low-level time-consuming operation is being executed. This enables to free up CPU resource for the GUI to refresh responsively and remain reactive - as opposed to frozen after each button click performing some operation
* [Concurrency](https://en.wikipedia.org/wiki/Concurrent_computing) = when different operations progress together or one after the other, usually by sharing their CPU time on the same unit
* [Parallel computing](https://en.wikipedia.org/wiki/Parallel_computing) = when multiple operations can be executed at the exact same instant. This is usually enabled by multi-core CPUs (and/or supercomputers), and is impossible on a single core CPU. Can be used to speed up a treatment that can be neatly broken down into parts, or even perform [speculative multithreading](https://en.wikipedia.org/wiki/Speculative_multithreading), a technique used to anticipate a user's action and preload parts of the application as s/he navigates, only to discard those paths not taken
* [Multi-core CPU](https://en.wikipedia.org/wiki/Multi-core_processor) = a CPU who possesses multiple computing units. Nowadays, most modern computers ship with 4 cores or more, therefore parallel computing has become a viable solution to consider in order to speed up some computational treatment
* [Process](https://en.wikipedia.org/wiki/Process_(computing)) = program execution instance run by one or any Threads. Is is an isolated environment within which a program is run. A default main Thread is launched at startup execution, and other Threads that get created within the Process share the same environment and memory
* [Multitasking](https://en.wikipedia.org/wiki/Computer_multitasking) = concurrent execution of multiple tasks over a certain period of time
* [Task](https://en.wikipedia.org/wiki/Task_(computing)) = a Process or a Thread
* [Thread](https://en.wikipedia.org/wiki/Thread_(computing)) = a program execution instance started by a Process
  * [Thread Pool](https://en.wikipedia.org/wiki/Thread_pool) = a set of Threads that can be allocated to run incoming queued up operations. This design alleviates the need to create and destroy Threads on demand, a costly operation when it's done with too high a frequence, by recycling a collection of usable pre-instantiated Threads
  * Foreground = maintains the application alive while it is running
  * Background = terminates abruptl as soon as the application closes. By default, new Threads are background Threads; this can be modified using the _IsBackground_ property
* [Preemption](https://en.wikipedia.org/wiki/Preemption_(computing)) = the act of temporarily interrupting a task being carried out by a computer system, without requiring its cooperation, and with the intention of resuming the task at a later time
  * Time slice = allotted amount of time for which a process is allowed to run in a preemptive multitasking system
* Compute-bound = Thread that spends most of its time performing CPU-heavy calculations. Regular Thread can turn into perpetual hungry compute-bound Thread if stuck in an infinite loop with no exit condition
* IO-bound = Thread that spends most of its time waiting for I/O operations to complete

### C# API

* `Parallel.ForEach()`
* `Task.Run()`

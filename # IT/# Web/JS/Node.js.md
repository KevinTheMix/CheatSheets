# [Node.js](https://nodejs.org)

Cross-platform (Windows, Linux, Unix, macOS, etc) open-source JavaScript runtime environment running on Chrome's V8 JavaScript engine), that can execute JavaScript code outside a web browser.

Both NPM and Webpack (written in JS) are part of Node.js ecosystem and therefore rely on it to execute.

## Quick Tips

* See [npm & npx](./NPM.md)

## Glossary

* **Fast Node Manager** ([fnm](https://github.com/Schniz/fnm)) = Node.js version manager, built in Rust (via a *.node_version* file)
* **Node Version Manager** = used to retrieve a specific version of Node
* **Node Version Switcher** ([nvs](https://github.com/jasongin/nvs)) = cross-platform tool for switching between versions and forks of Node.js

### Frameworks

* **Axios** = promise-based HTTP client, isomorphic for both client (browser) & server (Node.js)
* **Blitz.js** = *Next.js* fullstack toolkit
* **Deno** = JavaScript runtime similar to *Node.js* (by its creator), built for TypeScript natively (& WebAssembly) based on V8 engine & Rust
* **Electron** = build cross-platform desktop apps with JavaScript/HTML/CSS
* **Express** = fast unopinionated minimalist web framework (HTTP listen)
* **forever** = CLI tool letting a given script run forever (restart on error)
* [JSON Placeholder](https://jsonplaceholder.typicode.com) = free fake and reliable API for testing and prototyping
* [JSON Server](https://github.com/typicode/json-server) = fake REST API (with zero coding, for front-end developers who need a quick back-end for prototyping & mocking)
* **NestJS** = progressive Node.js framework for building efficient, reliable, scalable server-side (backend) applications
* **Next.js** (by *Vercel*) = *React*-based open-source web development framework for SSR & SSG (also has PWA plugin)
* **Playwright** = Node.js library for (headless or real browser) Chromium, Firefox & WebKit automation
* **Proton Native** = create desktop applications (ie like **Electron**) using React (Native) syntax, with Hot reload
* **Puppeteer** = Node.js library for headless Chrome/ium automation over DevTools Protocol, providing high-level API control (eg browse, screenshot, interact, macro/automate)
* **React** = FOSS front-end (JavaScript) library for building UIs based on components, can be used to develop SPAs, mobile or server-rendered apps (via additional frameworks eg *Next.js*), uses virtual DOM
  * See [JSConf - Rethinking best practices](https://www.youtube.com/watch?v=x7cQ3mrcKaY) = loosely coupled UI, components are idempotent (*render*) functions
  * See [Dan Abramov - Making Sense of React Hooks](https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889)
  * Class component = à la Flutter StatefulWidget
  * Functional component = à la Flutter StatelessWidget (except with hooks, they become stateful as well)
* **React Capacitor** = native mobile apps with web technology & React
* [React Hooks](https://medium.com/@dan_abramov/making-sense-of-react-hooks-fdbde8803889) = compressing/defragmenting/regrouping lifecycle-tied logic
* **React Native** = open-source cross-platform (mobile, web, desktop, VR) UI framework, native components for each platform via JS bridge, provides base components & leaves community implement (3rd party) packages
  * Uses a virtual-DOM-like virtual widgets tree, which helps not going through the costly JS bridge
  * Uses a *bridge*, ie some kind of adapter that exposes native UI components/widgets to let JavaScript (ie app logic) *pilot* them
* **SST** = *Next.js, Svelte or Astro* AWS front/backend platform
* **Svelte** = component UI framework using a compiler to turn declarative components written in HTML, CSS and JavaScript into lean, tightly optimized JavaScript
* **SvelteKit** = (meta)framework on top of Svelte to build robust, performant web applications (à la Next or Nuxt)
  * [Interactive tutorial](https://svelte.dev/tutorial/kit/introducing-sveltekit)
* **Vite** = build tool & development server
* *webpack* = a module bundler for JavaScript applications, takes all project files (JS, CSS, images, etc), treats them as modules, builds a dependency graph, output bundlers that browsers can load efficiently

## Environment

* `NODE_EXTRA_CA_CERTS=<path>` = PEM file of extra CA certificates trusted on top of Node's bundled Mozilla store (read once at startup)
  * Eg for a corporate TLS-inspecting proxy (*Zscaler*) re-signing HTTPS, else `SELF_SIGNED_CERT_IN_CHAIN` / `fetch failed`
* `NODE_USE_SYSTEM_CA=1` = trust the OS certificate store (Windows/macOS/Linux) instead of only the bundled one (Node 22.15+/23.8+, same as `--use-system-ca`)
  * No need to export/maintain a PEM file, so preferable to `NODE_EXTRA_CA_CERTS` when the OS already trusts the corporate CA
  * Applies to all Node-based tools (*npm*, MCP servers, etc)

## API

* `process.env` = Environment variable (*/.env* file contains global variables, */.env.development*, */.env.production*, etc.)

## CLI

* `node --version`

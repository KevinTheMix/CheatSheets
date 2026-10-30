# [NPM](https://www.npmjs.com)

Package manager in JavaScript for JavaScript (shipped with Node.js), using a *package.json* file to define package dependencies & (build/run/test) command aliases.
Ease download & install of all packages dependencies & exposes commands to initiate building the current project.

## Quick Tips

* [What are NPM, Yarn, Babel, and Webpack; and how to properly use them?](https://medium.com/front-end-weekly/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987)

## Glossary

* *.npmrc* = npm configuration file, defines registry location (public or company-private), authentication (gitignored secret token or env var), install behavior, proxy/network settings
  * Can be defined at multiple levels (project, user, global)
* *npx* = CLI that runs arbitrary command from an *npm* package (comes bundled with it) installed locally (without installing it globally) or fetched remotely, also to execute local scripts in *node_modules/.bin*
* Semantic Version = **major.minor.patch**
  * `~` = specified version or latest patch (eg `~1.0.1` is `1.0.1` up to `1.0.9`)
  * `^`= specified version or latest minor or patch (eg `~1.0.1` is `1.0.1` up to `1.9.9`)

## CLI

Requires *Node.js*, preferably LTS (Long-Term Support) version (minimum 8.9+).

* `npm --version`
* `npm init` = creates *package.json* file
* `npm i(nstall)` = install all (missing) dependencies found in *package.json* into local **node_modules** folder (à la `flutter pub get`)
  * `<package>` = install a specific package (from public NPM cloud) into into local **node_modules** & *package.json* (eg `npm i npm` updates NPM itself)
    * `@` = indicates a npm scope (ie a namespace eg *@angular* official packages developed by Angular team eg `npm i -g @angular/cli` for Angular CLI)
  * `-g` = install globally (eg PATH environnement variable to make it accessible in CLI/shell/etc)
  * Stop (then restart) any server before running this command
* `npm list -g --depth=0` = lists top-level packages
* `npm ls` = lists ALL installed packages including sub-dependencies
* `npm run <alias>` = executes one aliased command defined as *scripts* section in *package.json*
* `npm run <command_key>` = instantiates a shell and execute the command corresponding to (arbitrary) key/label found in *Script* section of *package.json* file
* `npm run build` = executes command found in *package.json*, which typically builds app for production to build folder
  * Eg *build* key may target `vue-cli-service build`, which in turn accomplishes build "end-to-end", ie bundling (via Webpack - see <https://v3.cli.vuejs.org/guide/cli-service.html#vue-cli-service-inspect>), minifying JS, transpiling SASS & TS, etc
  * See <https://stackoverflow.com/a/48614507>
  * See <https://github.com/facebook/create-react-app#npm-run-build-or-yarn-build>
* `npm serve` = build & serve app (watches served files for changes & update view accordingly in real-time)
* `npm update` = updates all package in **node_modules** to latest semver allowed by *package.json* ranges

### NPX

* `npx <package>[@<version>] [args]` = run a package's binary, from local dependencies (*node_modules/.bin*) if found, else fetched into npm cache first (prompts before installing)
  * `--package=<package>` = package to install when its binary name differs (place options before positional arguments)
  * `--yes` = skip install prompt (assumed in CI/non-TTY)
  * A version specifier (eg `@latest`) only matches a local dependency with that exact version, otherwise always fetched from registry
  * `npx @sentry/wizard@latest -i flutter` = run latest Sentry Wizard (`-i` is a Wizard option, not npx)
  * `npx eslint .` = run local ESLint on current folder
  * `npx vite` = run local Vite dev server

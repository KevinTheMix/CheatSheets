# [NPM](https://www.npmjs.com)

Package manager in JavaScript for JavaScript (shipped with Node.js), using a _package.json_ file to define package dependencies & (build/run/test) command aliases.
Ease download & install of all packages dependencies & exposes commands to initiate building the current project.

## Quick Tips

* [What are NPM, Yarn, Babel, and Webpack; and how to properly use them?](https://medium.com/front-end-weekly/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987)

## Glossary

* Semantic Version = **major.minor.patch**
  * `~` = specified version or latest patch (eg `~1.0.1` is `1.0.1` up to `1.0.9`)
  * `^`= specified version or latest minor or patch (eg `~1.0.1` is `1.0.1` up to `1.9.9`)

## CLI

Requires _Node.js_, preferably LTS (Long-Term Support) version (minimum 8.9+).

* `npm --version`
* `npm init` = creates _package.json_ file
* `npm i(nstall)` = install all (missing) dependencies found in _package.json_ into local **node_modules** folder (à la `flutter pub get`)
  * `<package>` = install a specific package (from public NPM cloud) into into local **node_modules** & _package.json_ (eg `npm i npm` updates NPM itself)
    * `@` = indicates a npm scope (ie a namespace eg _@angular_ official packages developed by Angular team eg `npm i -g @angular/cli` for Angular CLI)
  * `-g` = install globally (eg PATH environnement variable to make it accessible in CLI/shell/etc)
  * Stop (then restart) any server before running this command
* `npm list -g --depth=0` = lists top-level packages
* `npm ls` = lists ALL installed packages including sub-dependencies
* `npm run {command_key}` = instantiates a shell and execute the command corresponding to (arbitrary) key/label found in _Script_ section of _package.json_ file
* `npm run build` = executes command found in _package.json_, which typically builds app for production to build folder
  * Eg _build_ key may target `vue-cli-service build`, which in turn accomplishes build "end-to-end", ie bundling (via Webpack - see <https://v3.cli.vuejs.org/guide/cli-service.html#vue-cli-service-inspect>), minifying JS, transpiling SASS & TS, etc
  * See <https://stackoverflow.com/a/48614507>
  * See <https://github.com/facebook/create-react-app#npm-run-build-or-yarn-build>
* `npm serve` = build & serve app (watches served files for changes & update view accordingly in real-time)
* `npm run <alias>` = executes one aliased command defined as _scripts_ section in _package.json_
* `npm update` = updates all package in **node_modules** to latest semver allowed by _package.json_ ranges

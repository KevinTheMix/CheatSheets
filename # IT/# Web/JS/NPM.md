# [NPM](https://www.npmjs.com)

Package manager for JavaScript (shipped with Node).

    The main goal (...) is automated dependency and package management. This means that you can specify all of your project's dependencies inside your package.json file, then any time you (or anyone else) needs to get started with your project they can just run npm install and immediately have all of the dependencies installed. On top of this, it is also possible to specify what versions your project depends upon to prevent updates from breaking your project.

Source: <https://stackoverflow.com/a/31930422>

Downloads & installs all packages dependencies and also exposes commands to initiate building the current project.
Both package dependencies & building/running/testing commands shorthands are specified in the _package.json_ file.

## Quick Tips

* NPM is written entirely in JS, so it requires [a platform to run on i.e. Node.js](https://github.com/npm/npm/issues/12230#issuecomment-206332690), although [the downloaded packages can be used elsewhere outside Node.js](https://www.reddit.com/r/javascript/comments/98ceyi/using_npm_without_nodejs/e4evyay).
  * Besides Node.js also exposes various APIs & some modules that NPM may depend on (such as [filesystem API](https://stackoverflow.com/a/40087116)).
[What are NPM, Yarn, Babel, and Webpack; and how to properly use them?](https://medium.com/front-end-weekly/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987)

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

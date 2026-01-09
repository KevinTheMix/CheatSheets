# [NPM](https://www.npmjs.com)

Node Package Manager (unofficially).

    The main goal (...) is automated dependency and package management. This means that you can specify all of your project's dependencies inside your package.json file, then any time you (or anyone else) needs to get started with your project they can just run npm install and immediately have all of the dependencies installed. On top of this, it is also possible to specify what versions your project depends upon to prevent updates from breaking your project.

Source: <https://stackoverflow.com/a/31930422>

Downloads & installs all packages dependencies and also exposes commands to initiate building the current project.
Both package dependencies & building/running/testing commands shorthands are specified in the _package.json_ file.

## Environment

NPM is written entirely in JS, so it requires [a platform to run on i.e. Node.js](https://github.com/npm/npm/issues/12230#issuecomment-206332690), although [the downloaded packages can be used elsewhere outside Node.js](https://www.reddit.com/r/javascript/comments/98ceyi/using_npm_without_nodejs/e4evyay/).

Not only that, Node.js also exposes various APIs and some modules that NPM may depend on (such as [filesystem API](https://stackoverflow.com/a/40087116)).

## CLI

Requires _Node.js_, preferably LTS (Long-Term Support) version (minimum 8.9+).

* `npm init` = creates _package.json_ file
* `npm i(nstall) ({name})` = install all dependencies found in _packages.json_ into local _node\_modules_ folder (à la `flutter pub get`)
  * `-g @{package}`
  * Stop (then restart) any server before running this command
* `npm run {command_key}` = instantiates a shell and execute the command corresponding to (arbitrary) key/label found in _Script_ section of _package.json_ file
* `npm run build` = executes command found in _package.json_, which typically builds app for production to build folder
  * Eg _build_ key may target `vue-cli-service build`, which in turn accomplishes build "end-to-end", ie bundling (via Webpack - see <https://v3.cli.vuejs.org/guide/cli-service.html#vue-cli-service-inspect>), minifying JS, transpiling SASS & TS, etc
  * See <https://stackoverflow.com/a/48614507>
  * See <https://github.com/facebook/create-react-app#npm-run-build-or-yarn-build>
* `npm run serve` = build & serve app
  * Watches served files for changes, and update view accordingly in real-time
  * This command is actually an alias as defined in _package.json_.

## Misc

[What are NPM, Yarn, Babel, and Webpack; and how to properly use them?](https://medium.com/front-end-weekly/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987)

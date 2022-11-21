# NPM

Node Package Manager.

    The main goal (...) is automated dependency and package management. This means that you can specify all of your project's dependencies inside your package.json file, then any time you (or anyone else) needs to get started with your project they can just run npm install and immediately have all of the dependencies installed. On top of this, it is also possible to specify what versions your project depends upon to prevent updates from breaking your project.

Source: <https://stackoverflow.com/a/31930422>

Downloads & installs all packages dependencies and also exposes commands to initiate building the current project.
Both package dependencies & building/running/testing commands shorthands are specified in the _package.json_ file.

## Environment

NPM is written entirely in JS, so it requires [a platform to run on i.e. Node.js](https://github.com/npm/npm/issues/12230#issuecomment-206332690), although [the downloaded packages can be used elsewhere outside Node.js](https://www.reddit.com/r/javascript/comments/98ceyi/using_npm_without_nodejs/e4evyay/).

Not only that, Node.js also exposes various APIs that some NPM and modules may depend on (such as [filesystem API](https://stackoverflow.com/a/40087116)).

## CLI

Requires _Node.js_

* `npm init` = creates the _package.json_ file
* `npm run {command_key}` = instantiates a shell and execute the command corresponding to the (arbitrary) key/label found in the _Script_ section of the _package.json_ file
* `npm run build` = executes the command found in _package.json_, which typically builds the app for production to the build folder
  * E.g. the _build_ key may target `vue-cli-service build`, which in turn accomplishes the build "end-to-end", i.e. bundling (via Webpack - see <https://v3.cli.vuejs.org/guide/cli-service.html#vue-cli-service-inspect>), minifying JS, transpiling SASS & TS, etc.
  * See <https://stackoverflow.com/a/48614507>
  * See <https://github.com/facebook/create-react-app#npm-run-build-or-yarn-build>

## Misc

[What are NPM, Yarn, Babel, and Webpack; and how to properly use them?](https://medium.com/front-end-weekly/what-are-npm-yarn-babel-and-webpack-and-how-to-properly-use-them-d835a758f987)

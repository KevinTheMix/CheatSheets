# JavaScript

* \`Template string with ${variable}\`
* `{ ...object }` = spreads out the properties of an object. Used for shallow cloning.
* `${variable}` = string interpolation
* `if(variable)` = check if undefined
* `variable ? variable.property : ""` = check if unefined into ternary operator
* `aray.push`

## Eco-system

### Third-party Libraries

* [Lodash](https://lodash.com/) = extends the JavaScript language (deep cloning, debouncing, etc.)
* [date-fns](https://date-fns.org/) = Date manipulation
* [ag-Grid](https://www.ag-grid.com/javascript-grid-cell-editing/) = Grid
* [Axios](https://github.com/axios/axios) = HTTP & JSON API calls
* [JSON Server](https://github.com/typicode/json-server) = Fake backend REST API

#### [NPM](https://www.npmjs.com)

* Requires Node/NPM, preferably LTS (Long-Term Support) version (minimum 8.9+).
  * `npm i(nstall)` = install all the dependencies found in _packages.json_ into the local _node\_modules_ folder.
  * `npm install {name}`
    * Stop (then restart) any server before running this command
  * `npm install -g @{package}`
  * `npm run build` = create a production build
  * `npm run serve` = build & serve the app
    * Watches the served files for changes, and update the view accordingly in real-time
    * This command is actually an alias as defined in _package.json_.

## Language Syntax

### Variables

* `typeof(variable)` = return name of type of variable
* `process.env` = Environment variable
  * _/.env_ file contains global variables
    * _/.env.development_, _/.env.production_, etc.

### Flow

`if(condition) statement;`
`try {block} catch(error) {error_treatment}`
`throw Error(text);`

### Arrays

* [splice()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
  * `var removed_items = array.splice(index, howmany, item1, ....., itemX)`
* [unshift()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)

### Asynchronous Programming

Asynchronous method called without an await are fire & forget (unlike C#, where it would run synchronously, hence be blocking ). The await make the call blocking.

### Quirks

* [Spread Syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax): `...`
  * [Destructuring Assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
  * [Destructuring Objects](https://wesbos.com/destructuring-objects/)
  * [TypeScript Variable Declaration](https://www.typescriptlang.org/docs/handbook/variable-declarations.html)).
  * Used to shallow-clone by putting it back into another object: `{ ...original }`.
* [Computed property Name](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get): `[METHOD_NAME]()`

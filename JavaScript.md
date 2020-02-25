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
* [Axios](https://github.com/axios/axios) = HTTP & JSON API calls
* [JSON Server](https://github.com/typicode/json-server) = Fake backend REST API

#### [ag-Grid](https://www.ag-grid.com/javascript-grid-cell-editing/)

* [Rendering Flow](https://www.ag-grid.com/javascript-grid-rendering-flow/)
  * Field = Direct value.
  * Value Getter = Calculate displayed value based on anything e.g. multiple fields. Replaces direct field value.
  * Value Formatter = WPF's Converter e.g. parsing a date or formatting numbers.
  * [Cell Renderer](https://www.ag-grid.com/javascript-grid-cell-rendering/) = controls inner HTML.
    * [Cell Renderer Class](https://www.ag-grid.com/javascript-grid-cell-rendering-components/)
    * [Many Renderers, One Column](https://www.ag-grid.com/javascript-grid-cell-rendering/#many-renderers-one-column)
* [Input Flow](https://www.ag-grid.com/javascript-grid-editing-flow/)
  * Value Setter = Inverse of Getter, called when the user edits a cell e.g. the cell displays a fullname (but there's no such column in the data itself) bound to 2 different actual data (firstname + lastname)
  * Value Parser = WPF's Converter in the other direction, from the grid's user input to the data e.g. parsing a string into a number.
* [Row Styles](https://www.ag-grid.com/javascript-grid-row-styles/)
  * Row style = Provide entire style (conditionally or not)
  * Row class = Provide CSS class (conditionally or not)
  * Row class rules = Apply a set of CSS classes according to boolean expression
* [Cell Styles](https://www.ag-grid.com/javascript-grid-cell-styles/)
  * cellClassRules = an object containing CSS rules to apply to a cell according to a boolean expression using its value.
  * cellStyle = function that returns the complete inline style of a cell based on its value.

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
* [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)
  * `Number(rgb).toString(16)` # Display as Hexadecimal using [Number.prototype.toString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)

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

## Modules

There are two different types of export, named and default. You can have multiple named exports per module but only one default export.
See <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export#Description>

`export default { }`
`export default class`
`export default function()`

## TypeScript

Superset of JavaScript.
Can use all of JS features, but adds a layer of OO classes, static typing, casting, etc.

  class Child extends Parent { ... }

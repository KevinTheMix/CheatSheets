# JavaScript

* `document.write(html)` = old-school way to add HTML dynamically on a page
* `horse${horses.length}` template literal string interpolation
  * Advanced functional templating, passing template to a function that has access to the consecutive parameters (basically implementing a custom C# _String.Format()_ method) `function plural(s, count) { return ${s[0]}{count > 1 ? 's' : '' }; }` and `plural'horse${horses.length}'` (_but with backticks instead of single quotes_)
* `{ ...object }` = spreads out the properties of an object. Used for shallow cloning.
* `if(variable)` = check if undefined
* `variable ? variable.property : ""` = check if unefined into ternary operator
* Trailing (_dangling_) commas are useful to reduce the number of lines that change when git commit (the previous last row remains the same)

## Libraries

* [Lodash](https://lodash.com/) = extends the JavaScript language (deep cloning, debouncing, etc.)
* [date-fns](https://date-fns.org/) = Date manipulation
* [Axios](https://github.com/axios/axios) = HTTP & JSON API calls
* [JSON Server](https://github.com/typicode/json-server) = Fake backend REST API

### jQuery

* [scrollTop()](https://api.jquery.com/scrolltop/) = gets/sets vertical position of the scroll bar
* [offset()](https://api.jquery.com/offset/) = gets/sets the relative coordinates

### [ag-Grid](https://www.ag-grid.com/javascript-grid-cell-editing/)

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

### [NPM](https://www.npmjs.com)

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

* `array.shift()` pops the first element of an array and return it
* `array.unshift()` adds items to the beginning
* `array.push()`
* [splice()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
  * `var removed_items = array.splice(index, howmany, item1, ....., itemX)`
* `array.slice(start, end)`
* [unshift()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
* `array.reduce((accu, next) => acc + cur)` aggregate/accumulate
* `array.map(item => item * 1.1)` select
* `array.filter(item => item > 100)` where

### Asynchronous Programming

* `Promise.resolve(value)`
* `const ts = Promise.all([t1, t2, t3])`
  * `for (const t of await ts) { }`

`async` forces a function to return a promise
`await` blocks the code. Note that without it, the code is fire & forget (unlike C#, where it would run synchronously, hence be blocking).

Using consecutive `await`s prevents silly stairway code with too many `then()`.

### Quirks

* [Destructuring Objects](https://wesbos.com/destructuring-objects/)
  * `{ a, b, c } = obj;` can be used to explode an object's properties as method parameters (or assigning them as a const in the first line), so we don't have to repeat the _obj_ root whenever we access its property (i.e. `a` instead of `obj.a`)
* [Spread Syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax): `...`
  * [Destructuring Assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
  * [TypeScript Variable Declaration](https://www.typescriptlang.org/docs/handbook/variable-declarations.html)).
  * Used to shallow-clone by putting it back into another object: `{ ...original }`.
  * Can be used to create a new object comining two others: `const koko = { ...a, ...b }`
  * Can be used to shortcut multiple array push/unshift/splice to one-line e.g. `a = [...a, '1', '2', '3' ]`
* [Immediately invoked function expression](https://en.wikipedia.org/wiki/Immediately_invoked_function_expression)
* [Computed property Name](https://tylermcginnis.com/computed-property-names/)
  * Allows expressions to be computed as the name of a property (à la dictionary index key).
  * Uses `{ a, b, c }` to create a new objet from variables or `[]` to use a string as a key, which becomes the property.
  * Also see [Get](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get)
* Logging
  * `console.log({ a, b, c })` using computed property names
  * `console.log('%c Hellow', 'color: red')` using CSS style
  * `console.table([a, b, c])` if objects have the same properties
  * `console.time('myTimer')` then later `console.timeEnd('myTimer')`
  * `console.trace('hello')` displays call stack trace infos
  * See [Fireship JS Pro Times](https://www.youtube.com/watch?v=Mus_vwhTCq0)

## Modules

There are two different types of export, named and default.
You can have multiple named exports per module but only one default export.
The default export can be imported via a shorter syntax (no curly braces).
See <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export#Description>

`export default { }`
`export default class`
`export default function()`

## TypeScript

Superset of JavaScript.
Can use all of JS features, but adds a layer of OO classes, static typing, casting, etc.

  class Child extends Parent { ... }

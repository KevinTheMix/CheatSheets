# JavaScript

## API

* `typeof(variable)` = (name of) type of variable
* `process.env` = Environment variable
  * _/.env_ file contains global variables
    * _/.env.development_, _/.env.production_, etc.
* [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)
  * `Number(rgb).toString(16)` # Display as Hexadecimal using [Number.prototype.toString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)

* [Immediately invoked function expression](https://en.wikipedia.org/wiki/Immediately_invoked_function_expression) (IIFE)
* [Computed property Name](https://tylermcginnis.com/computed-property-names) = use expression result (string) as property name (eg `['koko']='kontan';` creates the object `{ koko: 'kontan' }`)
* [Get](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get) = getter method

* `{}` = [Destructuring Objects](https://wesbos.com/destructuring-objects) = decomposes an object's properties in the order they were defined (eg `{ first, second } = koko;`, where _koko_ could have more properties eg `third`)
* `...` = [Spread Syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) = destructure array items/object properties into distinct variables
  * Can be used for shallow-cloning (eg `{…a}={…b}`), recombining objects into more/fewer (eg `const koko = {…a,…b }`), pushing/(un)shifting/splicing arrays (eg `a = […a, '1', '2', '3' ]`)
  * [Spread operator](https://www.geeksforgeeks.org/javascript-spread-operator)
  * [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
* `f(...parameters)` = [Rest parameter](https://www.geeksforgeeks.org/javascript-rest-operator/), turns a list of (indefinite number of) function parameters into a single array
  * Then `const [first, second] = parameters` using [Destructuring](https://www.samanthaming.com/tidbits/20-destructuring-function-arguments)

### DOM & co

* Events (`onpaste`, `ondragstart`, `onKeyUp`, `onKeyDown`, `onKeyPress`)
* Logging
  * `console.log({ a, b, c })` using computed property names
  * `console.log('%c Hellow', 'color: red')` using CSS style
  * `console.table([a, b, c])` if objects have the same properties
  * `console.time('myTimer')` then later `console.timeEnd('myTimer')`
  * `console.trace('hello')` displays call stack trace infos
  * See [Fireship JS Pro Times](https://www.youtube.com/watch?v=Mus_vwhTCq0)
* [document.body.contentEditable](https://www.w3schools.com/jsref/prop_html_contenteditable.asp) = make one element editable
* [document.designMode](https://developer.mozilla.org/fr/docs/Web/API/Document/designMode) = make whole document editable
* `document.location.href` = go to local page or external url
* `document.write(html)` = old-school way to add HTML dynamically on a page
* `history.go(-1)` = go to history
* `window.confirm(message)` = return true/false ~ choice
* [window.navigator](https://www.w3schools.com/js/js_window_navigator.asp) = get browser name & co
* [window.screen](https://www.w3schools.com/js/js_window_screen.asp) = screen size & co

### Conditions & Flow

* `if(condition) statement;`
* `try {block} catch(error) {error_treatment}`
* `throw Error(text);`
* `var!.property` = non-null assertion operator
  * tells the compiler that the preceding expression is not null/undefined (see <https://stackoverflow.com/a/42274019>)
* `!!var` = true if var is not null (see <https://stackoverflow.com/a/7452731>)
* `if(variable)` = check if undefined
* `variable ? variable.property : ""` = check if unefined into ternary operator

### Strings

* `s.indexOf('look')`
* `s.substring(start, count)`
* `age=${koko.age}` = template literal string interpolation

### Collections

* [Sets](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) = basically Hashtables of (unique) values
  * `Set.add()` adds a value only if it does not appear in the set yet (does not raise error, it's just idempotent)

#### Arrays

* [Array is an abstraction](https://stackoverflow.com/a/43857048/3559724) with actual implementation (and resizing/hole-filling) up to particular engine
* `[item]` = turns an item into an array
* `array.shift()` pops the first element of an array and returns it
* `array.unshift()` adds items to the beginning
* `array.push()`
* [splice()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice)
  * `var removed_items = array.splice(index, howmany, item1, ....., itemX)`
* `array.slice(start, end)` = returns new array with the values from _start_ to _end_
* `array.splice(start, remove_count, ...add_items)` = add/remove elements to this array
* [unshift()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift)
* `array.reduce((accu, next) => acc + cur)` aggregate/accumulate
* `array.map(item => item * 1.1)` select
* `array.filter(item => item > 100)` where
* [Conditionally add items](https://codeburst.io/3-ways-to-initialize-an-array-with-conditional-elements-in-javascript-c95397615a7e)
  * `const myArray = ['a', 'b', 'c', 'd', ... condition ? ['e'] : []];`
  * `const myArray = ['a', 'b', 'c', 'd', condition ? 'e' : null].filter(Boolean);`
  * `const myArray = ['a', 'b', 'c', 'd']; condition && myArray.push('e');` (append only)

### Asynchronous Programming

* `Promise.resolve(value)` = returns immediately, but is resolved later, asynchronously
* `const ts = Promise.all([t1, t2, t3])`
  * `for (const t of await ts) { }`

* `async` forces a function to return a promise
* `await` blocks the code. Note that without it, the code is fire & forget (unlike C#, where it would run synchronously, hence be blocking).
  * Tip: using consecutive `await`s prevents silly stairway code with too many `then()`

### Modules

There are two different types of export, named and default.
You can have multiple named exports per module but only one default export.
The default export can be imported via a shorter syntax (no curly braces).
See <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export#Description>

`export default { }`
`export default class`
`export default function()`

## Extensions

* [Lodash](https://lodash.com/) = extends the JavaScript language (deep cloning, debouncing, etc.)
* [date-fns](https://date-fns.org/) = Date manipulation
* [Axios](https://github.com/axios/axios) = HTTP & JSON API calls
* [JSON Server](https://github.com/typicode/json-server) = Fake backend REST API

### jQuery

* [scrollTop()](https://api.jquery.com/scrolltop/) = gets/sets vertical position of the scroll bar (also: `scrollLeft`)
* [offset()](https://api.jquery.com/offset/) = gets/sets the relative coordinates

### [ag-Grid](https://www.ag-grid.com/javascript-grid-cell-editing/)

* [Rendering Flow](https://www.ag-grid.com/javascript-grid-rendering-flow/)
  * Field = Direct value.
  * Value Getter = Calculate displayed value based on anything e.g. multiple fields. Replaces direct field value
  * Value Formatter = WPF's Converter e.g. parsing a date or formatting numbers
  * [Cell Renderer](https://www.ag-grid.com/javascript-grid-cell-rendering/) = controls inner HTML
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

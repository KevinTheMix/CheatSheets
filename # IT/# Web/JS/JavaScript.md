# JavaScript

## Quick Tips

* Unblock/jailbreak right-click = `document.oncontextmenu = true`
* Use `| 0` on a (non-negative) floating point value to convert it to a 32-bit signed integer, effectively math flooring it quickly
* [JavaScript Garden](https://shamansir.github.io/JavaScript-Garden) = documentation about JS quirks
* HTML elements with IDs are automatically made available as global variables (eg `<div id="menu">…</div>` can be manipulated in JS via `menu` variable)

## Glossary

* **Bracket notation** = accessing an object's property/method via a string expression (eg `object[expression]`) rather than a dot notation (eg `object.property`)
* [Computed Property Names](https://tylermcginnis.com/computed-property-names) = use expression result (string) as property name (eg `['koko']='kontan';` creates the object `{ koko: 'kontan' }`)
* **EventSource** JavaScript API = server-sent event (eg for social media status updates, news feeds, sending data to client IndexDB or web storage)
* **Hoisting** = when JS moves a variable declaration (but not its value) to top of its scope before execution
* **IIFE** (Immediately invoked function expression) = useful for context-scoping, and can have a return value
* **Spread Syntax** (`...`) = destructure array items/object properties into distinct variables
  * Can be used for shallow-cloning (eg `{…a}={…b}`), recombining objects into more/fewer (eg `const koko = {…a,…b }`), pushing/(un)shifting/splicing arrays (eg `a = […a, '1', '2', '3' ]`)
  * [Spread operator](https://www.geeksforgeeks.org/javascript-spread-operator)
  * [Destructuring assignment](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
* **Strict Mode** = safer JS mode (via `"use strict";`) that prevents bad/sloppy code (eg implicit global variables, throws errors instead of failing silently)
* **XMLHttpRequest** = interact with servers, without reloading the full page (used extensively by **AJAX**)

## API

* `undefined` = a variable exists but currently has no value (eg declared but not assigned, or assigned _undefined_ literal)
* `typeof(variable)` = (name of) type of variable
* `{}` = [Destructuring Objects](https://wesbos.com/destructuring-objects) = decomposes an object's properties in the order they were defined (eg `{ first, second } = koko;`, where _koko_ could have more properties eg `third`)
* `f(...parameters)` = [Rest parameter](https://www.geeksforgeeks.org/javascript-rest-operator), turns a list of (indefinite number of) function parameters into a single array
  * Then `const [first, second] = parameters` using [Destructuring](https://www.samanthaming.com/tidbits/20-destructuring-function-arguments)
* Object (note: in JS/JSON, objects are maps/dictionaries)
  * `Object.entries(o)` = properties names & values of an object
  * `Object.keys(o)` = properties keys/names of an object
  * `Object.values(o)` = properties values of an object
* Variable declaration
  * `const` = block-scoped, cannot be reassigned, must be initialized (for objects/arrays, reference is const but content can change)
  * `let` (_default, modern, recommended_) = block-scoped, can be reassigned, not hoisted
  * `var` (_legacy, avoid_) = function-scoped, hoisted, can be redeclared
  * Implicit global (eg `x = 123`) = creates a global variable (dangerous, error-prone, forbidden in strict mode)

### [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)

* `Number(rgb).toString(16)` = display as Hexadecimal using [Number.prototype.toString()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
* `**` = power

### Conditions & Flow

* `==` = loose equality, usually avoid (eg `1 == "1"`, `false == 0`, `null == undefined`)
* `===` = strict equality
* `if(condition) statement;`
* `try {block} catch(error) {error_treatment}`
* `throw Error(text);`
* `var!.property` = non-null assertion operator
  * tells the compiler that the preceding expression is not null/undefined (see <https://stackoverflow.com/a/42274019>)
* `!!var` = true if var is not null (see <https://stackoverflow.com/a/7452731>)
* `if(variable)` = check if undefined
* `variable ? variable.property : ""` = check if unefined into ternary operator
* `for(const <item> of <collection>)` = for each loop
* `for(let i = 0; i < length; i++)` = for loop

### Strings

* `s.indexOf('look')`
* `s.substring(start, count)`
* `` `age=${koko.age}` `` = template literal string interpolation

### Collections

* [Sets](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set) = basically hashtables of (unique) values
  * `Set.add()` adds a value if it does not already appear in the set yet (does not raise error, it's just idempotent)

#### [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

* [Array is an abstraction](https://stackoverflow.com/a/43857048/3559724) with actual implementation (and resizing/hole-filling) up to particular engine
* `[item]` = turns an item into an array
* `.filter(callback)` = returns shallow copy of array portion satisfying predicate (à la where)
* `.find(callback)` = returns first element satisfying predicate
* `.findIndex(callback)` = returns index of first element satisfying predicate
* `.map(item => item * 1.1)` = select
* `.push(items)` = adds item(s) to end of array & returns new length
* `.reduce((accu, next) => acc + cur)` = aggregate/accumulate
* `.shift()` = pops first element of an array & returns it
* `.slice(start, end)` = returns new array with values from _start_ to _end_
* `.splice(start, [deleteCount, items])` = add/remove/replace item(s) & returns removed items
* `.unshift(items)` = adds item(s) to beginning of array & returns new length
* [Conditionally add items](https://codeburst.io/3-ways-to-initialize-an-array-with-conditional-elements-in-javascript-c95397615a7e)
  * `const myArray = ['a', 'b', 'c', 'd', ... condition ? ['e'] : []];`
  * `const myArray = ['a', 'b', 'c', 'd', condition ? 'e' : null].filter(Boolean);`
  * `const myArray = ['a', 'b', 'c', 'd']; condition && myArray.push('e');` (append only)

### OO

* [Get](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/get) = getter method

### Events

* `onpaste`, `ondragstart`, `onKeyUp`, `onKeyDown`, `onKeyPress`
* `event.target` = element that received an event
* [Event delegation](https://javascript.info/event-delegation) = event catching-all by a common ancestor (not once per child), enables centralized event-handling (and behaviors)

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

### DOM & co

* `element.closest({criteria})` = closest ancestor matching given criteria
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

## [Extensions](https://www.npmjs.com/package)

* **Adonis.js** = Typescript-oriented backend framework
* **Alpine.js** = HTML-centric tiny _JavScript_ framework (presented as "Tailwind for JavaScript", with jQuery-like effects)
* **Astro** = builds/pre-renders JS-powered apps into static HTML pages with less client-side JS (à la _Hugo_ or _Jekyll_), but with ability to render/hydrate dynamic JS components
* **CodePress** = JavaScript languages syntax highlighter
* **date-fns** = dates manipulation library
* **Handlebars.js** = string templating (à la `String.Format`) engine library
* **HTMX** = HTML-augmenting (JavaScript) UI library (providing access to AJAX, CSS transitions, WebSockets, Server-sent events, form validation)
* [Intence](https://github.com/asvd/intence) = scroll-aware minimap as a scrollbar replacement
* [jq](https://jqlang.org) = lightweight command-line JSON processor
* **JSFuck** = esoteric/educational programming style based on atomic parts of JavaScripts, uses only six different characters to write/execute code (`[]()!+`)
* **JSX** (JavaScript XML, formally JavaScript Syntax eXtension) = syntactic sugar enabling creation of DOM trees via XML-like syntax, transpiled to nested JS functions, initially created by Facebook for React
* **Knockout** = library for building dynamic UIs using MvvM
* **Lightbox** = image viewer with frame resizing & fade transition
* **Lodash** = extension toolkit (eg LINQ-style collection manipulation methods, deep cloning, debouncing, etc.)
* **Moment.js** = dates library
* **Polymer** = open-source JavaScript library (by Google) for building web applications using Web Components standard model (custom elements, shadow DOM, HTML templates)
* **Redux** = open-source state management JS library (written in TypeScript)
* **Socket.IO** = bi-directional client-server communication (via WebSocket or HTTP long-polling as a fallback)
* **Solid.js** (2018) = lightweight, highly performant, (truely surgically) reactive UI framework, transpiles to _JavaScript_, uses JSX (like React), loved by developers
* **Kendo UI** (Telerik) = JavaScript UI library for jQuery, Angular, React & Vue
* **TodoMVC** = same to-do web application implemented in a variety of JavaScript-affine UI frameworks (eg Angular, React, Vue), to use as guide/examples
* **WYMeditor** = JavaScript WYSIWYM XHTML editor (_discontinued_)

### jQuery

* (element)[.scrollTop()](https://api.jquery.com/scrolltop) = gets/sets vertical position of the scroll bar (also: `element.scrollLeft()`)
* (element)[.offset()](https://api.jquery.com/offset) = gets/sets the relative coordinates (`.top`)
* **jQuery Mobile** = touch-optimized mobile/web framework as a JavaScript library
* **jQuery UI** = UI interactions, effects, widgets & themes for jQuery (eg **Sortable** = reorder elements in a list/frid using mouse)
* **nestedSortable** = jQuery plugin for manipulating nested lists

### [ag-Grid](https://www.ag-grid.com/javascript-grid-cell-editing)

* [Rendering Flow](https://www.ag-grid.com/javascript-grid-rendering-flow)
  * Field = Direct value.
  * Value Getter = Calculate displayed value based on anything e.g. multiple fields. Replaces direct field value
  * Value Formatter = WPF's Converter e.g. parsing a date or formatting numbers
  * [Cell Renderer](https://www.ag-grid.com/javascript-grid-cell-rendering) = controls inner HTML
    * [Cell Renderer Class](https://www.ag-grid.com/javascript-grid-cell-rendering-components)
    * [Many Renderers, One Column](https://www.ag-grid.com/javascript-grid-cell-rendering/#many-renderers-one-column)
* [Input Flow](https://www.ag-grid.com/javascript-grid-editing-flow)
  * Value Setter = Inverse of Getter, called when the user edits a cell e.g. the cell displays a fullname (but there's no such column in the data itself) bound to 2 different actual data (firstname + lastname)
  * Value Parser = WPF's Converter in the other direction, from the grid's user input to the data e.g. parsing a string into a number.
* [Row Styles](https://www.ag-grid.com/javascript-grid-row-styles)
  * Row style = Provide entire style (conditionally or not)
  * Row class = Provide CSS class (conditionally or not)
  * Row class rules = Apply a set of CSS classes according to boolean expression
* [Cell Styles](https://www.ag-grid.com/javascript-grid-cell-styles)
  * cellClassRules = an object containing CSS rules to apply to a cell according to a boolean expression using its value.
  * cellStyle = function that returns the complete inline style of a cell based on its value.

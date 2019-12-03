# Vue.js

Progressive, open-source web framework JavaScript library.
In practice, it consists of a large block of JavaScript code executed before our own code, providing it with context.
Collaborative in nature as it allows app segmentation into small versatile units called components.
Packs a render engine, turning data models and components into HTML & JS.

## Features

* Lightweight
  * Small library package size
  * Fast initial load & fast render
* Simple
  * Easy to understand & maintain
  * Uses familiar Directives (like Angular or Knockout)
  * Build step can be omitted (in which case .vue files & component hierarchy cannot used)
* Popular (> 150k stars on [Github](https://github.com/vuejs/vue))
* Works with existing modern (jQuery, Angular, React) or legacy applications
  * Well-suited for surgical fixes & adding features
* Prototyping
  * Small apps can be set up very quickly
  * High performance even with order of magnitudes more data
  * Subsequent conversion to full-scale app is straightforward
* Reactivty
  * Updates DOM automatically in response to data model change (doesn't require a call to Render as React does)
  * Virtual DOM (like React): existing GUI elements are reused to mitigate the cost associated with rendering new stuff
  * Changes are batched for performance
  * Vue works well with immutable types: numbers & strings.
    * Conversely, Vue is fluky for mutable types such as Arrays.
* Collaboration
  * Componentization allow modularity & separation of concerns
  * Even if one file, different sections can be written independently
  * Growing population of Vue.js developers know the framework
  * Backed by full ecosystem (libraries, build & co)

### Versus React

* React is a bit harder.
* React also uses Virtual DOM.
* React doesn't have if/for directives but plain JS.
* React requires a build step to compile its JSX files.

### Versus Angular

* Angular is much more complex.
* Angular's library is much larger.
* Angular also uses if/for directives.
* Angular requires TypeScript, which must therefore also learnt.
* Angular uses its own Modules structure, on top of standard JS modules.
* Angular is a full-fledged framework suited for large-scale apps, and cannot be used to replace a small part of an existing application.

### Drawbacks

* Basic prototyping is easy, but building a complex app requires knowledge & integration of its ecosystem, and might not be appropriate for entreprise-scale applications
* Reactivity can be tricky for more complex types beyong numbers & strings
* .vue file type is not widely used & known by developers
* Relatively new & untested compared to React & Angular

## Environment

### Installation

* [CDN](https://vuejs.org/v2/guide/installation.html)
  * Development version, that outputs debug info in Console

    ```html
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    ```

  * Production, optimized for size & speed

    ```html
    <script src="https://cdn.jsdelivr.net/npm/vue"></script>
    ```

  * Production with a specfic version

    ```html
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.0"></script>
    ```

* [NPM](https://www.npmjs.com/package/vue)
  * Requires Node/NPM, preferably LTS (Long-Term Support) version (minimum 8.9+).
  * `npm install vue.js`
  * `npm install -g @vue/cli`
  * `npm i(nstall)` = install all the dependencies in the local _node\_modules_ folder
  * `npm run build` = create a production build
  * `npm run serve` = build & serve the app
    * Watches the served files for changes, and update the view accordingly in real-time

### Ecosystem

* **Nuxt** = Universal Rendering
  * Makes the App-to-plain-HTML rendering on the server side instead of the client
* **Vuex** = State Management
  * Makes apps with massive state manageable
  * Similar to Flux or Redux
* **Vuetify** = Component Framework (à la Angular Material)
  * Collection of turnkey Material GUI components for standard controls (buttons, lists, etc.)
* **Vue-CLI** = Scaffolding & Build
  * Provides simple tools to add elements to the solution, collaboratively
* **Vue Devtools** = Browser extension
  * Debug & manipulate the data model in real time (add/remove objects and set properties)
* [**Vetur**](https://marketplace.visualstudio.com/items?itemName=octref.vetur) = Visual Studio Code Extension for linting, syntax-highlighting, emmet, etc.
* [**Vue VSCode Snippets**](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets) = Visual Studio Code Extension for snippets
  * `vbase` generates a component template & script sections
  * `vdata`
  * `vcomputed`
  * `vmethod`
  * `vwatcher`
  * `vprops`
  * `vmixin-use`

#### Vue-CLI

* `vue serve` = serve the page (cfr http-server or Apache)
  * `npm run serve`
* `vue build` = compiles the .vue file into HTML & JS
* `vue create koko` = creates a new Vue project using CLI
  * `-d` = Use defaults
* `vue ui` = creates a new Vue project using a GUI
* `vue add` = install plugins for Vue-CLI

### Solution Elements

* **/src/**
  * **app.vue** = main App component
  * **main.js** = constructs the Vue instance, and mounts the main App component into the HTML shell
  * **/components/** = contains child .vue component files
    * **component.vue** = child component
* **/public/** = Contains the HTML _shell_ of the application
* **/dist/** = The compiled result of an `npm run build` that is sent to production
  * Contains a minified _index.html_ file

#### Vue Files (.vue)

Contains HTML, CSS & JS code, typically in a single file.

Cannot be opened by browsers (requires an intermediary build step).
Note that if we don't use .vue files, we might not need a build step at all.

Composed of three sections:

* Template
  * Contains HTML with interpolation binding
* Script
  * One **Export** directive to declare the component, and also specify its dependencie
  * 0-Many **Import** directives, to include other components
  * Application code as data used in binding, computed properties, methods
* Style
  * Use application-wide style by referencing css files in /design/
  * Use inline styling to define styles scoped only to this component and its children (via _scoped_ keyword)

## Components

### Template Directives

* **v-bind**
  * Binds data from model to any element attribute
  * `v-bind:attribute="property"`
  * `:attribute="property"`
  * Examples
    * `:src`
    * `:disabled`
    * `:class="{className: data-property-based-condition}"`
    * `:style="{...}"`
* **v-text**
  * Binds element's (whole) textContent
  * `v-text="property"`
* **interpolation**
  * Binds element's (whole OR partial) textContent
  * `{{ property }}`
* **v-on**
  * Eventing (method name parentheses are optional)
  * `v-on:event="method-name()"`
  * `@event="method"` # shorthand
  * Examples
    * `v-on:submit="addTodo"` # Calls addTodo() when submitting the associated form
    * `@click="koko"` # calls koko() method in response to click
    * `@keyup.esc` or `@keyup.8` using any [ASCII code](http://www.asciitable.com/)
* **v-model**
  * Binds two-way from/to input/textarea/select elements
  * `v-model`
* **v-for**
  * Iterator: repeats the HTML content for each item in the list
  * `:key` attribute designates a unique identifier field to let Vue identify each row uniquely
  * `v-for="item in item-list" :key="item.property"`
  * Example
    * `v-for="hero in heroes" :key="hero.id"`
* **v-if**
  * Conditional: add or remove an element from the DOM depending on a bool/defined expression
  * The affected element won't appear in the DOM at all
  * `v-if="expression"`
  * Examples
    * `v-if="property"` # true if property is not undefined
* **v-show**
  * Conditional: show or hide (with inline style display property) an element depending on a bool expression
  * The element remains in the DOM, but its inline style is set to display:none when hidden
  * `v-show="expession"`

### Script Sections

* **Import**
  * Import components
    * `import Component from @file/@library`
    * `import Heroes from '@/components/heroes`
  * Import methods from libraries
    * `import { method } from library`
    * `import { format } from date-fns`
  * Import mixins from files
    * `import { mixin } from './file'`
    * `import { mymyx } from './my-mixins'`
* **Export**
  * Declares all the name, data, methods & other sections of the Component
  * [_default_ keyword](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/export#Description)
* **Name**
* **Components**
  * `components: { a, b, c }`
  * Must first be imported (see above)
* **Data**
  * `data() { return {}; }`
  * The data() function returns an object holding all the properties that will be added to Vue's reactivity system.
  * When the values of those properties change, the component reacts (real-time binding).
* **Computed**
  * `computed: {}`
  * Computed properties are properties whose value is calculated based off other _data_ properties.
  * Use a cached value that gets updated when either of its dependent properties change.
  * Similar to C# read-only arrow (=>) properties in the sense that it doesn't have its own value, however a setter can actually also be defined, typically to break down the received value into the underlying data properties.
    * `get() {...} set(value) {...}`
    * E.g. a property _fullName_ returning a concat of first & last name, and can be used to set them (via string split)
* **Methods**
  * `methods: {}`
* **Lifecycle Hooks**
  1. `beforeCreate()`
  2. _new Vue() instance_
  3. `created()` # Retrieve data from an API/WS
  4. `beforeMounted()`
  5. _Mounts DOM_
  6. `mounted()` # Interacts with non-Vue 3rd party components (as-in, accessing UI elements & JS via the now-available DOM)
  7. `beforeUpdate()`
  8. _Data gets changed_
  9. `updated()`
  10. `beforeDestroy()`
  11. _Component/Data gets disposed_
  12. `destroyed()`
* **Watchers**
  * `watch: { dataProperty: { immediate: true, deep: false, handler(newValue, oldValue) {...} }`
  * _deep_ lets us watch nested properties
  * Use quotes for dotted property (i.e. `'dataObject.property'`)
* **Filters**
  * Defines methods that transform bounded data (not unlike WPF Converters)
  * Definition `filters: { filterName: function(value) {...} }`
  * Application `{{ dataProperty | filterName }}`
  * Can be defined globally (must come before the _Vue_ instance)
* **Props**
  * Input properties provided by a Parent
* **Mixins**
  * Distribute reusable functionality across components (e.g. a lifecycle hooks logger)
  * In mixin file: `export const mymix = {...}` # e.g. data, methods, computeds, lifecycle hooks, watches
  * In component: import them + add a `mixins: [mymix],` section
  * Conflicting sections merge strategy
    * Methods, Components & Computed: precedence to local component
    * Data: merged superset, precedence to local component data
    * Watch & Hooks: both are run, mixin's run first

### Component Communication

#### Parent to Child

The Parent embeds the Child with v-bind (:) and a reference to the Component:

* Template
  * `<Component :child-property="parentProperty" />` # Dynamic
  * `<Component child-property="a string" />` # Static
  * Child property written in kebab-case
* Script
  * `import Component from '@/components/component'`
  * `components: { Component },`

The Child declares its input properties with type, default value, required (false by default), validator:
Type can be String, Number, Boolean, Array, Object, Function, Promise

  ```javascript
  props: {
    result: {
      type: String,
      default: () => {},
      required: true,
      validator: function(value) {
        return ['success', 'warning', 'danger'].indexOf(value) !== -1
      }
    },
  },
  ```

We should never modify the property incoming from the Parent, which is immutable.
Instead, we can clone it (shallow or deep as required), and manipulate that value.
This is important in Vue, because we want the data to flow one-directionally: top-down.

#### Child to Parent

The Child emits an  event with an arbitrary name (using Vue's $emit() function), optionally passing it parameters.

`this.$emit('save', localHero);`

The Parent register a handler for the event, just like for standard events.

`<Component @save="saveHero">`

Note that no parameter is specified in the template.
The signature of the handler however receives the parameter.

`saveHero(hero) {...}`

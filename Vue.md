# [Vue.js](https://vuejs.org/v2/api/)

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

### Resources

* [Vue.js: Big Picture](https://app.pluralsight.com/library/courses/vuejs-big-picture/table-of-contents)
* [Vue: Getting Started](https://app.pluralsight.com/library/courses/vue-getting-started/table-of-contents)

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
    * This command is actually an alias as defined in _package.json_ to a cmd (`vue-cli-service serve`) located in _node\_modules/.bin_ (see <https://cli.vuejs.org/guide/cli-service.html>)
  * `npm run dev` = runs both our frontend server, and a fake backend server
    * From 'package.json': `"dev": "concurrently \"npm run backend\" \"npm run serve\""`

### Ecosystem

* [**Vue API**](https://vuejs.org/v2/api/)
* [**Vue CLI**](https://cli.vuejs.org/) = Scaffolding & building command-line tools
* [**Vue Router**](https://router.vuejs.org/)
* [**Vuex**](https://vuex.vuejs.org/) = State Management (similar to Flux or Redux). Makes apps with massive state manageable
  * Provides simple tools to add elements to the solution, collaboratively
* [**Vuetify.js**](https://vuetifyjs.com/en/components/date-pickers) = [Material Design](https://en.wikipedia.org/wiki/Material_Design)
* [**VeeValidate**](https://logaretm.github.io/vee-validate/)
* [**Vue I18n**](https://kazupon.github.io/vue-i18n/guide/formatting.html#named-formatting)
* [**Nuxt**](https://nuxtjs.org/) = Universal Rendering
  * Makes the App-to-plain-HTML rendering on the server side instead of the client
* [**Vuetify**](https://vuetifyjs.com) = Component Framework (à la Angular Material)
  * Collection of turnkey Material GUI components for standard controls (buttons, lists, etc.)
* [**Vue Devtools**](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/) = Browser extension
  * Debug & manipulate the data model in real time (add/remove objects and set properties)
  * Inspect: Model, Vuex, Events, Routing & Performance
* [**Vetur**](https://marketplace.visualstudio.com/items?itemName=octref.vetur) = Visual Studio Code Extension for linting, syntax-highlighting, emmet, etc.
* [**Vue VSCode Snippets**](https://marketplace.visualstudio.com/items?itemName=sdras.vue-vscode-snippets) = Visual Studio Code Extension for snippets
  * `vbase` generates a component template & script sections
  * `vdata`
  * `vcomputed`
  * `vmethod`
  * `vwatcher`
  * `vprops`
  * `vmixin-use`
  * `vroutename` = using a route named in router.js
  * `vroutenameparam` = same, with a URL parameter
  * `vroutepath` = explicit URL route
  * `vmutation` = Vuex Mutation
  * `vaction` = Vuex Action

#### [Vue CLI](https://cli.vuejs.org/)

Scaffolding & build

* `vue serve` = serve the page (cfr http-server or Apache)
  * `npm run serve`
* `vue build` = compiles the .vue file into HTML & JS
* `vue create koko` = creates a new Vue project using CLI
  * `-d` = Use defaults
* `vue ui` = creates a new Vue project using a GUI
* `vue add` = install plugins for Vue-CLI

#### TypeScript

[TypeScript Support](https://vuejs.org/v2/guide/typescript.html)
[TypeScript class components](https://alligator.io/vuejs/typescript-class-components/), as opposed to standard Vue.js

### Solution Elements

* **/src/**
  * **app.vue** = main App component
  * **main.js** = constructs the Vue instance, and mounts the main App component into the HTML shell
  * **/components/** = contains nested child .vue component files
  * **/views/** = contains routed (non-nested) views
* **/public/** = contains the HTML _shell_ of the application, and static files distributed with the build.
* **/dist/** = the compiled result of an `npm run build` that is sent to production
  * contains a minified _index.html_ file
* **.env** files = environment variables. Readable using `process.env.{VARIABLE}` that gets the current environment's version of the requested variable.
* **.index.js** = "barrel" (aka container index) of other JS files (basically lists and re-exports them as-is).

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
  * Import content (constants, mixins) marked as _export_ from the files in a folder.
    * `import { exported_content } from './directory'`
    * `import { lifecycleHooks, mymyx } from '../shared'`
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
  * Note that it is a function, note an object, so that multiple instances can can maintain an independent copy of the returned data object. 
  * When the values of those properties change, the component reacts (real-time binding).
* **Computed**
  * `computed: {}`
  * Computed properties are properties (defined as methods, used as properties) whose value is calculated based off other properties.
  * Use a cached value that gets updated when either of its dependent properties change.
  * Similar to C# read-only arrow (=>) properties in the sense that it doesn't have its own value, however a setter can actually also be defined, typically to break down the received value into the underlying data properties.
    * `get() {...} set(value) {...}`
    * E.g. a property _fullName_ returning a concat of first & last name, and can be used to set them (via string split)
* **Methods**
  * `methods: {}`
* **Lifecycle Hooks**
  * Note: the following methods can be defined as asynchronous.
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
  * Performs some treatment in response to the change of a given property.
  * `watch: { dataProperty: { immediate: true, deep: false, handler(newValue, oldValue) {...} }`
  * `deep: true` lets us watch nested properties
  * Use quotes for dotted property (i.e. `'dataObject.property'`)
* **Filters**
  * Defines methods that transform bounded data (not unlike WPF Converters)
  * Definition `filters: { filterName: function(value) {...} }`
  * Application `{{ dataProperty | filterName }}`
  * Can be defined locally to a Component, or globally, on the _Vue_ instance.
* **Props**
  * Input properties provided by a Parent
  * Default values can be provided
  * They can be marked as required (false by default)
  * Custom Validator functions can be defined, that take in a value of the property and return true/false
* **Mixins**
  * Distribute reusable functionality across components (e.g. a lifecycle hooks logger)
  * In mixin file: `export const mymix = {...}` # e.g. data, methods, computeds, lifecycle hooks, watches
  * In component: import them + add a `mixins: [mymix],` section
  * Conflicting sections merge strategy
    * Methods, Components & Computed: precedence to local component
    * Data: merged superset, precedence to local component data
    * Watch & Hooks: both are run, mixin's run first

### Communication & Navigation

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
This is important in Vue, because we want the data to flow one-directionally, top-down.

To be able to manipulate and modify the property coming from the Parent in the Child, we need to create a copy (hence a new object) first.
If the property is a simple object with one-level deep properties, we can shallow clone, using the [spread syntax](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) into another object (i.e. `{ ...original }`), otherwise deep clone it using a library like [Lodash](https://lodash.com/docs/4.17.15#cloneDeep) (or our own implementation).

#### Child to Parent

The Child emits an  event with an arbitrary name (using Vue's $emit() function), optionally passing it parameters.

`this.$emit('save', localHero);`

The Parent register a handler for the event, just like for standard events.

`<Component @save="saveHero">`

Note that no parameter is specified in the template.
The signature of the handler however receives the parameter.

`saveHero(hero) {...}`

#### Slots

[Slots](https://vuejs.org/v2/guide/components-slots.html) a mechanic that allows a Child component to set a placeholder for some content provided by the Parent.
It is a similar construct to WPF's ContentPresenters that mark a location where Content will be rendered.
Example:

  ```html
  <!-- Child template -->
  Hello <slot></slot>
  <!-- Parent template -->
  <child><template>World!</template></child>
  ```

Slots can be named with the _name_ attribute in the Child, and referencing it with a **v-slot**:_name_ directive in the Parent.
The default name when no name is provided is just that: _default_, which can also be referenced explicitely.
Any content not wrapped in a ```<template>``` using v-slot is assumed to be for the default slot.
Example:

  ```html
  <!-- Child template -->
  Hello <slot name="koko"></slot>
  <!-- Parent template -->
  <child v-slot:koko>World!</child>
  ```

The Child itself can prepare a default (fallback) content to use when the Parent provides none:
Example:

  ```html
  <!-- Child template -->
  Hello <slot>World!</slot>
  ```

Scoped slots can be used when we want the content defined in the Parent to make use of data only available in the Child.
Therefore it is a mechanism to let the Child pass its data to the Parent, that then gets injected back to the Child!
To implement this, the Child must v-bind the data by specifying an arbitrary name.
The Parent can then use the **v-slot** attribute syntax and specify a name for the object holding all the props it receives (similar to the notion of a WPF DataContext, or simply the _data() { return {}}_ section).
The Child property can then be accessed in the content via `{holdingObjectName}.{childArbitraryName}`
Example:

  ```html
  <!-- Child template -->
  <slot v-bind:childProp="childVarOrprop"></slot>
  <!-- Parent template -->
  <child><template v-slot:default="obj">{{obj.childProp}}</template></child>
  ```

When only the default slot is provided content (no other named slots), the component’s tags can be used as the slot’s template.

  ```html
  <!-- Parent template -->
    <child v-slot:default="obj">{{obj.childProp}}</child>
  ```

Note that for named slots, the **v-slot**:_name_ attribute can be shorthanded into #name.
Example:

  ```html
  <!-- Parent template -->
  <child #koko>World!</child>
  ```

Read on about scoped slots datacontext...: <https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment#Object_destructuring>

#### Routing (Vue Router)

1. Run Vue CLI command `vue add router` to scaffold the [Vue Router](https://router.vuejs.org/) into the app
    * _package.json_
    * _package-lock.json_
    * _src/views/Home.vue_
    * _src/views/about.vue_
    * _src/main.js_ imports & add the router to the app (to the Vue instance).
    * _src/router.js_
2. Setup _router.js_
    * `Vue.use(Router);` = adds the router to this app.
    * `export default new Routeur()` creates and exports the **Router** instance.
    * **mode** = configures which browsing history style to adopt (_history_ or _todo_).
    * **routes** = contains all our routes, especially the default one (usually as a redirection).
      * **path** = URL (`*` means all routes)
      * **redirect** = move to other URL
      * **name** = route name (can be used in `<router-link>`)
      * **component** = the Component to display at this route
        * Eager loading = loads Component from the get-go via (imported above) Component's name
        * Lazy loading = packages Components into separate JS files (aka code-splitting into Chunks) that get loaded at runtime only when accessed. This is achieved by the definition of a function that imports the Component by its filepath. In that case, the Component doesn't have to be imported in the header (since it's no longer laid out statically in the output html). Several Components can be bundled together by specifying the same Chunk name (tht gets auto-generated otherwise). It can be seen in the Network browser console that the lazy loaded JS bundles only gets loaded when the Component page is accessed.
      * **props** = map URL parameter to the Component's _props_ section (implicit, or using custom parsing function)
3. _app.vue_ must now contain a root `<router-view></router-view>` element, where the routed Components will get displayed.
4. Parent Component points to Child via either `<router-link>` element, either with explicit URL `<router-link to="/path">` or named route `<router-link :to="{ name: 'child_name', params: {...}}">`.
5. Navigate programmatically to Component route using `this.$router.push({name: 'route_name'});`
6. Use Browser Vue extension **Routing** to inspect routes transitions.

#### State Management (Vuex)

State management is the consideration of how and where (in this context, a data **store**) to store what data (hereby called **state**).
There are different categories of data:

* Entity
* Session (user info, settings, routing)
* Local (a Component's properties)

Of those, only Entity and Session data are susceptible to become shared.

One approach is to use JavaScript Modules, with a shared Module (or data service) to be injected (imported) where it is needed. This is easy, until it's not. For large applications, this becomes impractical as Modules get shared across multiple Components, and raises consistency issues when models get implemented a little differently in different places.

To counteract that problem, [Vuex](https://vuex.vuejs.org/) helps us achieve what's called a _single source of truth_.
It consists of **Actions**, **Mutations**, **State** and **Getters**.
Actions has a 1-to-N relationship with Mutations.
Actions are concerned with performing some BL (WS or DB access), then "commiting" (which means notifying) one or more Mutations.
Mutations are only concerned with refreshing the _state_, which may entail some array manipulation and what not.
(This is somewhat reminding of the C# event handler construct (`protected override OnX()`).)
This modification will in turn refresh the _computed_ properties/methods of the Components using the state, and their view will get updated in accordance.
[Why are Mutations separated from Actions?](https://stackoverflow.com/a/39303713)

1. Run Vue CLI command `vue add router` (or `npm i vuex`) to scaffold the [Vuex](https://vuex.vuejs.org/) into the app
    * _db.json_
    * _package.json_
    * _package-lock.json_
    * _src/main.js_
    * _src/store.js_
2. Setup _store.js_
    * This is our store file. Possibly move it to _/store/index.js_
    * State
      * Static object that holds the shared data properties retrieved by the Components.
    * [Getters](https://vuex.vuejs.org/guide/getters.html) = equivalent to _computed_ (synchronous) properties/methods for stores, which can thus be shared across several Components.
      * Can be used for finding, filtering, summing, etc. _state_ data
      * Receives _state_ and _getters_ themselves as parameters
      * Like for _computed_ section properties, they are cached based on their dependencies (though only for property-style access, not method-style which is called everytime)
    * Actions
      * Synchronous or asynchronous functions that holds business logic, access some API or DB, and commit one (or more) _mutations_ via `commit('MUTATION_NAME', payload)`.
      * Receives the Vuex store context (holding the _commit()_ function, also the _state_, _getters_ & _dispatch_ (to call other actions), although it is usually destructured into just `{ commit }` only) and a _payload_, that is some data to update the _state_.
    * Mutations
      * Synchronous operations that mutate (modify) the _state_
      * Receives _state_ and the _payload_ as parameters
      * e.g. `updateHero(state, hero) { state.heroes = replaceHero(hero) }`
3. Reference the store from the app (taken care of by scaffolding into _main.js_)
    * Makes _this.$store_ available to the Components)
4. Components communicate with the store
    * State
      * Components access the **state** properties directly, or access them via **getters**, which return a treated (find, filter, calculate, etc.) view of them.
      * Inline `this.$store.state.heroes;`
      * Via _computed_ section declaration
        * Manually: `heroes() { return this.$store.state.heroes; }`
        * Via the Vuex _mapState()_ method (requires `import { mapState } from 'vuex';`)
            * `...mapState({ heroes: state => state.heroes })`
            * `...mapState({ heroes: 'heroes' })`
            * `...mapState(['heroes', 'villains'])`
    * Getters
      * Via  _computed_ section declaration, via the Vuex _mapGetters()_ method (requires `import { mapGetters } from 'vuex';`)
        * `...mapGetters({ getHeroById: 'getHeroById' })`
        * `...mapGetters(['getHeroById'])`
    * Actions
      * Inline `this.$store.dispatch('updateHeroAction', hero);`, where _updateHero_ is the action and _hero_ is the payload
      * Via _methods_ section declaration, via the Vuex _mapActions()_ method (requires `import { mapActions } from 'vuex';`)
        * `...mapActions(['updateHeroAction'])`
5. Use Browser Vue extension **Vuex** to inspect _mutations_, _state_ & _getters_.

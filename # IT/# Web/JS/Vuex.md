# Vuex

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
(This is somewhat reminding of the C# event handler construct (`protected override OnX()`) because it does something very simple with zero logic)
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

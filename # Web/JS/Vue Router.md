# Vue Router

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

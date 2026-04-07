# [Angular](https://en.wikipedia.org/wiki/Angular_(web_framework))

Angular (2+) is a FOSS Google-developed TypeScript-based rewrite of AngularJS by same team (in 2016).
Uses thin/minimal easily cache-able shell templates, whilst all logic belongs to lazy-loaded nested component (TypeScript) class (not HTML template).

## Quick Tips

* Use `Ctrl + T` in Visual Studio Code to jump from markup (HTML) to definition (TypeScript)
* Previously, Angular apps were client-heavy (minimal shell plus Angular runtime plus asset bundles), until SSR apps became mainstream
* Previously, Angular apps used **webpack** as main build bundler, but introduced a new build system using **esbuild** + **Vite** (now default for new apps)

## Glossary

* **Angular Material** = Google's official Angular UI components library ready-made accessible responsive components (eg buttons, dialogs, tabs, form fields) following Material Design spec
* **Bootstrapping** = initialization process/step during which Angular loads root module & component to start an application
  1. Load root module (usually **AppModule**, in _main.ts_)
  2. That module specifies a root component (usually **AppComponent**) in its _bootstrap_ array
  3. Create & render that root component inside HTML element that matches its selector (eg `<app-root>`)
* **Component** = reusable UI element encapsulating its own HTML, CSS, and TypeScript, making it easier to manage and test individual pieces of an application
  * Components are rendered from a root component down in a hierarchical nested fashion (à la DOM tree), each responsible for rendition of its own HTML fragment (à la WPF UserControl)
* **Decorator** = TypeScript compile-time feature/syntax that adds metadata on classes, properties, parameters (but not methods) needed to wire up components/services/modules/DI
  * `@Component()` (inherits `@Directive`) = `@Directive` + template + styles + change detection = creates a component/directive with a view
  * `@Directive()` = decorator defining a directive
  * `@Input()` = marks a component property as something that a parent component can pass data into (eg via `<child [koko]="kontan">`)
* **Directive** = Angular runtime construct that provides functionality or attaches behavior to DOM elements (can be applied to existing elements using selectors à la CSS)
  * They can be HTML (`<elem directive>` eg `<input matInput>`) or TypeScript `@Directive`
  * **Attribute** = change appearance/behavior of an existing element (eg `ngClass`, `ngStyle`, custom)
    * Eg `<element [ngClass]="{'movies': medium==='Movies', 'series': medium==='Series'}" />` (where _movies_ & _series_ are CSS classes)
  * **Structural** = special syntax to add/remove/reshape DOM/layout elements (eg `*ngIf`/`*ngFor`/`$ngSwitchCase`)
* **Guard** = functions/classes to control whether a user can navigate to/from a route, typically for auth, acting as checkpoint before activating/deactivating/matching routes
  * CanActivate (class `implements CanActivate`) = decide if a route can be entered
  * CanActivateChild = protects child routes
  * CanDeactivate = prevent leaving a route
  * CanMatch = decide if a route should match before activation
* **Injector Tree** = hierarchical structure that Angular uses to resolve/provide dependencies (services) at runtime
  * Dependencies are looked up (lazyily) bottom-up (starting at component that requires it, up to root), so multiple scoped instances of same service can exist in different parts of app
* **Module** (`NgModule`) = (no longer core) metadata container/package that groups/links related pieces of application (components/services/dependencies) together
  * **BrowserModule** = imported in root module (**AppModule**) when building applications running in a web browser
  * **CommonModule** = built-in Angular module (part of _@angular/common_) that includes all basic directives (eg `NgIf`, `NgForOf`) & pipes (eg `DecimalPipe`), also re-exported by BrowserModule
* **Pipes** = feature to transform data directly in templates (à la WPF converters & formatters), returning a new value without mutating original, built-in or custom
  * Built-ins = _currency_ (eg `currency:'EUR'`), _date_ (eg `date:'longDate`), _json_, _lower/uppercase_, _percent_, _slice_, _keyvalue_
  * Pure pipes (default) run only when input changes (fast, recommended), while impure pipes run every change detection cycle (use sparingly)
* **Selector** = string that tells Angular where a directive/component should be applied in HTML (ie element `<koko>`, attribute `<div koko>`, class `<div class="koko"`, combination `button[koko]` or `[koko][kontan]`)
* **Service** = reusable singleton instance holding shared logic/data to be injected where needed (eg shared state, business logic, data/HTTP access, transversal logging/analytics/caching, à la helpers + data layer)
* **Template** = Angular-augmented HTML that defines a component's view (rendered in browser)
* **TypeScript** (_Microsoft_) = a typed (Classes via decorators, Modules, Strong typing) superset of JavaScript that gets transpiled to JS

### Ecosystem

* **Angular DevTools** = Chrome/Firefox Angular applications debugging extension (eg inspect Angular Component Tree, live editing Component state, profiling, performance)
  * Router Tree = maps application's routes as Angular sees them
  * Transfer State = tab to examine SSR/state hydration behavior
* **Angular Universal** = enables SSR for Angular applications (lets server generate initial HTML for a page before sending it to user's browser)
* **AngularJS** (_discontinued_) = FOSS pure JS declarative MVC/MvvM framework for developing SPAs using a fatter view, with model changes propagated to views without any manual DOM manipulation
  * Application = entire SPA, using HTML as template language initialized by bootstrapping AngularJS (via `ng-app`)
  * Controller = connects view (HTML) to model (data) in a MVC pattern, holds view logic, exposes data & behavior, responds to user interactions, updates model
  * Directive = extends HTML with custom elements/attributes/behaviors
  * Expression = snipped of code placed inside `{{…}}` in templates to bind data, perform calculations, display values in view layer
  * Filter = format/transform data before it appears on screen, applied to expressions or directives using `|` pipe character
  * Service = reusable singleton object (via DI) used for shared data/BL/functionality across controllers/directives/other components
* **Augury** (_discontinued_) = Chrome/Firefox Angular applications debugging extension
* **Karma** = test running to execute unit tests written in Jasmine framework to test in real browsers
* **Protractor** = Angular end-to-end test framework (in a real browser, simulating user interactions)

### Project Structure

* **e2e/** = test project
* **src/** = actual application code
  * **app/** = Angular components, modules, services (real app logic)
    * _app-routing.module.ts_ = app routes definition
    * _app.component.ts_ = app root component
    * _app.module.ts_ = app root module (bootstraps **AppComponent** ie `bootstrap: [AppComponent]`)
    * _main.ts_ = app entry point (bootstraps **AppModule**)
  * **assets/** = static files (images, fonts, JSON configs)
  * **environnements/** = environment-specific configs (_environment.ts_ dev, _environment.prod.ts_ prod)
  * _favicon.ico_ = browser tab icon
  * _index.html_ = single page/shell Angular bootstraps into (hosts `<app-root>`)
  * _main.ts_ = bootstraps (entrypoint into) Angular app by calling `bootstrapApplication()` or `platformBrowserDynamic()`
  * _manifest.webmanifest_ = PWA metadata (icons, name, theme colors)
  * _polyfills.ts_ = browser compability shims (rarely touched now)
  * _styles.(s)css_ = global styles shared project-wide
  * _theme.scss_ = custom design system/styles (project-specific)
  * _test.ts_ = entry point for running unit tests (Jasmine/Karma setup)
* _.browserslistrc_ = defines browser support targets for builds (affects JS polyfills & CSS)
* _.editor.config_ = editor formatting conventions (indent size, charset)
* _.htaccess_ (_optional_ for Apache deployments) = routing roules for SPAs, caching, etc
* _.node-version_ = pinned Node.js version (for tools like **nvm** or **nodenv**)
* _.prettierignore_ & _.prettierrc.json_ = Prettier formatting config
* _angular.json_ = central Angular build configuration (app entry points, build options, file replacements, assets/styles/scripts, test configurations)
* _ngsw-config.json_ = service worker settings for PWA functionality (caching rules)
* _azure-pipelines.yml_ = Azure DevOps pipeline config for builds/tests/deployments
* _karma.conf.js_ = test runner config (if project still uses Karma)
* _package.json_ = define dependencies, Node scripts, tool configs
* _package-lock.json_ = exact dependency tree for reproducible installs
* _tsconfig.json_ = base TypeScript config
* _tsconfig.base.json_ = inherited by other TS configs
* _tsconfig.app.json_ = TS settings applied to app source code
* _tsconfig.spec.json_ = TS settings for test files
* _tslint.json_ (_deprecated_) = legacy linter config (moved to ESLint)

## Lifecycle Hooks

Let component implement interfaces (`@Component(…) class LoginDialogComponent implements OnInit, OnDestroy`) to enforce lifecycle methods definition.

1. `ngOnChanges(changes)` = called whenever an @Input() value changes (runs before ngOnInit)
2. `ngOnInit()` = component is initialized (good place to load data)
3. `ngDoCheck()` = custom change detection hook (rarely needed; use sparingly)
4. `ngAfterContentInit()` = called after Angular projects external content `<ng-content>...</ng-content>`
5. `ngAfterContentChecked()` = runs after every check of projected content
6. `ngAfterViewInit()` = component's view and child views are ready (safe to access @ViewChild() elements here)
7. `ngAfterViewChecked()` = runs after each check of views (component + children)
8. `ngOnDestroy()` = called just before Angular removes the component (cleanup zone: unsubscribe, detach listeners, etc)

## [CLI](https://github.com/angular/angular-cli)

* `ng build --prod`
* `ng g(enerate)` = scaffolds something
  * `c(omponent)` = creates a Component class, and imports & declares it in the AppModule
  * `cl(ass)` = creates a Model class
  * `guard <name>` = generates a _guard.ts_ file (in /src/app)
  * `m(odule)` = creates a Module (`--flat` puts file in src/app instead of own folder, `--module=app` also registers module in _imports_ array of AppModule)
  * `s(ervice)` = creates a Service
* `ng new koko-app` = scaffold a new project
* `ng serve` = hosts a project (at <http://localhost:4200>)
  * `-(-)o(pen)` = hosts a project at <http://localhost:4200> & opens a browser

## API

* `import { … } from '@namespace/package';` = import by scoped packages
* `import { … } from 'path';` = import by path (file extension not necessary)
* `export class TargetClass` = makes a class available to be imported in other files/modules
* `@NgModule({declarations: [AppComponent], imports: [BrowserModule], bootstrap: [AppComponent]}) export class AppModule {}` = old (pre-v14) application bootstrapping
* `@NgModule({declarations: [MyComponent]}) export class MyFeatureModule {}` = old component registration (components always declared inside a (single) module)
* `bootstrapApplication(AppComponent, {providers: […]});` = modern recommended application bootstrapping (bootstrap a component directly without **AppModule** needed)
* `@Component({standalone: true, imports: [CommonModule, ChildComponent]}) export class ParentComponent {}` = modern standalone component registration (listing its own imports)

* `$event` = represents payload of any event binding (note: _$_ is a valid JS variable name character, also used for observables by convention in RxJS)
* `{{ expression }}` = interpolation
* `[property]="value"` = property binding
* `(event)="handler()"` = event binding
* `[(ngModel)]="property"` = two-way binding
* `ng-container` = invisible wrapper (no DOM element produced)
* `*ng…` (directives) = syntactic sugar for more elaborate expression with `[ng…]` selectors as outer element (eg `<ng-template [ngIf]="expression"><div></div></ng-template>`)
  * `*ngIf` = false when empty/null/undefined
  * `*ngIf="data; else loading"` = using custom _#loading_ template while there is no data
  * `*ngIf="foo, let x"` = displays foo (if true) under name of _x_
  * `*ngFor="let item of collection"` = duplicate element for each item in collection
  * `$ngSwitchCase`
* `<ng-template>` = ng-template element, does not render anything itself, holds markup to be added elsewhere (eg **ngIf** & **ngFor** as themselves, **ngTemplateOutlet** as custom)
* `<ng-template #errorTpl let-msg="message"><p class="error">{{ msg }}</p></ng-template>`
  * _#errorTpl_ = template reference variable
  * _message_ = template context property, provided from outside, either fixed (eg `*ngIf`/`*ngFor`) or custom (eg `ngTemplateOutletContext`)
  * _msg_ = template input variable
  * Eg `<div [ngTemplateOutlet]="errorTpl" [ngTemplateOutletContext]="{ message: errorMsg }"></div>`

### Angular Material

* `mat-autocomplete` = list of filtered suggestions based on user input
* `mat-checkbox` = true/false toggle
* `mat-form-field` = wrapper adding Material styling & behavior around inptus
  * `mat-input` = integrates with `mat-form-field` to apply styling applied to native `<input>`, `<textarea>`
* `mat-date-picker` & `mat-datepicker-input` = date selection (supports different date adapters eg Moment, Luxon, native)
* `mat-option` = single selectable item among multi-select components (eg `mat-select`, `mat-autocomplete`)
* `mat-radio-button` & `mat-radio-group` = single-choice options
* `mat-select` = dropdown for picking one/multiple values (_value_, _disabled_)
* `mat-slide-toggle` = switch-style boolean input
* `mat-slider` = select numeric values by sliding

### Snippets

#### Old App Bootstrapping

```js
import { NgModule } from '@angular/core';
@NgModule({                       // Module Metadata Properties
    declarations: [AppComponent], // Declares available (local) modules
    imports: [BrowserModule],     // Imports other modules needed (here BrowserModule contains directives, pipes, etc for working with DOM, and is automatically included in modern Angular bootstrap)
    providers: [],                // DI-provided service declaration (lazy-loaded ie instanciated now if they don't exist yet)
    bootstrap: [AppComponent]     // Sets application entry point component
})
export class AppModule {}         // Entry point for whole application (named AppModule by convention)
```

#### Old Component Definition

```js
import { Component } from '@angular/core';
@Component({                        // Component Metadata Properties
    selector: 'app',                // Locates a named HTML element, where the content of the following provided template will be lazy-loaded.
    template: '<h1>abc</h1>'        // Applies the given inline template
    templateUrl: './component.html' // Applies the given referenced template
    styles: [css]                   // Array of CSS style codes. Use ES2015 backticks '`' to write the content on multiple lines.
    styleUrls: [paths]              // Array of paths to CSS stylesheets => CSS stylesheets can be scoped to individual Components!
})
export class AppComponent {}
```

#### Binding & Templates Syntax

```js
{{Expression}}                      // Interpolation
<element [property]="value" />      // Property Binding (DOM native or custom (input) property)
<element property="{{value}}" />    // Property Binding using interpolation
<element (event)="method(val)" />   // Event Binding (DOM native "onevent" or custom (output property) event)
[(ngModel)]="property"              // Two-way binding
[class.koko]="a === b"              // Class Binding (applies a CSS class only if a condition is met)
```

##### Input Property

```js
import { Input } from '@angular/core';
@Input() property;                      // Declares a property as input property.
@Input('propertyInputAlias') property;  // Declares a property as input property with given input name.
<element [property]="value" />
```

##### Output (Event) Property

```js
import { Output, EventEmitter } from '@angular/core';
@Output() eventProperty = new EventEmitter();   // Declares an event.
@Output('eventAlias') eventProperty;            // Declares an event with given name.
this.eventProperty.emit(property);              // Invokes the event, passing given parameter.
<element (eventProperty)="method($event)" />    // Handles the event, retrieving the parameter.
method(property) { ... }                        // Handler implementation, with event parameter as input.
```

#### Custom Pipe

```js
import { Pipe, PipeTransform } from '@angular/core';

// Usage: {{ 'hello' | capitalize }}
@Pipe({ name: 'capitalize' })
export class CapitalizePipe implements PipeTransform {
  transform(value: string): string {
    return value.charAt(0).toUpperCase() + value.slice(1);
  }
}
```

#### Custom Attribute Directives

```js
import { Directive, HostBinding } from '@angular/core';
@Directive({ selector: '[kokoAttribute]'})          // Will be applied to HTML element (similar to CSS selector).
export class KokoDirective {
    @HostBinding('class.is-koko') isKoko = true;    // The HostBinding targets properties, and "class" is a native DOM property available on all elements.
                                                    // => KokoDirective.isKoko controls whether the is-koko CSS class gets applied to the host element.
                                                    // The host element = the element that has the directive on it.
}
```

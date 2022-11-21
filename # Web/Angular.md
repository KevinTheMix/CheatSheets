# Angular

Angular is a JavaScript framework used to build web application and managing all the plumbing.
Everything is client-side, where the initial HTML (index.html) page & styles are minimal (aka Angular Shell) and easily cache-able, whilst nested Components are loaded via lazy-loading.
Its source code is written in TypeScript (made by Microsoft), a typed (Classes via decorators, Modules, Strong typing) superset of JavaScript that gets transpiled to JS.
Starting process of an Angular App is main.ts -> app.module.ts -> bootstrapped component (i.e. app.component.html & app.component.ts).
Angular is basically modularly organized Typescript using webpack for module/template/styles packaging.

## Environment

### NPM

Package manager for JavaScript (we could use another one however NPM is shipped with Node).

    node --version

    npm --version
    npm i(nstall)       # Installs all (missing) packages of the current project referenced in package.json
    npm i [package]     # Install a specified package (from public NPM cloud) into node_modules, and references it from package.json
                        # That second part is automatic since version 5.0 (previously with options --c).
    npm i -g            # Installs globally (in the environnement e.g. PATH, etc.)
                        # See <https://stackoverflow.com/questions/5817874/how-do-i-install-a-module-globally-using-npm>
    npm i npm           # Updates NPM itself
    npm i angular2
    npm i -g @angular/cli   # Install Angular CLI
    npm ls                  # Lists ALL installed packages including sub-dependencies
    npm list -g --depth=0   # Lists top-level packages
    npm update              # Installs all missing package references

### CLI

Command-line interface for Angular. Contains all the entities generation (scaffold) commands.

    ng new koko-app     # Scaffold a new project

    ng g(enerate)       # Scaffolds something
    ng g cl(ass)        # Creates a Model class
    ng g c(omponent)        # Creates a Component class, and imports & declares it in the AppModule
    ng g s(ervice)      # Creates a Service
    ng g m(odule)       # Creates a Module
        --flat          # Puts the file in src/app instead of own folder
        --module=app    # Also registers module in the "imports" array of AppModule

    ng serve            # Hosts a project at http://localhost:4200/
    ng serve -(-)o(pen) # Hosts a project at http://localhost:4200/ & opens a browser

    ng build --prod

### Workspace Structure

    e2e/                # Test Project
    src/
        app/            # App Project
        assets/
        environnements/
        favicon.ico
        index.html      # Master page
        karma.conf.js   # Test
        main.ts         # Entry point
        styles.css      # Global CSS
    .gitignore
    angular.json        # Global Parameters (defaults & include paths)
    package.json        # List of packages (cfr Nuget Manager)
    README.md
    tsconfig.json       # Options (behaviours)

## Application

### Imports

Imports classes (including Decorators), functions, styles, json, etc.

### Decorators

Similar to C# [Attributes], they are classes that belong to a module and get applied to a class. First, they must be imported:

Using scoped packages as module name (ex.: '@angular/core' is Angular core-scoped package (i.e. developed by Angular team)).

    import { DecoratorClass } from '@namespace/package';

Using path (file extension not necessary) as module name

    import { DecoratorClass } from 'path';

Declares decorator (json) metadata properties

    @DecoratorClass ({json})

Declares a class, that's usable in another file thanks to 'export' keyword (like C# 'public')

    export class TargetClass

Decorators are used to define modules (via decorator 'NgModule'), Components (via decorator 'Component'), Directives (via decorator 'Directive').

### Modules

Blocks of functionalities and features cfr NuGet.
Every application has at least one Angular module.
The root module (called by convention AppModule in app.module.ts) is the entry point for the whole application.

    import { NgModule } from '@angular/core';   # Used to define a module
    @NgModule({             # Module Metadata Properties
        imports: [],        # Imports other modules needed
        providers: [],      # Service Declaration, using DI (lazy-loaded, if they don't exist yet, they're instatiated now)
        declarations: [],   # Declares available (local) modules
        bootstrap: []       # Sets the entry point component of the application
    })
    export class KokoModule {}

BrowserModule   # Contains directives, pipes, etc. for working with the DOM

### Components

Angular is written in a nested component fashion. The root component is first rendered, then each nested component, etc. similar to the DOM tree of a webpage, that is all rendered from the root &lt;html&gt; component.
Each component is responsible for the rendition of a portion of HTML (cfr UserControl).
One Component can only be declared in one Module, but that module can be imported in another one. The Component must be placed in the export list of the referenced Module.
See <https://angular.io/guide/bootstrapping>
Component = directive on a class (hence it becomes a component class) + view (HTML template, using "template syntax").

    import { Component } from '@angular/core';
    @Component({                        # Component Metadata Properties
        selector: 'app',                # Locates a named HTML element, where the content of the following provided template will be lazy-loaded.
        template: '<h1>abc</h1>'        # Applies the given inline template
        templateUrl: './component.html' # Applies the given referenced template
        styles: [css]                   # Array of CSS style codes. Use ES2015 backticks '`' to write the content on multiple lines.
        styleUrls: [paths]              # Array of paths to CSS stylesheets
                                        # => CSS stylesheets can be scoped to individual Components!
    })
    export class AppComponent {}

### Binding & Templates Syntax

    {{Expression}}                      # Interpolation
    <element [property]="value" />      # Property Binding (DOM native or custom (input) property)
    <element property="{{value}}" />    # Property Binding using interpolation
    <element (event)="method(val)" />   # Event Binding (DOM native "onevent" or custom (output property) event)
    [(ngModel)]="property"              # Two-way binding
    [class.koko]="a === b"              # Class Binding (applies a CSS class only if a condition is met)

#### Input Property

    import { Input } from '@angular/core';
    @Input() property;                      # Declares a property as input property.
    @Input('propertyInputAlias') property;  # Declares a property as input property with given input name.
    <element [property]="value" />

#### Output (Event) Property

    import { Output, EventEmitter } from '@angular/core';
    @Output() eventProperty = new EventEmitter();   # Declares an event.
    @Output('eventAlias') eventProperty;            # Declares an event with given name.
    this.eventProperty.emit(property);              # Invokes the event, passing given parameter.
    <element (eventProperty)="method($event)" />    # Handles the event, retrieving the parameter.
    method(property) { ... }                        # Handler implementation, with event parameter as input.

### Directives

Directives provide functionality and can transform the DOM.
They don't have a template, but can be applied to existing elements, using selectors (similar to CSS).

#### Structural Directives

Affect the layout, alter DOM elements.

\*ngIf and \*ngFor are syntactic sugar for a more complex expression with [ngIf] and [ngFor] using outer elements

    *ngIf="boolean_expression"  # Removed from DOM if boolean_expression
    *ngIf="property"            # Removed from DOM if undefinedOrNullOrEmpty(property)
    *ngIf="expression"          # Transpiled to <ng-template [ngIf]="expression"><div></div></ng-template>
    *ngFor="let property of properties" # Transpiled as well, but a little more complicated
See <https://angular.io/guide/structural-directives#the-asterisk--prefix>

#### Attribute Directives

Appearance or behaviour of existing DOM element (ex.: change color of a label on mouse-click)

Choose CSS class of element according to medium type

    <element [ngClass]="{'css-class-man': human.gender==='Male', 'css-class-woman': human.gender==='Female'}" />
    <element [ngClass]="{'movies-class': medium==='Movies', 'series-class': medium==='Series'}" />

##### Custom Attribute Directives

    import { Directive, HostBinding } from '@angular/core';
    @Directive({ selector: '[kokoAttribute]'})          # Will be applied to HTML element (similar to CSS selector).
    export class KokoDirective {
        @HostBinding('class.is-koko') isKoko = true;    # The HostBinding targets properties, and "class" is a native DOM property available on all elements.
                                                        # => KokoDirective.isKoko controls whether the is-koko CSS class gets applied to the host element.
                                                        # The host element = the element that has the directive on it.
    }

### Services

Cfr Helpers + Data layer

### Pipes

Similar to WPF converters & Formatters

## TODO

### Service Calls

```js
ngOnInit() {
    // Place l'appel de service dans le ngOnInit plutôt que dans le constructeur.
    // Car le constructeur est réservé pour les initialisations super simples.
    this.loadHeroes();
}

ngOnInit(): void {
    this.heroes$ = this.searchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      // SwitchMap conserve l'ordre des requêtes envoyées (càd celles qui ont passés les filtres ci-dessus),
      // et va se charger de discarder le résultat des + anciennes pour ne conserver que celui de la dernière.
      // See https://angular.io/tutorial/toh-pt6#chaining-rxjs-operators
      switchMap((term: string) => this.heroService.searchHeroes(term)),
    );
  }
```

### Nested Index

./comp-a/index.ts
./comp-a/a.ts
./comp-b/index.ts
./comp-b/b.ts

=> ./index.ts contains

```js
export * from './comp-a/index';
export * from './comp-b/index';
```

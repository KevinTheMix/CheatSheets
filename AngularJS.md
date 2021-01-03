# AngularJS

AngularJS is a JS framework for easy dynamic HTML pages creation.
It works as a preprocessor that translates tags and special markings found on the page (thus visible in source code) at runtime.
The binding is accomplished by constructing an application (or module) model and binding/reacting its attributes to the HTML view.
The neat trick is that any change to the model is propagated in the view without any manual DOM manipulation.

## Setup

Import the framework library using a &lt;script&gt; tag.
Include directives and expressions within the HTML code.
Write controller code inside &lt;script&gt; tags.

## Components

### Variables

    $rootScope # Default top-level scope. Additional specific scopes will be organized below this one.
    $scope # Contains application variables & methods accessible in both controller and view (anywhere within element to which it is attached)
    $http # HTTP object for reading data from web server
    $index # Zero-based index of a row within a table (ng-repeat)
    $even # In context of ng-repeat
    $odd # In context of ng-repeat
    $routeProvider # Routing
    $routeParams # Contains the :variables in the route

### Methods

    var {app} = angular.module # Define the application module
    {app}.run # Sort of the main method of the Angular application
    {app}.controller # Define a controller
    {app}.directive # Define a new directive. The name of directive is in c/CamelCase in the script and dash-separated lowercase in the view
    {app}.factory # Defines a service
    {app}.filter # Define a display filter (see https://docs.angularjs.org/tutorial/step_09)
    angular.copy # Deep copy an object

### Directives

Binds behaviour to HTML elements. Additional directives can be defined to make standalone UI components (aka self-contained HTML template)
Predifined directives start with 'ng-' (or 'data-ng' for valid HTML)

    ng-app # Define the Angular application
    ng-controller # Define a controller of the application data
    ng-model # Bind a HTML Form element to the application data (preload or dynamic update)
    ng-init # Initialize application data (usually done using the controller within a <script> tag)
    ng-repeat # Loops through an array, usually to display elements in a list or table format
    ng-bind # Binds HTML view to application data (display the model), like expressions
    ng-disabled
    ng-if # Conditional expression
    ng-show # Display the element based on the true/false value of this directive
    ng-hide # Opposite of ng-show
    ng-click # Executes the associated statement when clicked
    ng-include
    ng-src # Sets an img src from application data.
           # Necessary compared to src otherwise the unparsed data would briefly be used as URL
           # See <https://docs.angularjs.org/api/ng/directive/ngSrc>
    ng-view # Combined with routing, integrates  view templates into the main (index.html) layout
           # If the view changes, only the view template is update on the page
           # Note that the routing library must be separately included since it's not part of Angular default lib
           # E.g. <script src="<https://code.angularjs.org/1.2.28/angular-route.min.js>"></script>

### Expressions

Evaluated and displayed in place. Identical to ng-bind directive.

    {{val}}
    {{s1 + " and " + s2}}

#### Filters

Appended to an {{expression}} using a pipe character

    | currency # Format field as a currency
    | Filter # Filter on the content of the row
    | lowercase
    | uppercase
    | orderBy : "Field" # Order by a specified field

### Services

Standalone reusable communication logic. Produced by a factory and used by the controller to fetch data from a server.

    app.factory("myService", ["$dependency", function($dependency) {
      return $dependency.stuff();
    }]);

## Syntax

### Application

In js/app.js

    var app = angular.module("myApp", []);

With routing

    var app = angular.module("myApp", ['ngRoute']);
    app.config(function ($routeProvider) { $routeProvider
      .when( PATH, {OPTIONS})
      .when('/', {controller: 'HomeController', templateUrl: 'views/home.html'})
      .otherwise({redirectTo: '/'});
    });

In index.html

    <body ng-app="myApp">

### Controller

Standard

    app.controller('myController', ['$scope', function($scope) {
      // Initialize attributes and methods
    }]);

With Service

    app.controller('myController', ['$scope', 'service', function($scope, service) {
      service.success(function(data) {$scope.items = data;});	// JSON data
    }]);

With Route parameters (e.g. '/:id')

    app.controller('EventController', ['$scope', 'service', '$routeParams', function($scope, events, $routeParams) {
      service.success(function(data){ $scope.item = data.JSONrecords[$routeParams.id] })
    }]);

In index.html

    <div class="main" ng-controller="myController">

### Service

    app.factory("shows", ["$http", function($http) {
      return $http
        .get("<https://s3.amazonaws.com/codecademy-content/courses/ltp4/shows-api/shows.json>")
        success(function (data) {return data;})
        error(function (err) {return err;})
    }]);

### Directive

    app.directive("myDirective", function() {
      return {
        scope: {info: '='},
        templateUrl: "js/directives/myDirective.html"
      };
    });

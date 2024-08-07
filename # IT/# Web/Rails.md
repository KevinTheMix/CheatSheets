# Rails

## Installation

Cygwin file path endline character fix (see <https://github.com/sstephenson/execjs/issues/78>).
Coffee script 1.9.0 bug (see <http://stackoverflow.com/questions/28241981/rails-4-execjsprogramerror-in-pageswelcome>).

## CLI (run from application directory)

### Generators

* `rails g[enerate]` = displays all available generators for the application (depends on the Gems e.g. RSpec)

### Rake

Utility to automate certain tasks (automation tool i.e. a Ruby Make e.g. running all DB migration scripts).

* `rake -T` = displays all tasks
* `rake -T db`= displays all DB-related tasks

## Debugging

*`fail` = debugging trick to raise an exception and stop the application at a certain point (e.g. in a Controller to look at request parameters)

## Augmented API % Ruby (e.g. from ActiveSupport Gem)

* `10.day[s]` = quantity of seconds in days (864000)
* `10.month[s]` quantity of seconds in months
* `10.year[s]` = quantity of seconds in years
* `864000.from_now` = day in 10 days (ActiveSupport::TimeWithZone object)
* `5.days.ago` = day 5 days ago (ActiveSupport::TimeWithZone object)

# Applications

## Creation & Configuration

### Create

* `rails new {application}` =generates the application structure, including a Gemfile, and runs 'bundle install'
* `rails new {application} --skip-test-unit (aka -T)` = doesn't embed Test::Unit in the application (in case we want to use another/no test gem)

### Gemfile

In ~/Gemfile.
Manifest of required Ruby Gems dependencies.

* `gem "{gem}"` = requires specified gem in the application
* `group :environment do … end` = requires specified gem for specified environment

### Bundle

* `bundle install` = downloads and installs all the dependencies found in the Gemfile
* `bundle install --without production` = exclude gems in a given group
* `bundle update {gem}` = updates specific gem from Gemfile configuration
* `bundle check`

### Environment
In ~/config/environments.

	ENV['RAILS_ENV'] ||= 'development/test/production'

#### Development
Code reloaded upon changes, no caching, verbose logging, debug info shown in browser, simple DB.

#### Production
Loaded once, caching, lighter logs & no debug info (error pages), heavier DB, precompiled assets (public/assets).

### Server
	rails s[erver]					# Ctrl+C to stop
	rails s[erver] -e production 	# Start the server and set the environment to production

### Initializers
In ~/config/initializer/*.rb.
Loaded when application starts. Used to set application constants and default values.

### Resource
Generates Route, Controller class, View directory, Helper class, Assets (JS CSS), Model class & Migration (& tests).

	rails g[enerate] resource {resource} [{field}:{type} ]*	# --no-test-framework

### Routes
In ~/config/routes.rb.
First thing a request hits when it is received by the server.
Maps HTTP verb (GET, POST, PATCH, PUT, DELETE) & path & params request onto controller/action pair.
HTTP Verbs (see http://en.wikipedia.org/wiki/Hypertext_Transfer_Protocol#Request_methods).
The order of the routes in the file determine their precedence => put the more specific ones near the top or the variable ones will absorb them.
A controller has one default route prefix and additional ones must be defined for other actions in the same controller.
A same route prefix can be used for different actions if their request verb is different.
Standard actions are index, show, new/create, edit/update, destroy

	root "controller#action"						# Main page. Accessible from everywhere by root_path() and root_url()
	get "page" => "controller#action"				# Maps a GET request to page to a controller/action pair ("/page" also)
	get "page" => "con#act", as: "prefix"			# Also defines the two helper methods prefix_path() and prefix_url()
	get "page/:param" => "con#act"					# Maps a GET request to page/X to a controller/action pair, passing along X as URL param key
	get "page/:param" => "con#act", as: "prefix"	# Also defines the two helper methods prefix_path(param) and prefix_url(param)
	
#### Resources
Since it is so common to have one page per CRUD-type operation on entities (i.e. resources),
Rails uses a conventional style to define all those methods at once using the following single line commands.
Nested resources makes child under parent i.e. URL "movies/:movie_id/reviews" && child controller can access params[:movie_id].
Nested resources must indicate both resources ID to target most action (except index/new (create is reached by POST)).
E.g. nested resource edit action: "movies/:movie_id/reviews/:id/edit".
The resources generated actions can also be individually chosen using additional parameter "only: []"
See http://www.codecademy.com/articles/standard-controller-actions

	resources :movies
	resources :movies {resources :reviews}
	resources :movies, only: [:index, :show]

#### Helpers
Router helper methods that generate an URL. Use the "app." object to access outside a view (e.g. Rails console).
Using these allows us to manage all our URLs in the single routes.rb file that the other parts of the application refer to.
This way, we can change our routes and URL configuration, move stuff around and only make changes in one place.
These methods are typically used inside a link_to() method to link the application together.
If the route contains URL params, they must be provided to the helper methods e.g. page/:param => prefix_path(param).
We can pass a model object instance in place of its ID e.g. prefix_path(object.id) and prefix_path(object)' will target the same page.

	.prefix_path()	# URL path (usually from a View)
	.prefix_url()	# Full URL (usually from a Controller)

#### Command-Line
Information about our routes. Also displays route prefixes in the helper methods.

	rake routes	# Same information is displayed via server page http://localhost:3000/rails/info/routes


## Controller
Middle-man, gets data from a model and pass it to views. Renders the view template corresponding to the requested action.
Responsible for a single resource (i.e. 1 model <-> 1 controller <-> N views).

###	Generate
Name is plural because it manages a number of requests (case irrelevant in the following command).
Generates app/controllers/{controller}s_controller.rb controller.
Creates app/views/{controller}s Views directory.
Generates test/controllers/{controller}s_controller_test.rb unit test (unless --no-test-framework).
Generates helpers & assets (Javascript/CSS).

	rails g[enerate] controller {controller}s
	
### Controller class
In ~/app/controllers/{controller}s_controller.rb.
Notice that model @instance_variables cease to exist in between page calls => they must be fetched in each method.
	
	class {Controller}sController < ApplicationController
		before_action :method 	# Calls method before entering each action => put common initialization/behaviour here

		def action				# A method in the controller == an Action. Corresponds to a view template with the same name
			@instance_variable	# Used in the corresponding view
			Model.fun()			# Has access to the models without 'require' (files in app/models/ are loaded automatically)
			flash[:key] = "Ok"	# The Flash is a Hash object available both in controllers and views that is used to transmit notification messages
			redirect_to @movie, key: "Ok"	# Shortcut to redirect and sets a Flash message in one line (key is usually :notice or :alert)
		end
			
The following action methods are named by convention

	def index					# Display all the objects
		def show				# Display one specific object
			params				# Access to all request parameters within a Controller via Hash 'params' (actually a ActionController::Parameters)
			params[:key]		# Contains URL GET params, URL fragments as defined in config/routes.rb, and POSTed objects
		def edit				# Edit one specific object
		def update				# Landing page of PATCH request issued by the Form on the edit page
			params[:id]			# The ID of an object			
			params[:movie]		# The values of the attributes of a model object set in a Form
			params.require(:key)# Checks that :key is present request params and return its associated value (exception otherwise)
			params.require(:key).permit(:attribute, ..)	# Checks that key is present and white-lists model object specified attributes
			redirect_to			# Redirect to target via new GET request (like link_to(..) auto uses class_path(@object.id) if we only provide @object)
		def new					# Create a new object
			@movie = Movie.new	# Even if it's empty, the Form on the creation page needs an object to bind to
		def destroy				# Delete one specific object
		
		# Defines a private section, whose methods can only be access from within the controller AND they cannot be used as routes actions
		private					# Here be private utility methods that alleviate the main action methods. Increase indent by 1 by convention to improve visual recognition.
	end


## View (Template)
Name e.g. ~/app/views/models/action.html.erb.
Responsible for formatting the HTML (or any other format) output with the data provided by the controller. Is not concerned with the underlying model.
Contains HTML body and Ruby code inside ERB tags <% %> for control flow and <%= %> to display last expression .to_s (e.g. instance variables).
Provides helper methods to format display (e.g. number_to_currency).
See http://stackoverflow.com/questions/16822775/difference-between-render-and-render-partial-and-yield for usage in yield/content_for and render.
	
### Layout
Main view file that includes (i.e. '<%= yield %>') the HTML that actions generate (à la C# Master Page).
Typically holds sections that are common to every page (e.g. header/footer/side bar).
Including partials e.g. render "layouts/partial" => app/views/layouts/_partial.html.erb.
This is typically where the Flash messages get displayed since it is available to all pages.
Layout page can include information specified in the views using the yield + content_for syntax.

### Partial
Partials are pieces of view templates that can be reused (rendered) from several locations.
Use partials to remove duplication or break down large templates into maintainable chunks (just like code can be broken up into methods).
They can contain any code that would belong in a *.html.erb file, including @instance_variables, etc.
Their file names start with an underscore "app/views/models/{model}s/_partial.rb" unless referred from a view (i.e. render "partial" (extension optional)).
To increase reusability, use local variables instead of instance variables (specify match in render() e.g. render "my_partial", var: @var).

### Helper
Helpers are available inside view templates. Use the "helper." object to access helpers methods from outside a view (e.g. Rails console).

	module {Controller}sHelper
		# Library of helper methods (e.g. formatting and conditional logic display)		
	end

#### Form
The following statement binds an object to a Form. In case of an update, the fields will be prefilled automatically with its :attributes.

	<%= form_for(@movie) |f| %>
	<%= form_for([@movie,@review]) |f| %>				# Nested resources URLs => several :parameters (except index/new) => need both for action URL
		# Form fields (applied to the block parameter e.g. <%= f.field :attribute %>)
		.label				:label						# Can be anything (underscores will be removed and capitalized)
		.text_field			:attribute, param: value 	# Parameters e.g. autofocus: true, size: 30, placeholder: "default text"
		.text_area			:attribute
		.number_field		:attribute
		.select 			:attribute, [values], prompt: "Text
		.datetime_select	:attribute"
		.submit		# The text and target (PATCH movies/:id or POST movies/) of the submit button also depend on whether it's an update or creation
	<% end %>
	
#### API
Check Rails API documentation for comprehensive list of available helper methods.

	.blank?						# true if length of String, Array or Hash == 0 (or String is only whitespaces)
	n.zero?						# true if number == 0
	n.number_to_currency(i)		# Formats a number as "$xx.xx"
	t.to_sentence				# Concatenates the items in the Array as a String (e.g. "item1, item2, and item 3")
	s.html_safe					# Prevents escaping on the String => Makes it possible to include HTLM tags
	pluralize(count, singular, [plural])	# (Unknown words can be defined in config/initializers/inflections.rb)
	truncate("text", length, "separator") 	# 'length' can be negative
	content_tag(:tag, content)	# Creates a HTML <tag>content<tag>
	
#### Links
Second parameter is an URL or a model instance (e.g. @model => auto use class_path(@model)). Can take a block, in which case everything inside is a link.

	link_to(target)														# Displays target.to_s()
	link_to("text", target)
	link_to("text", target, id: "id", class: "class")
	link_to("text", target, method: :verb)								# Associate specific HTTP verb with the link
	link_to("text", target, method: :delete, data: {confirm: "Sure?"})	# E.g.: delete link with confirmation
	<%= link_to() do %> ... <% end %>									# ... gets URLed

#### Nested
	link_to("text", parent_childs_path(@parent, @child) 				# Show link for nested resources
	link_to("text", [@parent, @child] 									# Show link for nested resources (shortcut)
	link_to("text", [@parent, @child], method: :delete)					# Delete link for nested resource (shortcut)
	mail_to(address, "text")
	
#### Date/Time
	Time.new.to_s(:short)	# Actually a key in the hash constant Time::DATE_FORMATS => "%d %b %H %M"
	Time.new.to_s(:long)	# "%B %d %Y %H %M"
	# DATE_FORMATS values are set-able => we can change the :default one
	# Put the following lines in a custom initializer (e.g. config/initializers/time_formats.rb)
	Time::DATE_FORMATS[:default] = "%B %d, %Y at %I:%M %p"
	Date::DATE_FORMATS[:default] = "%Y"	# Same goes for dates

#### Image
	image_tag({image})		# Creates a HTML <img> tag ({image} refers to an image in the app/assets/images directory)

### Assets
Assets reside in one of three directories (app/assets, lib/assets & vendor/assets).

	app/		Specific to the application (since app/ directory)
	lib/		Custom libraries shared across applications
	vendor/	Third-party libraries

Regardless of their physical location, they are accessible in the browser via a common URL under the '[website]/assets/*' path.
In production, the processed assets are stored at their final destination in the public/assets/ directory from where they are referenced statically

#### Stylesheets
Stylesheet manifest (app/stylesheets/application.css) file
Aggregates all the styles found in the required files. By default: require_self (this file) and require_tree . (the current directory and subdirectories)
A stylesheet was automatically created when we generated the controller and should be used for the styles related to the controller
SCSS (& SASS) stylesheets files are interpreted into regular CSS. They extend the possibilities of CSS e.g. using variables and OO concepts
The interpreted and concatenated result can be viewed in the browser in the single generated stylesheet file ({website}/assets/application.css)
In production, the resulting single stylsheet is minified and a MD5 fingerprint is added for browser caching
Stylesheets can include partials (@import "partial";). Not that the partial file doesn't have a ".css" in its extension (e.g. "_partial.scss")

## Model
### Database
SQLite 3 is a lightweight file-based database (i.e. contained in a single file)
In production, use something more production-like (MySql, PostGreSQL, etc.)
Three environments are defined by default: development/test/production (see config/environments)
Application environment database configuration file (config/database.yml)

	db/development.sqlite3
	db/test.sqlite3
	db/production.sqlite3

### DDL
#### Generate
Model name is singular. No spaces between '{field}:' and '{type}' or it will create 2 string fields instead
Fields of type 'date' should end with "_on" and of type 'datetime' should end with "_at"
To create a Foreign Key to another model, set "{field}:{type}" to "{model}:references"
Generates a app/models/{model}.rb model Class
Generates a db/migrate/yyyyMMddhhmmss_create_{model}s.rb migration file (does not create the table itself)
Generates a test/models/{model}_test.rb unit test & test/fixtures/{model}.yml test fixtures (unless --no-test-framework)

	rails g[enerate] model {model} [{field}:{type} ]*

Displays available field types (decimal, integer, date, datetime, string, text)	# text is for longer pieces of text

	rails g[enerate] model

Wouldn't make sense to re-generate the whole DB everytime we make a change to the schema, so we create a new migration file for the increment only
Name of the migration should end with "To{Model}s" so that the framework knows on which model to apply the modification
Generates a db/migrate/yyyyMMddhhmmss_do_stuff_to_{model}s.rb migration file

	rails g[enerate] migration DoStuffTo{Model}s [{field}:{type} ]*

#### Model class
Class name e.g. ~/app/models/{model}.rb is singular
No variables/attributes are defined in Model class; ActiveRecord extracts its structure dynamically from corresponding DB table schema

	class {Model} < ActiveRecord::Base
		# Business logic (local to model, as instance methods)
		# Validation
		# No need to check for existence if check the value as well (more specific counts)
		validates :attr1, :attr2,.., check1: value1, check2: value2, ..	# Values are direct values or Hash of options

		# References
		# Indicates to Rails relationships between models and the presence of FKeys
		# Then we can use the referenced model name(s) to get/set attribute an object instead of handling FKeys
		class Review
			belongs_to 	:movie
		class Movie
			has_many	:reviews						# Notice plural
			has_many	:reviews, dependent: :destroy	# Destroy child object as well before this parent one is destroyed
			
#### Migration files
Contains set of instructions to alter the DB structure or schema (DDL)
Written in Ruby code to manipulate DDL => independant from the actual DBMS implementation

	class Create{Model}s < ActiveRecord::Migration 				# Create
		def change
			create_table (:table) do |t|
				t.type 			:field
				t.references	:model, index: true 			# Foreign Key field (alias t.belongs_to)
				t.timestamp 									# Created automatically to hold the created_at & updated_at fields
	class DoStuffTo{Model}s < ActiveRecord::Migration 			# Alter
		def change
			add_column(:table, :name, :type, default: value)	# Default value sets field value for all existing records as well

#### Migrate
	rake db:migrate:status				# Checks the status of all the migration file in db/migrate/ ("up" == done, "down" == to do)
	rake db:migrate						# Migrates the database. Runs all the untreated migration files in db/migrate/ on environment database
	rake db:migrate RAILS_ENV=test		# Migrates to another environment (default is development)
	rake db:test:prepare				# Copies development DB schema & data to test DB (alternatively, migrate test DB using above command)
	rake db:rollback [STEP=n]			# Reverses [n] last applied migration[s]. Deletes all the data that any removed fields held			
	rake db:drop db:create db:migrate	# Recreate the DB from scratch
	rake db:seed						# Executes the seeds file (db/seeds.rb) meant to insert some initial data to DB

#### Rails console
Like IRB for Ruby

	rails c[onsole]
	rails c[onsole] -e environment={environment}	# Or just rails c environment
	reload!							# Reload the application code changes since last load. Does not reload existing model objects' instance methods
	{Model}							# Model class and its attributes (might require {Model}.connection first)

### DML
The DB data itself is manipulated via instance methods on the Model object
Indeed, the Model inherits from ActiveRecord::Base that provides DML queries methods i.e. create, save, count, all, first, last, find, etc.
See api.rubyonrails.org/classes/ActiveRecord/Persistence.html

#### Validation
	m.valid?				# Perform the validation checks associated with the model, fills its errors collection as needed and returns true/false
	m.errors				# Hash (actually an indexed ActiveModel::Errors object) of validation errors raised by m.valid?
	m.errors.any?			# true if m.valid? (or via m.save) has been called and there were validation errors (similar to m.errors.count >= 0)
	 						# Use this after the initial 'm.valid?' to check if there where errors so that the whole validation is not performed again
	m.errors[:field]		# Array of the errors related to a specific field
	m.errors.full_messages	# Array of all errors in a readable format	 

#### Create & Update
Methods m.save, m.update and m.create are cancelled if the validation (using m.valid?) does not pass
Methods m.save and m.update also returns true/false depending on validation result

	m = Movie.new
	m = Movie.new(field:value, .)	# (Hash)
	m.attribute = value
	m.save							# Persist instance updated (and 'updated_at') fields (also 'id' & 'created_at' if creation)
	m.update(field:value, .)		# Set several fields from Hash then save(). Useful when dealing with HTML forms. Alias .update_attributes(..)
	Model.update(id, field:value, .)# Alternatively, by ID instead of instance itself

#### Create (returns a Movie object)
	Model.create(field:value, .)	# Create a new record from the values in a Hash
	Model.create([{.},{.}])			# Create several records from the values in an Array of Hashes
	Model.create!(.)				# Create or raise an exception if it fails, as opposed to just returning false

#### References
References are implemented in DB as FKeys, but are manipulated like regular attributes

	m.reviews						# Array of reviews (actually an ActiveRecord::Associations::CollectionProxy)
	m.reviews.size 					# Array methods are available
	m.reviews.new 					# Create a model instance and link its references (e.g. r.movie.reviews.first.movie..)
	m.reviews.new(field:value, .)	# Hash-type creation prefered style
	r.save 							# Create/update the instance in DB (if valid?)

#### Delete
	m.destroy						# Delete a model instance from DB. Usually called from an action method handling a HTTP DELETE verb
	Model.destroy(id)
		
#### Select
These methods returns one or more model objects => we can update & save & destroy them
If the method can return many results, we actually get an ActiveRecord::Relation usable as an Array of model objects
The methods are chainable => Movie.where().order().find_by()... converts to a single SQL query

	Movie.count		# SELECT COUNT(*) FROM movies
	Movie.limit(n)	# SELECT * FROM movies LIMIT n
	Movie.take([n])	# SELECT * FROM movies LIMIT n
	Movie.first([n])# SELECT * FROM movies ORDER BY id ASC LIMIT n (=> Array if n > 1)
	Movie.last([n])	# SELECT * FROM movies ORDER BY id DESC LIMIT n
	Movie.all		# SELECT * FROM movies

##### Find
	Movie.find(id)					# Select first matching record (LIMIT 1) by ID - Exception if unfound
	Movie.find_by(field: value, .)	# Select first matching record (LIMIT 1) by one or multiple fields - Nil if unfound
	Movie.find_by!(field: value, .)	# Select first matching record (LIMIT 1) by one or multiple fields - Exception if unfound

##### Where
More generic than 'find' methods. Returns an ActiveRecord::Relation object (several model objects)
Appending .to_sql() returns a string containing the SQL query without running it	

	Movie.where(field: "value")		# Select all matching records (no LIMIT)
	Movie.where("condition")			# E.g. Movie.where("score >= 8")
	Movie.where("condition ?", param)	# Placeholder /?/ is replaced with /'param'/ (e.g. variable or "%value%")
	Movie.where.not(field: "value")	# Opposite

##### Order
	Movie.order(:field)
	Movie.order("field [asc,desc]")	# Select all the records ordered by a field (Ascending by default)


# Testing
## Introduction
RSpec uses a domain-specific language to specify the expected behaviour of a code
Capybara allows to simulate user interaction with a page (e.g. button clicks, GET requests, etc.)
First add the RSpec (and Capybara) gem to the Gemfile so that it is required in the application, then run 'bundle install'
	
Tests are divided into two categories: features and models
Features tests pertain to broad functionalities whilst models specs are narrower in scope and apply to one model's internal logic

## Generate
Create spec/ directory including the rails_helpers.rb and spec_helper.rb file
Also configures Rails to use RSpec by default instead of Test::Unit
rails g[enerate] rspec:install
	
## Config
See http://www.opinionatedprogrammer.com/2011/02/capybara-and-selenium-with-rspec-and-rails-3/
See http://stackoverflow.com/questions/15148585/undefined-method-visit-when-using-rspec-and-capybara-in-rails
See http://stackoverflow.com/questions/24145329/how-is-spec-rails-helper-rb-different-from-spec-spec-helper-rb-do-i-need-it

	require 'capybara/rspec'
	require 'capybara/rails'

Tests are run within a SQL transaction that gets rollbacked at the end so that all data modification is reset
To prevent this, set the 'config.use_transactional_fixtures = true' to false (in /spec/rails_helpers.rb)

## Command-line
	rspec					# Runs all the specification tests for the entire application (not the current directory '.' as in Ruby)
	rspec --format doc		# Runs all the tests and display the result in a text-friendly way (aka rspec -f d)
	rspec spec/**/*_spec.rb	# Runs a specific spec file. Must be run from the application directory for 'require' paths to work

## Spec file
Requiring the Rails helper file (spec/rails_helper.rb) also requires the Spec helper (spec_helper.rb) and sets up the test environment
If we have support test files, make sure that the line including them is uncommented in the Rails helper file

	require "rails_helper"
	
The tests are formatted as tasks addressing an assertion. Drop the trailing block to define a pending task

	it "does something" [block]
	
The syntax of the tests themselves use a Target and a Matcher as parameter of the Target method

	Target.(Matcher)
	
### Targets
	expect(page).to()		# () optional
	expect(page).not_to()	# () optional
	
### Matchers
	.be()			# Compares object_id
	.eq()			# Compares values
	.have_text()	# Contains text

### Capybara methods
	visit(url)
	click_link(link_text)


# Deploy
## Configuration
Configure the production environment in order to be deployed, in this case to a Heroku server

### Environment
In ~/config/environments/production
	
	# Accomodating for Heroku
	config.serve_static_assets = true

### Database
In ~/config/database.ynl

	# Nothing, handled by database.yml generated by Heroku

### Gemfile
In ~/Gemfile

Indicate the exact version of Ruby

	ruby '2.0.0'

Surround development and production groups

	group :development, :test do
		gem 'sqlite3'
	end

	group :production
		gem 'pg'	# PostGreSQL
	end

Then run the changes in command-line, omitting the Heroku PostGreSQL config locally

	bundle install --without production
	bundle check

## Publish
Git allows use to push our code onto the Heroku server.
First, include the project code into a local Git repository

	git init
	git add .
	git commit -m 'MESSAGE'

Run the tests one last time before actual publishing

	rspec -f d

At this point, you must have Heroku account

	heroku create # 8.00

Next,

	git remote -add origin ''
	git push origin master

## Extensions

* **Brakeman** = free vulnerability scanner (static analyzer) for Ruby on Rails applications

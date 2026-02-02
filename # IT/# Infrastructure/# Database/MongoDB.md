# MongoDB

NoSql JSON (rich-)document-based DB.

## Quick Tips

* Compared to a static schema Relational DB, it is polymorphic, which means it can store instances of different shapes (ie relational `List<struct>` vs Mongo `List<object>`)

## Glossary

* **Collection** = a table
* **Schema** = formal definition of DB structure in JSON that defines if a field must be present, what type of values, etc
  * Can be defined strictly for all fields in the collection (which is then similar to relational), only some of them, or none (in which case it behaves as a key-value store)
  * There is of course some overhead associated with checking that a new object matches the required schema
  * Eg an e-commerce website (eg Amazon) has products with common attributes (name, price, quantity, description) but also various **product-specific** attributes (height, color, voltage, resolution, clothing fit size, etc)

## CLI

All commands must be run from MongoDB install folder (eg _C:\Program Files\mongodb-2.4.6\bin_)

* `mongod.exe --dbpath <Path to \DATA\ folder>` = start server handling requests (so we can query DB)
* `mongodump --out <output_directory> [--db <db_to_backup>] [--collection <collection_to_backup>]` = backup
* `mongorestore <input_directory>` = restore
* Requires a running server:
  * `show dbs` = displays server DBs list
  * `show databases` = display all available DBs
  * `use <db>` = select a DB
* Require a selected DB:
  * `show collections` = displays collections
  * `coll = db.<collection>` = assign collection to variable
  * `db.<collection>.find()` = returns all collection rows

## TODO

* [$eq(aggregation)](https://www.mongodb.com/docs/manual/reference/operator/aggregation/eq/#mongodb-expression-exp.-eq)
* [$size(aggregation)](https://docs.mongodb.com/manual/reference/operator/aggregation/size/#mongodb-expression-exp.-size)
* `$unwind`
* MongoDB.Entities = data access library for MongoDB with an elegant api, LINQ support and built-in entity relationship management

### Architecture

Under the hood, it is implemented as a series of nested documents referencing each other (=> à la dynamically allocated heap data vs static fixed-size data).

Contrarily to a relational DB, one-to-many relationships are inverted (eg wheels don't point to car, a car has a wheels IDs array instead)
E.g. it's not the wheels that possess a foreign key to the car (provided the DB is normalized), but the car has an _array_ of wheel IDs (or name, or reference, or whatever field can uniquely identify them - and is indexed).

For one-to-one relationship, the parent object contains the entire child object (kinda denormalized but ok to some extent since 1-to-1!).
In practice, deciding between embedding an entire child object within its parent, or only a reference (ID) to it, is a design decision (and there are multiple solutions!)
Indeed, the cost of embedding something that is used by too many different parent objects (e.g. a user can be included in an article, or a comment, or a purchase), rises sharply for updates, since data is no longer unique but duplicated at multiple locations => change must be propagated as many times (transactionally of course, so that it's atomic and coherent).

Of course the advantage of denormalizing, is that selecting data is much faster, as it eliminates time-intensive JOINs.
E.g. the Facebook timeline (object) of a user is updated not at the time a the user accesses it, but whenever one of his friends _posts_ something. That adding may take more time, but the user that posts stuff doesn't mind (and is presented with a nice _loading_ icon). Later, when the user reads her timeline, that will get loaded much faster, as it's already ready with all necessary data.

The steps to designing the DB are as follows:

1. Analyze what the developer/solution needs in terms of query (e.g. display a list of products with user reviews).
2. Only then, create the corresponding DB schema. Note that for relational DB, those first two steps are inverted!
3. There are multiple initial solutions, some more optimized to solve the issue at hand, whereas a relational DB should have only one (3rd normalized) solution.
4. During its lifetime, the DB design will undergo few changes, and remain easy to adapt, with no downtime (thanks to versioning).
5. (technical & user) performances are optimized

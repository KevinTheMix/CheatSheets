# Java

Java basé sur OAK et Smalltalk (et C++ interagit pour amélioration)

## Features (especially compared to C++)

* Portabilité (développement graphique integré au langage, alors qu'en C++ c'est à l'environnement/IDE)
* ~~Pointeurs~~
* ~~Héritage multiple~~ => interfaces
* ~~surcharge des opérateurs~~ primitifs (sauf + pour concaténation des strings)
* ~~Templates~~
* C++ : composants graphique gérés par l'IDE
* Java est beaucoup plus orienté objet, tout est objet, tout est une classe, même _main_, qui est une méthode (statique car on instancie pas le programme)
* Garbage Collector => on ne doit pas effacer nous-même la mémoire allouée dynamiquement
* No default parameter => use **method overload**
* Héritage : toujours `public`
* Class structure
  * C++ : `class … { private: … public: … };`
  * Java : `class … { public … public … private … }`
* No class destructor
* Défintion membres function directement dans la classe.

## Glossary

* **JVM** (Java Virtual Machine) = machine-specific install, runs portable bytecode
* _.class_ file = portable, compiled IL bytecode
* **AWT** (Abstract Window Toolkit) = API to develop platform-dependent (calling the native platform/OS to create GUI components) GUI/windows-based applications
* **JFC** (Java Foundation Classes)
* **Swing** = part of JFC to create windows-based applications, built on top of AWT, providing platform-independant & lightweight components

## CLI

* `javadoc` = generates HTML pages of API documentation from Java source files

## API

* `.` = à la C++ `::` et `->`
* `interface` = contrat, lorsqu'on l'implémente, on respecte ce contrat
* `super({parameters})` = appel constructeur class mère (doit être la première ligne)
  * `Child(parameters) : Parent(parameters) { … }` = calling parent constructor in initialization list
* `this(…);` = appel constructeur
* `return "" + valeur;` = opérateur `+` surchagé pour les chaînes
* `Class c` = class declaration
* `new Class(…)` = class instanciation

## Libraries

* [AndroMDA](http://andromda.sourceforge.net/andromda-documentation/getting-started-java) = generates code components from UML models
* Apache [Ant](https://ant.apache.org) = Java build tool
* [EMMA](http://emma.sourceforge.net) = Java code coverage tool ([Open Source Code Coverage Tools](https://java-source.net/open-source/code-coverage))
* [FindBugs](http://findbugs.sourceforge.net) = free Java code static analysis tool
* [Gradle](https://gradle.org) = multi-language (C++, Java, JavaScript) build tool
* [HTML Parser list](https://java-source.net/open-source/html-parsers)
  * [HTML Parser](http://htmlparser.sourceforge.net) = HTML parsing
  * [NekoHTML](http://nekohtml.sourceforge.net) = parse/fix HTML documents via XML interfaces
* JUnit = unit testing in Java
* Apache [Maven](https://maven.apache.org/what-is-maven.html) = build, management & automation tool for java projects
* [Moconti](http://hick.org/~raffi/moconti.html) = light-weight application server to create web sites using **Sleep** (see below)
* [MySQL Connector/J](https://www.w3resource.com/mysql/mysql-java-connection.php) = MySQL AB's JDBC Type 4 driver for MySQL
* [Pooka](https://suberic.net/pooka) = e-mail client written in Java
* [Sleep](http://sleep.dashnine.org) = multi-paradigm scripting language

# Java

Java > C++ car :

* Portabilité (développement graphique integré au langage != C++ -> à l'environnement)
* ~~Pointeurs~~
* ~~Héritage multiple~~ => interfaces
* ~~surcharge des opérateurs~~ primitifs (sauf + pour concaténation des strings)
* ~~Templates~~

Java basé sur OAK et Smalltalk (et C++ interagit pour amélioration)

JVM = machine virtuelle
On compile nos fichiers => bytecode universel (=> portabilité) = fichier _.class_
la machine virtuelle a en input le bytecode.
la machine virtuelle dépend, elle, de la machine.
Java est beaucoup plus orienté objet, tout est une classe, même le MAIN, qui est une méthode (statique car on instancie pas le PGM)

Le typage du langage est plus fort qu'en C++
=> le compilo détecte plus vite les erreurs qui pourraient survenir.

exemples refusés en Java :

* `if (truc = 123)`, en C++, tout est expression -> vrai si truc != 0, faux si truc = 0
* `int = double;`

Garbage Collector : on ne doit pas effacer nous-même la mémoire allouée dynamiquement.

types primitifs != objets => conteneur polymorphe, classe polymorphe.
En Java, tout est objet.

Déclaration : `Class c`
Instanciation : `new Class(…)`

Print =>

Niveau de protection supplémentaire : PACKAGE -> attr. & méthodes accessibles

Héritage : toujours _public_

Pas de valeurs par défaut => **surcharges**
On peut appeler un constructeur dans un autre => ~~surcharges~~ utile.
C++ : destructeur -> pas en Java

Travailler avec plusieurs fichiers :

* Créer un projet
* mettre les fichiers dans un rép. et PACKAGE _chemin.nomRep_ dans chaque FICH

Opérateur + surchagé pour les chaînes : `return "" + valeur;`

SUPER(params) -> appel constructeur mène (/!\ doit = 1ère ligne)
C++ : appel constructeur de la classe mène dans la liste d'init.
`FILLE(params) : MERE(params) { … }`
`String.ValueOf(int)` méthode statique de String

Javadoc (command) = Generates HTML pages of API documentation from Java source files.

En Java, pas de _::_ et _->_, tous es fait avec _._

Appel constructeur : `this(…);`

Défintion membres function : directement dans la classe.
Pas de param par défaut => surcharge.

C++ : composants graphique gérés par l'EDI
C++ : `class … { private: … public: … };`
Java : `class … { public … public … private … }`

SUPER : appel constructeur class mère

Evénement : objet ! => tous les événements héritent d'objets.
On peut créer ses propres événements pour des classes métiers en dehors de l'environnement graphique (AWT) -> API de base Java indépendant de l'DEI.

MOUSE EVENT
KEY EVENT

Bouton -> ACTION EVENT

Lorsqu'un événement se passe -> déclenche une action ; il va falloir qqpart écrire un code qui effectue une action quand on appuye sur le bouton -> Source, Fournisseur, Décencheur -> utilisateur de l'EVENT (Listeners)

Qui va utiliser le fait qu'on ait appuyé sur le bouton -> **évouteur**, client
Listener implémente l'interface (cfr classe, INTERFACE) => **prototypes** de **méthodes** seulement != code !
cfr classe abstraite

INTERFACE = contrat, lorsqu'on l'implémente, on respecte ce contrat

## Libraries

* [AndroMDA](http://andromda.sourceforge.net/andromda-documentation/getting-started-java/)] = generates code components from UML models
* Apache [Ant](https://ant.apache.org/) = Java build tool
* [EMMA](http://emma.sourceforge.net/) = Java code coverage tool
* [FindBugs](http://findbugs.sourceforge.net/) = free Java code static analysis tool
* [Gradle](https://gradle.org/) = multi-language (C++, Java, JavaScript) build tool
* [HTML Parser list](https://java-source.net/open-source/html-parsers)
  * [HTML Parser](http://htmlparser.sourceforge.net/) = HTML parsing
  * [NekoHTML](http://nekohtml.sourceforge.net/) = parse/fix HTML documents via XML interfaces
* JUnit = unit testing in Java
* Apache [Maven](https://maven.apache.org/what-is-maven.html) = build, management & automation tool for java projects
* [Moconti](http://hick.org/~raffi/moconti.html) = light-weight application server to create web sites using the [Sleep Scripting Language](http://sleep.dashnine.org/)
* [MySQL Connector/J](https://www.w3resource.com/mysql/mysql-java-connection.php) = MySQL AB's JDBC Type 4 driver for MySQL
* [Pooka](https://suberic.net/pooka/) = e-mail client written in Java

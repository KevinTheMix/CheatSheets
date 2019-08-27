# Apache Lucene

Bibliothèque Java (càd DLL) de recherche d'information, données textuelles.

Ecrit en Java, Free & Open Source (Licence Apache), Client en C#.
Full-text indexing & Searching => moteurs de recherche.
Fuzzy search ~ Edit distance (Levenstein).
Système de recommandation.
Archi basée sur document (PDF, HTML, Word, Mind map, etc.) contenant des champs de texte.
Utilise :

* Index inversé (<https://fr.wikipedia.org/wiki/Index_invers%C3%A9>)
* _NEW_ BKD Tree pour recherche de nombres via Points (<https://en.wikipedia.org/wiki/K-D-B-tree#BKD_tree>)
  * k-d(imension) tree = space partitioning, range search & nearest neighbour search
  * B tree = Nodes avec plusieurs valeurs dans certaine range (=> less balancing but more storage), Read/Write optimized, DB indexes & searches
* See <https://en.wikipedia.org/wiki/Search_engine_indexing>

## Query

    terme               # recherche un mot (entier) tel quel (case-insensitive) dans le champ par défaut
    champ:terme         # recherche un mot dans le champ spécifié
    ter?e               # recherche un mot de 5 lettres avec une wildcard
    ter*                # recherche un mot commençant par "ter"
    te*e                # recherche un mot commençant par "te" et finissant par "e"
    terme~              # recherche un mot "proche"
    terme~n             # recherche un mot dont la distance Levenstein vaut longueur(terme) * n (n étant compris entre 0 et 1)
                        # => n=0 pour mots égaux et n=1 pour mots transposés (càd même longueur mais totalement différents)
                        # see <https://lucenenet.apache.org/docs/3.0.3/d0/db9/class_lucene_1_1_net_1_1_search_1_1_fuzzy_query.html#a7fc1ca1709b1e093ad9fa2e4455ac2e2>
    terme^n             # "booste" un terme de recherche pour qu'il pèse plus lourd dans la recherche
    "termeA termeB"     # recherche un phrase (entière)
    "termeA termeB"~n   # où n est un nombre maximum de mots séparants ces mots
    champ:[1 TO 10]     # Recherche d'intervalle. Fonctionne pour les champs textes. A utiliser pour les champs numérique dans une NumericRangeQuery
See <http://www.lucenetutorial.com/lucene-query-syntax.html>

### Exemple

"verre est autre"~4 -FAUX OR body:koko OR Berc?

### Query Types

QueryParser parse une query entière en plusieurs sous queries (séparées par des opérateurs booléens).
Ces queries spécifiques sont TermQuery, PhraseQuery, BooleanQuery, (Numeric)RangeQuery, etc.

| Sub-Query | Purpose | Example |
| --------- | ------- | ------- |
| TermQuery | Single term query, which effectively is a single word. | reynolds |
| PhraseQuery | A match of several terms in order, or in near vicinity to one another. | “light up ahead” |
| RangeQuery | Matches documents with terms between beginning and ending terms, including or excluding the end points. | [A TO Z] or {A TO Z} |
| WildcardQuery	| Lightweight, regular-expression-like term-matching syntax. | j*v?  or f??bar |
| PrefixQuery | Matches all terms that begin with a specified string. | cheese* |
| FuzzyQuery | Levenshtein algorithm for closeness matching. | tree~ |
| BooleanQuery | Aggregates other Query instances into complex expressions allowing AND, OR, and NOT logic. | reynolds AND “light up ahead”  or cheese* -cheesewhiz |
See <https://www.javacodegeeks.com/2015/09/advanced-lucene-query-examples.html>

## Multi-lingual

Analyzer => liste de stop words + query normalization

## NRT

Near Real Time Searching

## Document

## Field

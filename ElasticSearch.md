# Elastic Search

Moteur de recherche "Enterprise" basé sur Lucene.
Elasticsearch is a JSON based REST API, Distributed, web server build over Lucene

Capable de recherche full-text.
Interface HTTP & documents JSON.
Ecrit en Java, Open Source (Licence Apache), Client en C#.

ElasticSearch + Logstash + Kibana = Elastic Stack

Developer-friendly + speed + scalable

Completion suggester
Percolation = filtre les requêtes matchant un document (=> notification nouveau document match...)
Profile API (ms)

## Apache Lucene

Bibliothèque Java (càd DLL) de recherche d'information, données textuelles.

Ecrit en Java, Free & Open Source (Licence Apache), Client en C#.
Full-text indexing & Searching => moteurs de recherche.
Fuzzy search ~ Edit distance (Levenstein).
Système de recommandation.
Archi basée sur document (PDF, HTML, Word, Mind map, etc.) contenant des champs de texte.
Utilise

* Index inversé (<https://fr.wikipedia.org/wiki/Index_invers%C3%A9>)
* *NEW* BKD Tree pour recherche de nombres via Points (<https://en.wikipedia.org/wiki/K-D-B-tree#BKD_tree>)
* k-d(imension) tree = space partitioning, range search & nearest neighbour search
* B tree = Nodes avec plusieurs valeurs dans certaine range (=> less balancing but more storage), Read/Write optimized, DB indexes & searches

<https://en.wikipedia.org/wiki/Search_engine_indexing>

kaokejiis oae mma'o kke nceoka je minaoepoostomm siivnanfqop
il dnus bampt dronsg mawnrov soubramq ilozwqmpo
wefgoinro
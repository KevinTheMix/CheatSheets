# Elasticsearch

Elasticsearch is a JSON based REST API, Distributed, web server build over Lucene.
Elasticsearch is a JSON documents-based search HTTP REST API, Distributed, web server build over Lucene.
Moteur de recherche "Enterprise" multi-tenants basé sur Lucene.
Interface HTTP & documents JSON.
Capable de recherche full-text.
Document database that is optimized to act as a full-text search engine.
Ecrit en Java, Open Source (Licence Apache), Client en C#.
Différence avec Lucene = <https://stackoverflow.com/questions/27793721/what-is-the-difference-between-lucene-and-elasticsearch>

* Developer-friendly
* speed
* scalable

Completion suggester
Percolation = filtre les requêtes matchant un document (=> notification nouveau document match...)
Profile API (ms)

## Glossary

* **Beats** = lightweight data shippers
* **Elastic Stack** (formerly **ELK** for Elasticsearch/Logstash/Kibana) = suite of applications for searching, logging & visualizing data (ELK + Beats)
* **Logstash** = data collection and log-parsing engine
* **Kibana** = source-available data analytics/visualisation dashboard (lets users create bar/line/and scatter charts/pie charts/maps) against data stored in an Elasticsearch cluster

## API

### Indexes

Create

    PUT http://127.0.0.1:9200/customer?pretty

Get

    GET http://127.0.0.1:9200/_cat/indices?v

Delete

    DELETE http://127.0.0.1:9200/customer?pretty

### Documents

Create & Update

    PUT http://127.0.0.1:9200/customer/_doc/1?pretty { "name":"Koko Kontan" } # Créé l'Index si il n'existe pas encore.

Get

    GET http://127.0.0.1:9200/customer/_doc/1?pretty

Search

    GET http://127.0.0.1:9200/customer/_search?q=*
    GET http://127.0.0.1:9200/customer/_search { "query": {"match_all" : {} }

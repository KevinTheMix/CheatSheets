# Basic

Initiation au Basic (Jeunes mutualistes)

## L'informatique ou le traitement de l'information

Qu'est-ce que l'informatique ?
Le petit Larousse nous enseigne que l'informatique est la "technique du traitement automatique de l'information".

Une telle définition mérite quelques éclaircissements.
Il s'agit d'une technique qui s'appuie sur des lois et des règles.
Cette discipline a ses propres contraintes et fait appel à des procédés et des méthodes particulièrement adaptés ; il n'est pas indispensable, pour utiliser une technique, d'en connaître tous les rouages.

De même qu'il n'est pas nécessaire de connaître la technique automobile pour conduire, il n'est pas indispensable d'étudier la technique informatique pour utiliser un ordinateur.

Quotidiennement, nous recevons quantités d'informations.
Quelques-unes de celles-ci peuvent être traitées automatiquement, c'est-à-dire sans intervention directe de l'homme, et relèvent en ce sens de l'informatique.
Examinons quelques exemples d'informations pris dans la vie courante.

Lorsque nous achetons une livre de beurre, nous recevons une information qui est le prix affiché au kilo.
Pour connaître le montant à payer, il faut effectuer une opération.
Cette opération fait appel à la connaissance antérieure du raport entre livre et kilo, qui est nécessaire au traitement de l'information.

Nous plaçant une nouvelle fois dans cette situation d'achat, dans un magasin à grande surface, nous recevons des informations relatives à des prix, à des poids, à des volumes.
Le traitement rapide des informations reçues nous permet de comparer les prix rapportés, soit au kilo, soit à toute autre unité de compte (paquet, douzaine …).
Bien entendu, à ces grandeurs mesurables et calculables, nous pouvons ajouter des critères de sélection : couleur, efficacité du produit, goût, emballage …

Notre choix se porte sur le produit qui a reçu le meilleur classement en fonction de l'ensemble des critères de sélection.
Le traitement de l'information effectué consiste en un calcul, suivi de comparaisons pour terminer par un classement en fonction de nos critères ; notre décision d'achat peut d'ailleurs être tout à fait irrationnelle, et ne pas tenir compte du classement soigneusement établi.

Lorsque nous recherchons la définition d'un mot dans un dictionnaire, nous savons que les informations sont regroupées par ordre alphabétique, il nous est donc facile d'accéder tout d'abord à la lettre puis au mot lui-même.

Dans ce cas, le traitement de l'information consiste en une recherche à partir d'un classement alphabétique.

Ces trois exemples montrent que le traitement de l'information revêt les aspects suivants :

* Calcul
* Comparaison
* Tri
* Classement

La balanité de ces situations nous fait percevoir que nous baignons dans un flot d'informations, qui doivent être traitées pour devenir utilisables. Certaines d'entre-elles peuvent l'être de façon automatique grâce à des machines dont l'ordinateur est la dernière née.

Le second chapitre de ce livre nous présentera ce qu'est l'ordinateur même.
Pour l'instant, essayons de déterminer par un nouvel exemple ce qui, dans une démarche de traitement de l'information peut être automatisé ou non.

Envisageons le cas traditionnel d'un employé assis à sa table de travail et qui appartiendrait à une société de vente par correspondance.
Il reçoit des commandes et émet des bons de livraison accompagnés de factures.
Notre employé consciencieux est en plus méthodique : il place les commandes à gauche et les factures à droite.

Comment travaille-t-il ?

* Il prend une _commande_ et il la lit. Celle-ci comprend :
  * le nom du client
  * éventuellement un numéro de compte client
  * la liste et la quantité de produits commandés
  * le lieu de la livraison
* Pour effectuer son travail, notre employé va consulter un _fichier client_. Il en sort une fiche sur laquelle sont reportés :
  * les commandes antérieures
  * l'état du compte de ce client est-il à jour ? a-t-il des dettes ?
  * d'autres informations commerciales éventuellement telles que le taux de remise par rapport aux prix du catalogue.
* Si le client n'a pas de fiche, il devra en créer une.

L'employé va consulter ensuite le _fichier des stocks_, pour vérifier si la commande peut être honorée, si les stocks sont suffisants.
Il doit soustraite sur cette fiche les quantités à livrer, ou mettre en attente la commande, ou ne faire qu'une livraison.

Pour calculer la _facture_, il lui faut consulter la _table des prix_, y appliquer le taux de remise, effectuer un certain nombre d'opérations (multiplier le prix unitaire par la quantité livrable, additionner les résultats, y appliquer un taux de T.V.A.).

Notre employé doit alors _mettre à jour_ la fiche client, la reclasser dans son bac, mettre à jour l'état des stocks, reclasser les fiches de chaque produit, regrouper les commandes non exécutées et … _transmettre_ le bon d'expédition et la facture au service responsable.

Cet exemple nous montre comment un employé accomplit sa tâche quotidienne, à condition d'avoir au préalable, reçu ou élaboré des instructions de travail.

L'ensemble des instructions successives constitue une _chaîne d'instructions_ qui représente le _programme de travail_.
Ce _programme_ serait consigné sur une fiche de la façon ci-contre.

Programme de travail :

1. Prendre une commande dans le bac de gauche
2. Lire le nom du client et consulter sa fiche
3. Si la fiche n'existe pas, en créer une
4. Si la fiche indique un compte non à jour, ne pas livrer et le signaler au service des litiges
5. Si la fiche indique un compte à jour, consulter l'état des stocks du premier produit à livrer
6. Si le stock existe, commencer le bon de livraison et la facture. Déduire la quantité du stock existant
7. S'il y a rupture de stock, l'indiquer sur la commande, et prévoir une livraison ultérieure
8. Si le stock ne permet qu'une livraison partielle, l'indiquer sur le bon de livraison et sur la commande. Prévoir une livraison ultérieure
9. Pour le produit suivant, retourner au paragraphe 6
10. S'il n'y a pas d'autre produit à livrer, commencer le calcul de la facture
11. Calculer les prix, remises, taux de T.V.A.
12. Compléter la fiche client
13. Classer les commandes en différents lots : exécutées, partiellement exécutées, non exécutées
14. Transmettre factures et bons de livraisons aux services concernés

* Un tel traitement se décompose en deux types d'opérations de natures différentes :
  * les _opérations à caractère logique_ que sont les recherches, comparaisons, vérifications, classement …
  * les _opérations de calcul_ que sont les additions, multiplications …

Pour éviter ces opérations dont la répétition est fastidieuse, l'homme a conçu des machines capables de les effectuer.
Les premières d'entre-elles étaient tout juste capables de l'aider dans ses calculs.
L'ancêtre de ces machines est le boulier.

Puis les opérations logiques ont pu être appréhendées grâce à la technologie des ordinateurs.
Peu nous importe de retracer ici l'historique de ces machines.
Bornons-nous à comprendre le fonctionnement des systèmes actuels.

Notre intention est d'automatiser la facturation.
Nous désirons donc entrer des commandes et recueillir en sortie une facture.

Cela suppose que l'on soit capable :

* _d'entrer la commande_. Il faut passer d'un document écrit à un travail sur machine. Ce travail est effectué par un _organe d'entrée_
* _d'en effectuer le traitement_. Une succession d'instructions de travail reprenant chaque opération à effectuer doit indiquer à la machine la marche à suivre. Les opérations arithmétiques et logiques sont effectuées par l'_organe de calcul et de commande_. L'ensemble des instructions nécessaires au fonctionnement sera élaboré sous la forme d'un _programme de travail_.
* _de consulter le catalogue_ des prix, le _fichier_ des clients pendant le traitement. Ces données doivent avoir été stockées auparavant dans l'ordinateur : elles sont en mémoire.
* _de restituer le résultat_ du traitement sous une forme utilisable, c'est le travail de _l'organe de sortie_.

Le schéma global de ce traitement peut se représenter ainsi :

* Commande écrite -> Entrée -> Ordinateur -> Sortie -> Facture imprimée

Ce chapitre nous a permis de définir les mots qui reviendront souvent au cours de ce livre :

* Informatique
* Fichier
* Programme
* Traitement
* Instructions
* Chaîne d'instructions
* Organe d'entrée
* Mémoire
* Organe de calcul
* Organe de sortie

## Les ordinateurs individuels

En analysant le travail d'exécution d'un employé et la prise en charge des opérations par un système informatique, nous avons défini les fonctions et organes essentiels d'un ordinateur.
Nous allons, dans ce chapitre, faire connaissance avec ces différents organes.

L'Ordinateur individuel classique comporte 3 éléments :

* Tout d'abord un _écran_, type écran de télévision, qui peut sur certains modèles être en couleur.
* Un _clavier_ analogue à celui d'une machine à écrire. Il comporte :
  * les lettres de l'alphabet
  * les dix chiffres 0 à 9
  * les symboles (• : + . ? !)
  * des signes pouvant servir au dessin
  * des touches spécialisées telles que : RUN-STOP-RETURN

Intégré dans la console ou relié par un câble électrique, nous trouvons un _lecteur de cassette_ absolument identique à ceux utilisés pour la reproduction musicale, avec les touches de fonctionnement :

* PLAY = MARCHE
* RECORD = ENREGISTRE
* REWIND = ENROULE
* STOP = ARRET

Que se passe-t-il lorsque nous appuyons sur l'une des touches du clavier ?
Nous pouvons faire apparaître sur l'écran les caractères qui y sont représentés.
Nous pouvons écrire un texte, tout comme sur une machine à écrire : certaines touches permettent le retour en arrière, l'espacement, le retour à la ligne, l'effacement, etc.

Nous pouvons ainsi remplir notre écran comme une feuille de papier, avec une différence : en bas de page, nous continuons à écrire mais … la première ligne du texte, elle, a disparu ; notre écran ne nous permet donc pas de conserver le texte en entier, au contraire d'une feuille de papier.

Bien entendu, il est possible de mémoriser un texte, il suffit d'en donner l'instruction à l'ordinateur, faute de quoi il n'en fera rien.
Nous verrons cet aspect dans le chapitre réservé à la programmation.

Et le calcul, comment se fait-il ?
Si nous frappons _6*9_, cette expression s'inscrit sur l'écran, mais nous n'obtenons aucun résultat. De fait, il est possible d'obtenir un résultat à condition de frapper :

```basic
? 6*9
```

Puis d'appuyer sur la touche RETURN ou ENTER sur d'autres modèles.
L'écran nous renvoie la réponse : 54

Remarquons, au passage, que _la multiplication s'exprime par_ `*` et non par `x`, ceci afin de ne pas confondre avec `x` ou ou `+`.

Pour reprendre le schéma proposé au chapitre précédent : l'organe d'entrée est le clavier, l'organe de sortie est l'écran.

En fait, le traitement d'une commande ne pourra être réalisé que si l'ordinateur reçoit des instructions regroupées sous la forme d'un programme de travail.

Ce programme, ainsi que : le fichier client, la table des prix, le fichier des stocks, doivent être mémorisés sur la cassette, qui livrera son contenu à l'ordinateur pour le traitement nécessaire.

On peut ainsi disposer de _nombreux programmes enregistrés sur une ou plusieurs cassettes_, permettant à un ordinateur de résoudre différents problèmes.

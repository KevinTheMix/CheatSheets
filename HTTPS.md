# Introduction
Il s'agit d'une couche de TLS (anciennement SSL, encore appelé comme ça parfois) entre le HTTP et le TCP.

Un certificat est fourni du serveur au client, qui a été acheté auprès d'un Certificate Authority (e.g. Thawte, Verisign, Symantec, Microsoft, Google, etc.).
Ce certificat indique que le site correspond bien à la société et qu'elle est bien validée par l'authorité, qui aura effectué quelques checks pour arriver à cette conclusion.

Les authorités de certificats racines sont installées dans Windows par défaut (command "mmc" > Fichier > Ajouter/Supprimer un composant logiciel enfichable > Choisir Certificats puis Ajouter).
Les authorités de certificats en dessous des racines sont organisées hiérarchiquement (e.g. Google dépend de GeoTrust Global CA, etc.).

A partir du moment où le serveur envoie un certificat valide, qui est signé digitalement, le client sait à qui il a affaire et peut initialiser la connexion sécurisée, ce qui débute par un handshake.
Le serveur lui envoie ensuite sa clé publique, utilisée pour encrypter les données, qui ne peuvent être décrytées qu'au moyen de la clé privée, en possession seulement du serveur.
# HTTPS

Il s'agit d'une couche de TLS (anciennement SSL, encore appel� comme �a parfois) entre le HTTP et le TCP.

Un certificat est fourni du serveur au client, qui a �t� achet� aupr�s d'un Certificate Authority (e.g. Thawte, Verisign, Symantec, Microsoft, Google, etc.).
Ce certificat indique que le site correspond bien � la soci�t� et qu'elle est bien valid�e par l'authorit�, qui aura effectu� quelques checks pour arriver � cette conclusion.

Les authorit�s de certificats racines sont install�es dans Windows par d�faut (command "mmc" > Fichier > Ajouter/Supprimer un composant logiciel enfichable > Choisir Certificats puis Ajouter).
Les authorit�s de certificats en dessous des racines sont organis�es hi�rarchiquement (e.g. Google d�pend de GeoTrust Global CA, etc.).

A partir du moment o� le serveur envoie un certificat valide, qui est sign� digitalement, le client sait � qui il a affaire et peut initialiser la connexion s�curis�e, ce qui d�bute par un handshake.
Le serveur lui envoie ensuite sa cl� publique, utilis�e pour encrypter les donn�es, qui ne peuvent �tre d�cryt�es qu'au moyen de la cl� priv�e, en possession seulement du serveur.
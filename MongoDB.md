# Introduction

# Installation
Installer le serveur MongoDB
See  https://www.mongodb.com/download-center?jmp=nav#community

	mongodb-win32-x86_64-2008plus-2.6.12-signed.msi

# Commands
Toutes les commandes doivent �tre �videmment d�marr�s du dossier o� est install� MongoDB, par exemple :

	C:\Program Files\mongodb-2.4.6\bin\
	
Avant de pouvoir query la DB, il faut lancer le serveur :

	mongod.exe --dbpath <Path to \DATA\ folder>

Backup & Restore :

	mongodump --out <output_directory> [--db <db_to_backup>] [--collection <collection_to_backup>]
	mongorestore <input_directory>
	
Les commandes suivantes n�cessitent qu'un serveur soit lanc� :

	show dbs				# Retourne la liste des DBs sur le serveur
	show databases			# Retourne la liste de toutes les DBs disponibles
	use <db>				# Pointe sur une DB
	
Les commandes suivantes n�cessitent de pointer sur une DB :

	show collections		# Retourne les tables (aka collections dans la DB)
	coll = db.<collection>	# Assigne la table � une variable
	db.<collection>.find()	# Retourne toutes les lignes de la table
# RabbitMQ

## Introduction

RabbitMQ est un logiciel de distribution de message ("message broker") et constitue une implémentation open source en Erlang du protocole AQMP.
Protocole programmable => composants centraux peuvent être créés ("déclarés") au Publisher, au Consumer, ou via outil central d'administration.
Il faut aussi noter que les déclarations sont "idempotentes", càd qu'elles peuvent être déclarées plusieurs fois sans effets de bords (created once).
=> La combinaison d'un protocole programmable et d'idempotence fait qu'un composant peut être déclaré à plusieurs endroits. Bien évidemment ils doivent alors respecter la même déclaration.

## Installation & Environment

1. Installer Erlang
2. Installer le serveur RabbitMQ (Le Host du serveur est le nom ou l'IP de l'ordinateur & le port par défaut du serveur RabbitMQ est 5672)
* Eventuellement ajouter le répertoire des fichiers .bat de contrôle de RabbitMQ à la variable d'environnement PATH Windows
3. Activer le plugin d'administration HTTP Web
  
     rabbitmq-plugins enable rabbitmq_management
*Le port par défaut du site est 15672 => <http://{serveur}:15672/>
*Le login par défaut est guest/guest (valide uniquement en localhost)
*Créer un nouvel utilisateur (pour les accès non localhost)

Adding RabbitMQ server .bat administration files to Windows path

     PATH = %PATH%;"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\sbin"

### Commandes Line Interface (CLI)

#### rabbitmqctl

Server command-line configuration

    rabbitmqctl status
    rabbitmqctl list_queues [name/messages_ready/messages_acknowledged]
    rabbitmqctl list_exchanges
    rabbitmqctl list_bindings

#### rabbitmq-plugins

Manage plugins

    rabbitmq-plugins enable [plugin]
    rabbitmq-plugins disable [plugin]

### Plugins

See C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\plugins

#### rabbitmq_management

Plugin including a HTTP-based Web administration API (see <http://localhost:15672/>) & Command line rabbitmqadmin
Note: durable queues can only be deleted using those APIs
See <https://www.rabbitmq.com/management.html>

#### rabbitmq_shovel

Used to move messages from one queue to another
See <https://www.rabbitmq.com/shovel.html>

## AMQP

AMQP stands for Advanced Message Queuing Protocol.

Defines Client applications i.e. producers & consumers
Defines a broker server containing Exchanges, Bindings & Queues (aka entities)

It's a programmable network protocol, which means that message routing configuration (exchange types & queues) can be defined by the client applications themselves, not just by backoffice administration.
Therefore the applications themselves can declare all the AMQP entities and routing schemes they need.
Although, beware of configuration conflicts between different applications, e.g. declaring the same exchange/queue with different parameters.

### Server

Server where all the RabbitMQ components live.

### Exchange

Exchanges are AMQP entities akin to a postal service, through which messages transit and are distributed to their destined Queues.
The routing algorithm depends on the exchange type.
If no Queue matches the routing configuration for a message, it is lost.

#### Exchange Type

##### Direct

Distributes a Message to the Queue whose name matches the routing key of that Message.
Can be used for round robin task distribution between several workers (Consumers) reading the same queue.
There always exists a default, anonymous, Direct Exchange (see below).

##### Fanout

Broadcast a Message to all its bound queues (ignores routing keys).
Used for broadcasting.

##### Topic

Distributes a Message to all Queues whose binding pattern-matches the routing key of the Message.
Used for multicast.

Similar to a *direct* Exchange, but with the following wildcards :

Exactyle one word

    *

0 or more words

    #

Example

    *.fox.#

matches

    gray.fox.eating.in.the.winter

If the binding of the Queue consists solely of **#**, it will receive all the messages transiting through the Exchange, just like a *fanout* Exchange.
If the binding of the Queue contains no wildcard, it will behave like a *direct* Exchange.

#### Durability

Durable exchanges survive a broker restart.

##### Header

Analyze the properties (Headers) within a message to determine its destination, ignoring its routing key.

### Default Exchange

The default exchange is a direct exchange with no name ("") pre-declared by the broker for us.
It's special because all queues are bound to it using the queue name as binding key.
It's what make it seem like we can send a message directly from producers to a queue using the queue's name as binding key without having defined an explicit binding.

### Queue

Entity where messages arrive according to a particular routing configuration (Exchange Type & Routing Key Bindings) and are stored.
Durable queues survive a broker restart.

### Binding

Named link between an Exchange and a Queue.
Its name constitutes a Routing Key, part of the routing configuration to deliver Messages to the appropriate Queues.
A Binding is necessary for any Queue to receive any Messages, but the routing key it specifies may be disregarded by some Exchange types (i.e. fanout).
All Queues are bound to the default Exchange, with the Queue name acting as binding name.

### Message

Contains the data that is sent, as a byte array, so any text content must be encoded/decoded.

#### Persistent

Persistent messages survive a broker restart.

### Producer

Any application that creates and sends messages to a RabbitMQ Server.

### Consumer

Any application that receives and reads message from a RabbitMQ Server.

#### Acknowledgement

Mechanism through which Messages are marked as read. This can be defined by the Consumer as automatic on reception, or explicit.

##### Automatic

Messages are removed from their Queue as soon as they are consumed.

##### Explicit

An Ack must be manually sent to the broker in order for the message to be removed from its Queue.

##### Negative Acknowledgement

Allows to reject messages, and can also requeue them.

#### Prefetching

Qos = Quality of service, used for load balancing

## API

### IModel

Represents an AMQP channel

#### Method

(Re-)Declares a queue. If the queue exists, its configuration must match exactly the provided configuration.
If the Queue is declared as **exclusive** & **autodelete**, it will be destroyed when the client closes (**durable** doesn't matter then).

    QueueDeclare(queue,		# Nom de la Queue
		durable,			# Indique la Queue survit un red�marrage du Serveur
		exclusive,			# Indique que la Queue n'est pas exclusive � ce Client
		autodelete,			# Indique que la Queue doit �tre effac�e une fois le Client d�connect�
		arguments)			# Etc.

Register a consumer that own the callback handling message reception.

     BasicConsume

Acknowledge message reception/execution, by consumer.

    BasicAck

Quality of service. Useful to prevent additional upcoming messages on a consumer that is already busy.

    BasicQos
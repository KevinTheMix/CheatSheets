# RabbitMQ

## Introduction

RabbitMQ is a message broker/distribution middleware, that is used to soften ties between applications.
It provides applications with features such as broadcasting, programmable routing and message persistence.

It is written in the [Erlang](https://en.wikipedia.org/wiki/Erlang_(programming_language)) functional programming language as an open-source implementation of the [AQMP protocol](https://en.wikipedia.org/wiki/Advanced_Message_Queuing_Protocol).

The protocol is programmable, which means that all the entities (exchange, queues, bindings) can be created (or _declared_) programmatically at any node (Publisher or Consumer), or via a centralized administration website.
Besides, those declarations are _idempotent_: they can be declared multiple times without side-effects (_created once_).
Considering those features in combination means that it is valid for a single entity to be declared multiple times at different locations (nodes), as long as the same parameters are provided in its creation.

## Installation & Environment

1. Installer Erlang
2. Installer le serveur RabbitMQ (Le Host du serveur est le nom ou l'IP de l'ordinateur & le port par défaut du serveur RabbitMQ est 5672)
    * Eventuellement ajouter le répertoire des fichiers .bat de contrôle de RabbitMQ à la variable d'environnement PATH Windows
3. Activer le plugin d'administration HTTP Web via `rabbitmq-plugins enable rabbitmq_management`
    * Le port par défaut du site est 15672 => <http://{serveur}:15672/>
    * Le login par défaut est guest/guest (valide uniquement en localhost)
    * Créer un nouvel utilisateur (pour les accès non localhost)

Adding RabbitMQ server .bat administration files to Windows path via `PATH = %PATH%;"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\sbin"`

### Commandes Line Interface (CLI)

* **rabbitmqctl** = Server command-line configuration
  * `rabbitmqctl status`
  * `rabbitmqctl list_queues [name/messages_ready/messages_acknowledged]`
  * `rabbitmqctl list_exchanges`
  * `rabbitmqctl list_bindings`
* **rabbitmq-plugins** = Manage plugins
  * `rabbitmq-plugins enable [plugin]`
  * `rabbitmq-plugins disable [plugin]`

### Plugins

See _C:\Program Files\RabbitMQ Server\rabbitmq\_server-3.6.0\plugins_

* [rabbitmq_management](https://www.rabbitmq.com/management.html)
  * Plugin including a HTTP-based Web administration API (see <http://localhost:15672/>) & Command line rabbitmqadmin
  * Note: durable queues can only be deleted using those APIs
* [rabbitmq_shovel](https://www.rabbitmq.com/shovel.html)
  * Used to move messages from one queue to another

## AMQP

AMQP stands for Advanced Message Queuing Protocol.
Defines Client applications i.e. producers & consumers
Defines a broker server containing Exchanges, Bindings & Queues (aka entities)

It's a programmable network protocol, which means that message routing configuration (exchange types & queues) can be defined by the client applications themselves, not just by backoffice administration.
Therefore the applications themselves can declare all the AMQP entities and routing schemes they need.
Although, beware of configuration conflicts between different applications, e.g. declaring the same exchange/queue with different parameters.

* **Server**
  * Server where all the RabbitMQ components live.
* **Exchange**
  * Exchanges are AMQP entities akin to a postal service, through which messages transit and are distributed to their destined Queues.
  * If no Queue matches the routing configuration for a message, it is lost.
  * Durable Exchanges survive a broker restart.
  * The routing algorithm depends on the exchange type.
* **Exchange Type**
  * _direct_ = Distributes a Message to the Queue whose name matches the routing key of that Message. Can be used for round robin task distribution between several workers (Consumers) reading the same queue. There always exists a default, anonymous, Direct Exchange (see below).
  * _fanout_ = Broadcast a Message to all its bound queues (ignores routing keys).
  * _topic_ = Distributes a Message to all Queues whose binding pattern-matches the routing key of the Message. Used for multicast.
    * Similar to a *direct* Exchange but with wildcards: `*` for exactly one word, `#` for 0 or more words e.g. `*.fox.#` matches _gray.fox.eating.in.the.winter_
    * If the binding of the Queue consists solely of `#`, it will receive all the messages transiting through the Exchange, just like a *fanout* Exchange.
    * If the binding of the Queue contains no wildcard, it will behave like a *direct* Exchange.
  * _header_ = Analyze the properties (Headers) within a message to determine its destination, ignoring its routing key.
* **Default Exchange**
  * The default exchange is a direct exchange with no name ("") pre-declared by the broker for us.
  * It is special because all queues are bound to it using the queue name as binding key. That is what make it seem like we can send a message directly from producers to a queue using the queue's name as binding key without having defined an explicit binding.
* **Queue**
  * Entity where messages arrive according to a particular routing configuration (Exchange Type & Routing Key Bindings) and are stored.
  * Durable queues survive a broker restart.
* **Binding**
  * Named link between an Exchange and a Queue.
  * Its name constitutes a Routing Key, part of the routing configuration to deliver Messages to the appropriate Queues.
  * A Binding is necessary for any Queue to receive any Messages, but the routing key it specifies may be disregarded by some Exchange types (i.e. fanout).
  * All Queues are bound to the default Exchange, with the Queue name acting as binding name.
* **Message**
  * Contains the data that is sent, as a byte array, so any text content must be encoded/decoded.
  * Persistent messages survive a broker restart.
* **Producer**
  * Any application that creates and sends messages to a RabbitMQ Server.
* **Consumer**
  * Any application that receives and reads message from a RabbitMQ Server.
* **Acknowledgement**
  * Mechanism through which Messages are marked as read. This can be defined by the Consumer as automatic on reception, or explicit.
  * Automatic Acknowledgement = Messages are removed from their Queue as soon as they are consumed.
  * Explicit Acknowledgement = An Ack must be manually sent to the broker in order for the message to be removed from its Queue.
  * Negative Acknowledgement = Allows to reject messages, and can also requeue them.
* **Prefetching**
  * Qos = Quality of service, used for load balancing

## API

* `IModel`= Represents an AMQP channel
* `QueueDeclare()` = (Re-)Declares a queue. If the queue exists, its configuration must match exactly the provided configuration.
  * If the Queue is declared as **exclusive** & **autodelete**, it will be destroyed when the client closes (**durable** doesn't matter then).
    ```
    QueueDeclare(queue,     # Name of the Queue
            durable,	# Indicates whether the Queue survive a server restart
            exclusive,	# Indicates whether the Queue is exclusive to this client application declaring it
            autodelete,	# Indicates whether the queue must be deleted once the client disconnects
            arguments)	# Etc.
    ```
* `BasicConsume()` = Register a consumer that own the callback handling message reception.
* `BasicAck()` = Acknowledge message reception/execution, by consumer.
* `BasicQos()` = Quality of service. Useful to prevent additional upcoming messages on a consumer that is already busy.

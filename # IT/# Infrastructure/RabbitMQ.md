# RabbitMQ

RabbitMQ is a open-source message broker/distribution middleware implementing AMQP and written in Erlang.
It soften ties between applications & provides applications with features such as broadcasting/programmable routing/message persistence.

* _Programmable network_ protocol, which means message routing configuration (exchanges, queues, bindings) can be created (or _declared_) by client nodes  (publisher or consumer) themselves, not just via centralized administration
* Besides, those declarations are _idempotent_: they can be declared multiple times without side-effects (_created once_)
* Therefore applications themselves can declare all AMQP entities & routing schemes they need
* Therefore a single entity can validly be declared multiple times at different locations (nodes), as long as same parameters are provided in its creation
* Beware though of configuration conflicts between different applications, eg declaring the same exchange/queue with different parameters

## Glossary

* **Acknowledgement**
  * Mechanism through which Messages are marked as read. This can be defined by the Consumer as automatic on reception, or explicit
  * Automatic Acknowledgement = Messages are removed from their Queue as soon as they are consumed
  * Explicit Acknowledgement = An Ack must be manually sent to the broker in order for the message to be removed from its Queue
  * Negative Acknowledgement = Allows to reject messages, and can also requeue them
* **Advanced Message Queuing Protocol** (AMQP) = open standard application layer protocol for message-oriented middleware (message orientation, queuing, routing, reliability & security)
* **Binding** = named link between an Exchange and a Queue
  * Its name constitutes a Routing Key, part of the routing configuration to deliver Messages to the appropriate Queues
  * A Binding is necessary for any Queue to receive any Messages, but the routing key it specifies may be disregarded by some Exchange types (i.e. fanout)
  * All Queues are bound to the default Exchange, with the Queue name acting as binding name
* **Broker** = central entity receiving & delivering messages (contains exchanges & queues)
* **Consumer** = any application that receives and reads message from a RabbitMQ Server
* **Exchange** = AMQP entities akin to a postal service, through which messages transit and are distributed to their destined Queues
  * If no Queue matches the routing configuration for a message, it is lost
  * Durable Exchanges survive a broker restart
  * The routing algorithm depends on the exchange type
  * **Exchange Type**
    * _direct_ = Distributes a Message to the Queue whose name matches the routing key of that Message, can be used for round robin task distribution between several workers (Consumers) reading the same queue
      * There always exists a default, anonymous, Direct Exchange (see below)
    * _fanout_ = Broadcast a Message to all its bound queues (ignores routing keys)
    * _topic_ = Distributes a Message to all Queues whose binding pattern-matches the routing key of the Message Used for multicast.
      * Similar to a _direct_ Exchange but with wildcards: `*` for exactly one word, `#` for 0 or more words eg `*.fox.#` matches _gray.fox.eating.in.the.winter_
      * If the binding of the Queue consists solely of `#`, it will receive all the messages transiting through the Exchange, just like a _fanout_ Exchange
      * If the binding of the Queue contains no wildcard, it will behave like a _direct_ Exchange
    * _header_ = Analyze the properties (Headers) within a message to determine its destination, ignoring its routing key
  * **Default Exchange** = direct exchange with no name ("") pre-declared by the broker for us
    * It is special because all queues are bound to it using the queue name as binding key
    * That is what make it seem like we can send a message directly from producers to a queue using the queue's name as binding key without having defined an explicit binding
* **Dead-Letter Exchange** (DLX) = queue where messages end up due to low-level infrastructure issues (eg message not acknowledged, message expired (TTL), queue is full due to length limit, no route exists)
* **Message** = contains the data that is sent (as a byte array, so any text content must be encoded/decoded), **persistent messages** survive a broker restart
* [Message Passing](https://en.wikipedia.org/wiki/Message_passing#Synchronous_versus_asynchronous_message_passing) middleware
* **Prefetching**
  * Qos = Quality of service, used for load balancing
* **Producer** = any application that creates and sends messages to a RabbitMQ Server.
* **Queue** = entity where messages arrive according to a particular routing configuration (Exchange Type & Routing Key Bindings) and are stored, **durable queues** survive a broker restart
* **Virtual Host** = workspace with specific entities, users, permissions, policies

## Installation

1. Installer Erlang
2. Installer le serveur RabbitMQ (Le Host du serveur est le nom ou l'IP de l'ordinateur & le port par défaut du serveur RabbitMQ est 5672)
    * Eventuellement ajouter le répertoire des fichiers .bat de contrôle de RabbitMQ à la variable d'environnement PATH Windows
3. Activer le plugin d'administration HTTP Web via `rabbitmq-plugins enable rabbitmq_management`
    * Le port par défaut du site est 15672 => <http://{serveur}:15672/>
    * Le login par défaut est guest/guest (valide uniquement en localhost)
    * Créer un nouvel utilisateur (pour les accès non localhost)

Adding RabbitMQ server .bat administration files to Windows path via `PATH = %PATH%;"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\sbin"`

## CLI

* **rabbitmqctl** = Server command-line configuration
  * `rabbitmqctl status`
  * `rabbitmqctl list_queues [name/messages_ready/messages_acknowledged]`
  * `rabbitmqctl list_exchanges`
  * `rabbitmqctl list_bindings`
* **rabbitmq-plugins** = Manage plugins
  * `rabbitmq-plugins enable [plugin]`
  * `rabbitmq-plugins disable [plugin]`

## API

* `IModel`= Represents an AMQP channel
* `QueueDeclare({name}}, {…args})` = (re)declares a queue. If the queue exists, its configuration must match exactly the provided configuration
  * `durable` = whether the queue survive a server restart
  * `exclusive` = whether the queue is exclusive to this client application declaring it
  * `autodelete` = whether the queue must be deleted once the client disconnects
  * `arguments` = other arguments
  * If the queue is declared as `exclusive` & `autodelete`, it will be destroyed when the client closes (`durable` doesn't matter then)
* `BasicConsume()` = Register a consumer that own the callback handling message reception.
* `BasicAck()` = Acknowledge message reception/execution, by consumer.
* `BasicQos()` = Quality of service. Useful to prevent additional upcoming messages on a consumer that is already busy.

## Plugins

In _C:\Program Files\RabbitMQ Server\rabbitmq\_server-3.6.0\plugins_

* [Management](https://www.rabbitmq.com/management.html) = HTTP-based Web administration API (port _15672_), ships with _rabbitmqadmin_ CLI tool
  * Note: durable queues can only be deleted using those APIs
* [Shovel](https://www.rabbitmq.com/shovel.html) = moves messages from one queue or exchange to another
  * Can be performed manually, or automatically (aka _dynamic shovels_)
  * [Works across virtual hosts](https://stackoverflow.com/a/43232061)
* [Federation](https://www.rabbitmq.com/federation.html)
* [Stomp](https://www.rabbitmq.com/docs/stomp) = interoperability with other protocols
* [STOMP-over-WebSockets](https://www.rabbitmq.com/docs/web-stomp) = WebSockets for RabbitMQ
  * Eg [STOMP client for Web browsers and node.js apps](https://github.com/jmesnil/stomp-websocket)

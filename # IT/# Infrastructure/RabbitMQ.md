# RabbitMQ

RabbitMQ is a open-source message broker/distribution middleware implementing AMQP and written in Erlang.
It soften ties between applications & provides applications with features such as broadcasting/programmable routing/message persistence.

## Quick Tips

* _Programmable network_ protocol, which means message routing configuration (exchanges, queues, bindings) can be created (or _declared_) by client nodes (publisher or consumer) themselves, not just via centralized administration
* Besides, those declarations are _idempotent_: a single entity can be validly declared multiple times at different locations without side-effects (_created once_), as long as its parameters match
* Therefore applications themselves can declare all AMQP entities & routing schemes they need

## Glossary

* **Acknowledgement**
  * Mechanism through which Messages are marked as read. This can be defined by the Consumer as automatic on reception, or explicit
  * Automatic Acknowledgement = Messages are removed from their Queue as soon as they are consumed
  * Explicit Acknowledgement = An Ack must be manually sent to the broker in order for the message to be removed from its Queue
  * Negative Acknowledgement = Allows to reject messages, and can also requeue them
* **Advanced Message Queuing Protocol** (AMQP) = open standard application layer protocol for message-oriented middleware (message orientation, queuing, routing, reliability & security)
* **Binding** = named link between an Exchange and a Queue (multiple queues can have same binding name)
  * A Binding is necessary for any Queue to receive any Messages, but the routing key it specifies may be disregarded by some Exchange types (ie fanout)
  * Its name constitutes a Routing Key, part of routing configuration to deliver Messages to appropriate Queues
  * All Queues are bound to default Exchange, with Queue name acting as binding name
* **Broker** = central entity receiving & delivering messages (contains exchanges & queues)
* **Channel** = lightweight virtual connection inside a single TCP connection (à la HTTP/2), typically used by a single thread (as they are not thread-safe)
* **Consumer** = any application that receives and reads message from a RabbitMQ Server
* **Dead-Letter Exchange** (DLX) = RabbitMQ's entrypoint into DLQs (since everything goes through an exchange first)
* **Dead-Letter Queue** (DLQ) = holding area for messages (instead of losing/retrying them forever) not processed successfully due to low-level infrastructure issues (eg unacknowledged, expired TTL, full queue, no route exists)
* [Delivery Metadata](https://www.rabbitmq.com/docs/consumers#message-properties)
  * _Redelivered_ = indicates a message was previously delivered & requeued (in which case it may be a duplicate to handle properly)
* **Exchange** = AMQP entities akin to a postal service, through which messages transit and are distributed to their destined Queues
  * If no Queue matches the routing configuration for a message, it is lost
  * Durable Exchanges survive a broker restart
  * The routing algorithm depends on the exchange type
  * **Exchange Type**
    * _direct_ = distributes a Message to any Queue whose exchange binding name exactly matches that message's routing key, there always exists a default anonymous Direct Exchange (see below)
      * Can be used for round robin task distribution between several workers consuming same queue, each handling a share of messages (eg with three Consumers _A/B/C, A/B/C_)
    * _fanout_ = broadcast a Message to all its bound queues (ignores routing keys)
    * _topic_ = distributes a Message to all Queues whose binding pattern-matches routing key of Message Used for multicast
      * Similar to a _direct_ Exchange but with wildcards: `*` for exactly one word, `#` for 0 or more words (eg `*.fox.#` matches _gray.fox.eating.in.the.winter_)
      * If binding of Queue consists solely of `#`, it will receive all messages transiting through Exchange (à la _fanout_ Exchange)
      * If binding of Queue contains no wildcard, it will behave like a _direct_ Exchange
    * _header_ = analyze properties (Headers) within a message to determine its destination, ignoring its routing key
  * **Default Exchange** = direct exchange with no name ("") pre-declared by broker for us
    * It is special because all queues are bound to it using queue name as binding key
    * That is what make it seem like we can send a message directly from producers to a queue using the queue's name as binding key without having defined an explicit binding
* **Message** = contains the data that is sent (as a byte array, so any text content must be encoded/decoded), **persistent messages** survive a broker restart
* [Message Passing](https://en.wikipedia.org/wiki/Message_passing#Synchronous_versus_asynchronous_message_passing) middleware
* **Prefetching** = how many unacked messages a consumer can hold at once, used for load balancing
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

* `channel` = represents an AMQP **channel** (ie _IModel_ instance)
  * `.BasicAck(deliveryTag: <deliveryTag>, multiple: <true|false>)` = acknowledge message reception/execution, by consumer.
  * `.BasicConsume(queue: <queue>, autoAck: <true|false>, consumer: <consumer>)` = registers a message reception callback (ie a _EventingBasicConsumer_ instance)
  * `.BasicGet(queue: <queue>, autoAck: <true|false>)` = pulls a single message manually
  * `.BasicPublish(exchange: <exchange>, routingKey: <key>, basicProperties: null, body: <message>)`
  * `.BasicQos(prefetchSize: <n>, prefetchCount: <n>, global: <true|false>)` = controls prefetch (ie how many unacked messages a consumer can hold at once), useful to prevent additional messages on an already busy consumer
  * `.ExchangeDeclare(exchange: <exchange>, type: <type>)`
  * `.QueueBind(queue: <queue>, exchange: <exchange>, routingKey: <key>)` = binds queue to exchange (eg subscribe)
  * `.QueueDeclare(queue: <queue>, durable: <true|false>, exclusive: <true|false>, autoDelete: <true|false>, arguments: <args>)` = (re)declares a queue (if exists, configuration must match exactly provided configuration)
    * `durable` = queue survive a broker server restart
    * `exclusive` = queue exclusive to this client application declaring it
    * `autodelete` = queue deleted when last client disconnects
    * `arguments` = other arguments (eg TTL, dead-letter exchange)
    * If the queue is declared as `exclusive` & `autodelete`, it will be destroyed when the client closes (`durable` doesn't matter then)

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

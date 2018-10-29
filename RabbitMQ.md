# Installation & Environment
Adding RabbitMQ server .bat administration files to Windows path
PATH = %PATH%;"C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\sbin"

## CLI
### rabbitmqctl
Server command-line configuration
	
	rabbitmqctl list_queues [name/messages_ready/messages_acknowledged]
	rabbitmqctl list_exchanges
	rabbitmqctl list_bindings

### rabbitmq-plugins
Manage plugins

	rabbitmq-plugins enable [plugin]
	rabbitmq-plugins disable [plugin]

## Plugins
See C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\plugins

### rabbitmq_management
Plugin including a HTTP-based Web administration API (see http://localhost:15672/) & Command line rabbitmqadmin
Note: durable queues can only be deleted under those APIs

# AMQP
Advanced Message Queuing Protocol

Defines Client applications i.e. producers & consumers
Defines a broker server containing Exchanges, Bindings & Queues (aka entities)

It's a programmable network protocol, in that a specific entities & routing configuration is defined from within the client applications themselves, not a broker admin.
Therefore the applications themselves declare all the AMQP entities and routing schemes they need.
Although, beware of configuration conflicts between different applications, e.g. declaring the same exchange/queue with different parameters.

## Exchanges
Exchanges are AMQP entities where messages are sent, and route them to 0-> many queues.
The routing algorithm depends on the exchange type.
Durable exchanges survive a broker restart.

### Exchange Types
	Direct	# Sends messages to any bound queues with the same routing key (=> recipients filter). Used for round robin task distribution (between consumers, not queues balancing)
	Fanout	# Broadcast messages to all bound queues and ignores routing keys. Used for broadcast
	Topic	# Pattern-matching based routing to 1-many queues. Used for multicast.
			# * is exactly one word
			# # is 0 or more words
			# If a Queue is bound with only '#' pattern, receive all messages like in Fanout exchange.
			# If a Queue is bound with no wildcard, behave like Direct exchange.
	Headers	# Ignore the routing key.
	
### Default Exchange
The default exchange is a direct exchange with no name ("") pre-declared by the broker for us.
It's special because all queues are bound to it using the queue name as binding key.
It's what make it seem like we can send a message directly from producers to a queue using the queue's name as binding key without having defined an explicit binding.

## Queues
Durable queues survive a broker restart

## Bindings
Rules used by Exchanges to route messages to Queues. That binding is necessary for message exchange, and an optional routing key used by some exchange types.
A binding routing key (if not ignored by the Exchange, based on its type) acts as a filter.

## Messages
Persistent messages survive a broker restart

## Producers

## Consumers
### Acknowledgement
Acknowledgement can be automatic or explicit
Automatic acknowledgement = Messages are removed from their Queue as soon as it was sent to a consumer.
Explicit acknowledgement = A manual Ack is sent to the broker, only following which the message is taken off its queue.

### Rejection
### Negative Acknowledgement
### Prefetching
Qos = Quality of service, used for load balancing

# API
## IModel
Represents an AMQP channel

QueueDeclare
BasicConsume	# Register a consumer that own the callback handling message reception
BasicAck		# Acknowledge message reception/execution by consumer
BasicQos		# Quality of service. Useful to prevent additional upcoming messages on a consumer that is already busy


# Kerberos

Ticket-based client-server mutual authentication protocol designed for open networks (i.e. protects against eavesdropping - as well as replay attacks).
Although designed a while ago at MIT, it still holds up to this day.

The Kerberos protocol is very good for entreprise level network (LAN), where one entity (the AS) is able to hold all the client keys in a single location.
This would obviously not be possible over the entire internet, where public-key & certificates based solutions are more suitable.

## Explanation

The entities play a game of ping pong with messages, all which are encrypted (except for the initial client request).

All keys are symmetrical. Some asymmetrical (aka public key) cryptography is optionally supported. It requires a trusted third party (the KDC).
The use of a single trusted third party alleviates the past need to manage (n).(n-1)/2 connections (keys) between all the network nodes.

Messages are encrypted either with the direct receiver's key, or the following receiver's key (or a session key accessible only via those),
so only the relevant entity is able to read its intended message,
while all encrypted messages can be carried around to another entity (mostly by the Client, who does most of the back & forth bouncing).
This is (a little bit) akin to how Tor works, with hiding sensitive information (session keys) within layers of protection (secret key), and passing the messages around.

The ticket issued by the AS (the TGT) is sent to the TGS to obtain session tickets between the Client and a Server.
Note that the same TGT can be used multiple times to communicate with the TGS and obtain more Client-Server session tickets.
Note that due to the nature of the implementation, a repudiation latency exists where an access could be made even if the user was deleted from the organization altogether, as long as a valid ticket still exists.

The ticket issued by the TGS incarnates a middle/long-term mutual right of communication (or session) between the Client and the Server.
It can be reused for each subsequent Client-Server exchanges, so the whole initial setup doesn't have to be rerun each time.
It also has an expiry date, so it's not valid forever.

Messages carry a timestamp, and random number to prevent replay attacks (the same message can only be received once - this is checked by all entities).

The Service sends the final exchange message back to the Client, with the timestamp increased by one, thus proving it can actually read the message, or something.

Windows AD is based on Kerberos.

## Nomenclature

* Principal = something with an identity that can be protected (User, service or application)
* Entities
  * Client
  * **KDC** (Key Distribution Center) = AS + TGS
    * **AS** (Authentication Server) = check authentication
    * **TGS** (Ticket-Granting Service) = issues (authorization) ticket
  * **SS** (Service Server) = file server, or service, etc.
* **TGT** (Ticket-Granting Ticket) = the ticket provided by the AS to query the TGS and obtain more tickets (session tickets) to different services.
* **SPN** (Service Principal Name)

## Resources

* [Kerberos Authentication Explained](https://www.youtube.com/watch?v=5N242XcKAsM)
  * Very good technical explanation starting at 5 minutes mark
  * Doesn't detail very well the chronology & multiplicity of messages, neither the secret key generation
	* The Client enters her password at the start of the exchange, but it is only actually used a little later when decrypting the AS response message.
	* The Client secret key is (1-way) hashed from the user's password at both the Client and the AS, and then used as a symmetric key.
	  * The AS has access to the password via the AD (AD can be configured in plain text or hashed I believe).
* [Wikipedia](https://en.wikipedia.org/wiki/Kerberos_(protocol)#Protocol)

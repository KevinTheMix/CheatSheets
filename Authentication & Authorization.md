# Authentication & Authorization

## Kerberos

Authentication protocol using _tickets_ to allow network codes to communicate securely.
It is aimed at client-server architectures, where both entities verify each other's identity.
It builds on symmetric key cryptography and requires a trusted third party.
Protects against eavesdropping and replay attacks.
Uses port 88 by default.

* **Authentication Server**
* **Key Distribution Center**
* **Ticket-Granting Ticket**
* **Ticket-Granting Service**
* **Service Principal Name**
* **Service Server**

## OAuth

Standard for access delegation using tokens.

See <https://connect2id.com/learn/oauth-2>
See <https://en.wikipedia.org/wiki/OAuth>

**OAuth** is an _Authorization_ protocol, unlike **OpenID** which is an _Authentication_ protocol. ([Difference](https://nat.sakimura.org/2011/05/15/dummys-guide-for-the-difference-between-oauth-authentication-and-openid/)).

### Versions

* OAuth 1 uses request cryptographic signature.
* OAuth 2 doesn't use signature
  * => easier for developers.
  * => Requires HTTPS (TLS/SSL) must be used for all exchanges so the token doesn't get compromised.

### Roles

* **Resource Server**
  * An entity that holds protected data/resources and will provide access to it to anyone showing the right token for it.
* **Client/Consumer**
  * An app/site used by the Owner that must obtain a token in order to connect to and consume data from the Resource Server.
* **Resource Owner**
  * The end-user him/herself, who possesses some remote resource but must first prove himself to access it.
* **Authorization Server**
  * A dedicated server for issueing access tokens via serveral means (using user Domain authentication, asking to login, etc.)
  * Grant Types = Authorization code, Implicit, Password, Client credentials, Refresh token, SAML/JWT bearers, Device code
    * Authorization Code = Authorization-establishing code sent by the requesting app to the Provider to receive the Token. Gets revoked by the Provider as soon as it generates a Token. See <https://tools.ietf.org/html/rfc6749#section-4.1>

### Tokens

* Access Token
  * The analogy is a valet key, i.e. a key that opens some but not all parts of a car or house (like a master key would).
  * Used to access some resources on an API on a user's behalf.
  * It does not describe the user, only provides limited access rights to something a user has access.
  * Using this mechanism, the calling application never needs to know or hold the actual user credentials.
  * Has an expiration date.
  * They must be kept private in transit and storage, because it provides as much access to anyone who has it (i.e. another user).
  * See <https://www.oauth.com/oauth2-servers/access-tokens/>
* [Bearer Token](https://tools.ietf.org/html/rfc6750)
  * A Bearer Token is (an Access Token? a Refresh Token?)
* [Refresh Token](https://tools.ietf.org/html/rfc6749#section-6)
  * Optional long-lasting Token used to refresh an expired Access Token without having to start the protocol initiation over.

## SAML

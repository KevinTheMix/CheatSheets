# OAuth

Standard for access delegation using tokens.
It deals with authorizaiton, not authentication.

See <https://connect2id.com/learn/oauth-2>

## Components

### Consumer

The Consumer (or requesting app) is the app/site that needs information from another site or API.

### Provider

The Provider is an entity that holds some data and that can provide it to anyone showing the right token for it.

### Authorization Code

Authorization-establishing code sent by the requesting app to the Provider to receive the Token.
Gets revoked by the Provider as soon as it generates a Token.
See <https://tools.ietf.org/html/rfc6749#section-4.1>

### Access Token

The analogy is a valet key, i.e. a key that opens some but not all parts of a car or house (like a master key would).
Used to access some resources on an API on a user's behalf.
It does not describe the user, only provides limited access rights to something a user has access.
Using this mechanism, the calling application never needs to know or hold the actual user credentials.
Has an expiration date.

They must be kept private in transit and storage, because it provides as much access to anyone who has it (i.e. another user).

See <https://en.wikipedia.org/wiki/OAuth>
See <https://www.oauth.com/oauth2-servers/access-tokens/>

### Bearer Token

A Bearer Token is (an Access Token? a Refresh Token?)

See <https://tools.ietf.org/html/rfc6750>

### Refresh Token

Optional long-lasting Token used to refresh an expired Access Token without having to start the protocol initiation over.
See <https://tools.ietf.org/html/rfc6749#section-6>

## OAuth & OpenID

OpenID is Authentication.
OAuth is Authorization.
See <https://nat.sakimura.org/2011/05/15/dummys-guide-for-the-difference-between-oauth-authentication-and-openid/>

## Versions

* OAuth 1 uses request cryptographic signature.
* OAuth 2
  * Doesn't use signature
    * => easier for developers.
    * => Requires HTTPS (TLS/SSL) must be used for all exchanges so the token doesn't get compromised.
# SAML (Security Assertion Markup Language)

Well-established secure authentication & authorization protocol used by enterprises/governments for sharing identity (via XML over HTTP/SOAP transport)
Minimizes number of login forms a user has to go through, by enabling SSO across different domains (& internet).
Multiple IdP can be configured within an organization, each with a different purpose and thus dedicated configuration.
For SAML and identity federation to work, a pre-established trust relationship (and message format) must exist between Service & Identity Providers (eg via exchanged certificates or keys).
Eg logging into a cloud service (à la Elia e-learning) with corporate credentials (3rd party site validates the signature in accordance to pre-agreed config).

## Glossary

* **Assertion** = XML data structure message/token signed using (X.509) certificates
* Bindings
  * **HTTP Redirect Binding** = used for SP to IdP "request for authentication" message
  * **HTTP Post Binding** = most common, can be used for all messages & assertions
  * **HTTP Artifact Binding** = a little special
    * The IdP prepaes a second very small message called SAML artifact, and forwards that (via the User Agent) instead of the SAML assertion
    * The SP connects directly (!) to the IdP to resolve the artifact, and finally obtain the SAML assertion
    * This scenario is useful to limit the length of data sent through the User Agent and circumvent some such limitations (see <https://stackoverflow.com/a/13618537>)
* **Federated Identity** = deals with identity sharing and trust between different domains/organizations enables using one identity from an Identity Provider to access external services
* **Identity Provider** (aka IdP) = authority that is capable of authenticating a User (connected to AD)
* **Service Provider** = target resource (application/service), that also maintains a limited list of approved users
* **Single Sign-On** = deals with uesr convenience & continuity (ie logging in once then accessing multiple services without re-authenticating)
  * Can happen within a single domain (eg your company’s internal apps) or across federated domains if federation is in place
* **User (Agent)** = a Principal who has an account at the IdP and wants to authenticate

## Flow

There are two main ways to initiate the flow.

### IDP-INIT

The User himself accesses IdP, and his User Agent acts as main transport mechanism.

1. User requests IdP directly himself
2. User is prompted for authentication
3. If authorized, IdP generates and returns a SAML assertion
4. User Agent forwards that SAML assertion to SP
5. SP verifies assertion, maps it to a local user and session starts

### SP-INIT

1. The unauthenticated User attempts to access target SP
2. SP sends back encrypted & signed SAML request, with a redirection to IdP with a "Request for authentication" message
3. User logs in at IdP, and if successful, generates & returns a SAML assertion token
4. User presents that SAML assertion to SP (via User Agent)
5. SP verifies SAML assertion token (maps it to a local user), grants access and session starts

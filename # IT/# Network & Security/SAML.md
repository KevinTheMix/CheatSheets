# SAML (Security Assertion Markup Language)

XML over HTTP/SOAP authentication framework used for enterprise **SSO into web** (ie browser-based) applications.

## Quick Tips

* A typical scenario is logging into cloud e-learning platform using corporate credentials (**confirmed**)
* Minimizes number of login forms a user has to go through, by enabling SSO across different domains (& internet)

## Glossary

* **Assertion** = XML data structure message/token signed using (X.509) certificates
* **Federated Identity** = deals with identity sharing & trust between different domains/organizations enables using one identity from an Identity Provider to access external services
  * Requires a pre-established trust relationship (and message format) between Service & Identity Providers (eg via exchanged certificates or keys)
* Flows
  * **IDP-INIT** = user accesses IdP herself, and her User Agent acts as main transport mechanism
    1. User requests IdP directly himself
    2. User is prompted for authentication
    3. If authorized, IdP generates and returns a SAML assertion
    4. User Agent forwards that SAML assertion to SP
    5. SP verifies assertion, maps it to a local user and session starts
  * **SP-INIT**
    1. The unauthenticated User attempts to access target SP
    2. SP sends back encrypted & signed SAML request, with a redirection to IdP with a "Request for authentication" message
    3. User logs in at IdP, and if successful, generates & returns a SAML assertion token
    4. User presents that SAML assertion to SP (via User Agent)
    5. SP verifies SAML assertion token (maps it to a local user), grants access and session starts
* **Single Sign-On** = deals with user convenience & continuity (ie logging in once then accessing multiple services without re-authenticating)
  * Can happen within a single domain (eg your company’s internal apps) or across federated domains if federation is in place

### Roles

* **Identity Provider** (IdP) = authority that is capable of authenticating a User (connected to AD)
  * Multiple IdP can be configured within an organization, each with a different purpose and thus dedicated configuration.
* **Service Provider** = target resource (application/service), that also maintains a limited list of approved users
* **User (Agent)** = a Principal who has an account at the IdP and wants to authenticate

## TODO

* Bindings
  * **HTTP Redirect Binding** = used for SP to IdP _request for authentication_ message
  * **HTTP Post Binding** = most common, can be used for all messages & assertions
  * **HTTP Artifact Binding** = a little special

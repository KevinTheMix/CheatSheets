# SAML (Security Assertion Markup Language)

Authentication/authorization exchange standard between id & service provider (enables SSO across different domains).

Standard for communicating identity across organizations via XML, and enabling Single sign-on.
The XML SAML assertion is signed using (X.509) certificates.

SAML's purpose is different from OAuth, because it is designed to **authenticate** a user, whereas OAuth is concerned with **authorization** delegation.
See <https://auth0.com/intro-to-iam/saml-vs-oauth/>

## Quick Tips

* [Intro to SAML](https://www.youtube.com/watch?v=0fmNoqz6Urw&gl=BE)
* [SAML 2.0: Technical Overview](https://www.youtube.com/watch?v=SvppXbpv-5k)

## Glossary

* **User (Agent)** = the Principal, who wants to authenticate, and has an account at the IdP.
* **Service Provider** = target application/service, that also maintains a limited list of approved users.
* **Identity Provider** (aka IdP) = authority that is capable of authenticating the User (connected to AD).

## [Federated identity](https://en.wikipedia.org/wiki/Federated_identity) & [Single sign-on](https://en.wikipedia.org/wiki/Single_sign-on)

In order to implement identity federation, first the SP & IdP must oviously trust each other.
Then it is critical that their configuration match, i.e. they must agree on the message information fields and format, and the bindings.

The specifics of this is left open by the standard and therefore depends on a particular implementation.
Note that multiple IdP can be configured within an organization, each with a different purpose and thus dedicated configuration.

## Flow

There are two main ways to initiate the flow.

### IDP-INIT

The User accesses the IdP herself, and her User Agent acts as main transport mechanism.

1. The User requests the IdP directly herself
2. The User is prompted for authentication
3. If authorized, the IdP generates and returns a SAML assertion
4. The User Agent forwards that SAML assertion to the SP
5. The SP verifies the assertion, maps it to a local user and the session starts

### SP-INIT

1. The unauthenticated User attempts to access the target SP
2. The SP redirects the User to the IdP with a "Request for authentication" message
3. The IdP validates the user, generates and returns the SAML assertion
4. The SAML assertion is forwarded to the SP via the User Agent
5. The SP verifies the assertion, maps it to a local user and the session starts

## Bindings

For transporting the (request) messages and assertions, SAML Bindings are used.
These can be:

* HTTP Redirect Binding = used for SP to IdP "request for authentication" message
* HTTP Post Binding = most common, can be used for all messages & assertions
* HTTP Artifact Binding = a little special
  * The IdP prepaes a second very small message called SAML artifact, and forwards that (via the User Agent) instead of the SAML assertion
  * The SP connects directly (!) to the IdP to resolve the artifact, and finally obtain the SAML assertion
  * This scenario is useful to limit the length of data sent through the User Agent and circumvent some such limitations (see <https://stackoverflow.com/a/13618537>)

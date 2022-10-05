# [OAuth 2.0](https://app.pluralsight.com/library/courses/oauth-2-getting-started/table-of-contents)

In short: **O**pen **Auth**orization standard for access delegation using tokens.
In long: OAuth 2.0 is an API **Authorization** framework built for HTTP APIs, which provides **Scoped** (i.e. partial) access to an API, via **delegation** (the app dialogs with the API on behalf of the user) - not _impersonation_.

## Context

### History

The problem of API authorization.
Past solutions, and why they are no longer suitable for modern applications:

* Credential-sharing = the user provides her login/password to an application so it can access some resource (service).
  * Can't distinguish between user & application (**impersonation**).
  * Can't grant granular permissions: the application can do everything the user can.
  * Gives the application full access to user administration, enabling it to possibly change her password for malicious intents
  * If the app gets compromised, the user's password can get lost in nature. The user has then to change her password herself (no **revocation**).
  * If the app stores the login for user convenience, it can't just store it as a hash, since it needs to login into the resource each time the session must be reopened.
    * Thus they have to be stored in plain-text (or encrypted but reversibly so).
    * This also prevents using 2FA because it has to be repeatable by the app.
  * Federation is not possible (which is login once to multiple apps/websites e.g. Google apps, or company systems).
  * Prevents client-side-only SPA websites, who cannot possibly store credentials securely.
* Cookies = Redirects user to the API where she can login, which produces a cookie that the app can then use to access the API.
  * Better that providing login directly to the App in plain-text, and allows some granularity on the functionalities to allow.
  * But... CSRF; not only is the App authorized, but actually the whole browser is, since cookies are shared at the browser-level.
* API keys = store in the App a (long term) API key provided by the API.
  * Solve nearly all the above problems
  * But still doesn't work for applications that cannot keep a secret (client-side-only SPAs)
  * Besides, there is no standard, so you're on your own

Past = XML + SOAP + SAML/WS-* (federation)
Now = JSON + HTTP APIs + OAuth & OpenID Connect

### Misunderstandings

* OAuth is an Authorization protocol, not an Authentication one.
  * The Access Tokens do not represent the user (delegation instead of impersonation).
  * For Authentication plus (OAuth) Authorization, use OpenID Connect.
* The Client App must not be concerned with the content of the Access Token.
  * The Access Token validation & understanding is the duty of only the Protected Resource (with possibly the AS).
  * The CA should only request the Access Token and then pass it on to the PR. It should not attempt to read its content to perform any business logic of ID verification. Therefore it should not break should the Access Token's format or scheme be modified.
* OAuth is a framework, not a standard
  * It does not prescribe the format of the Access Token, or its validation process, so the quality of its actual implementation may vary.

**OAuth** is an _Authorization_ protocol, unlike **OpenID** which is an _Authentication_ protocol.
[Difference](https://nat.sakimura.org/2011/05/15/dummys-guide-for-the-difference-between-oauth-authentication-and-openid/).

See <https://connect2id.com/learn/oauth-2>
See <https://en.wikipedia.org/wiki/OAuth>

### Versions

* OAuth 1 uses request cryptographic signature.
* OAuth 2 doesn't use signature
  * => easier for developers.
  * => Requires HTTPS (TLS/SSL) must be used for all exchanges so the token doesn't get compromised.

## Glossary

* API Key = long-lived secret key provided to a Client App to use the Protected Resource.
  * CA must be able to keep a secret.
  * Its longevity is problematic if stolen.
* HTTP Basic Authentication = ?
* Authentication = Is someone who they claim they are? Logins & Passwords
* Authorization = Can someone do something? Permissions & Access control
* Client App(lication) = application used by the User that does not necessary require authentication itself but requests access to an API
  * E.g. a public webpage that displays some statistics about a Spotify user account, thus requiring access to parts of that Spotify account, but without needing to login
* Protected Resource = an API the User has access to on its own (e.g. Spotify), and the Client App requests access to.
* User
  * In OAuth, this is the owner of the resource
* Authorization Server = handles authorization requests and is trusted by all parties involved.
  * Must use TLS to guarantee underlying channel security
  * Provides two separated endpoints:
    * A **Authorization endpoint** i.e. a webpage that the CA forwards the User to (with all necessary parameters) to authenticate and come back with a Grant
    * A **Token endpoint** i.e. an API to let the Client Application swap in the Grant for an Access Token
* Scope = permissions to do something within an API.
  * Sent by the Client Application during the initial HTTP Authorization request to the AS.
  * Should be _scoped_ (prefixed) with the API name e.g. `my_api.read` to guarantee namespacing.
* Grant = right of the Client App to perform some actions on the User's behalf, as a random value generated by the AS and only understood by it.
  * Can be implemented in any of a handful of fashions, aka Grant Types, defined by OAuth 2.0 (see below)
  * Typically relatively short-lived (e.g. 1 to 10 minutes).
* Access Token = the "valet key" that allows anyone possessing it to access the Protected Resource with the scopes.
  * This should preferably not be exposed to the user (and her client-side browser) but kept safe in the backend server, although this is not always possible (e.g. client-side-only apps).
  * CA shouldn't be concerned at all with the content of the Token, as it is intended primarily for the PR to verify the rights of the CA (specific implementation is left open by OAuth).
  * Access Token are implementations of [Bearer Token](https://oauth.net/2/bearer-tokens/)
* Refresh Token = a long-lived token used by the CA to obtain a new Access (or Refresh) Token.
  * Provides long-lived access by removing the need for the User to authenticate again everytime the Access Token times-out (also allows long-running tasks)
  * Highly condential: if stolen, the effectiveness of the short-lived access strategy becomes foiled as the thief gains long-term access.
    * Can only be used by Authorization Code & ROPC Grant Types, which possess a backend (also Client Credentials but it doesn't need it since it can logs itself in)
  * User _should be_ informed that Refresh Tokens are requested.
  * `scope=(...) offline_access`
  * Typical policy is one-time usage for one month

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

## General Flow

Important concepts:

* The Authorization Request and the Token Request are performed via two very different channels: one is performed through the user's browser and the other by the CA itself.
* The CA does never need to know who the user is, it simply needs to be given access to the PR (OAuth is not an authentication protocol)
* To let the user authenticate with the AS, she is driven completely away from the CA i.e. her browser go to an entirely different website

1. The Client Application makes an Authorization Request to the Authorization Server
  * This request is **not** sent directly from the CA to the AS.
  * Instead, the (Resource Owner) User's browser is redirected to the Authorization Server's **Authorization endpoint** i.e. an actual webpage on a different website, fully away from the Client App.
2. The Authorization Server approves the incoming request, and challenges the User to verify their identity: this is the Authentication part
  * Notice that the User credentials are therefore completely removed from the Client App: it is truly a redirection out of the Client App.
  * The method used for Authentication is left open by the OAuth specification (Login/Password, Google Id, federated entreprise login).
3. Once the User is successfully authenticated, she needs to consent to the permissions requested by the Client App: access this part, edit that part, for how long.
  * This is still fully done outside of the Client App, so no interference are possible
4. The User is redirected back to the Client Application, including an Authorization Grant in the redirection
  * That Grant represents the given right of the Client App to perform some actions on the User's behalf
  * There are a few possible Grant types
  * The Grant is typically short-lived, and to be traded for an Access Token right away.
5. The Client App now armed with a Grant plus some way to identify itself as a valid client (e.g. client ID & secret), makes a **direct** background request to the AS.
  * Notice this is the first time the CA communicates directly with the AS (via a background WS API request to the AS's **Token endpoint**)
  * Notice this HTTP Post request doesn't go through the User's browser, which doesn't need to know about it.
6. If approved, the AS responds to the Client App's request with an Access Token
  * Only the Client App that was given the Authorization Grant can swap it for a token.
7. The Client App can now use that Access Token to authorize requests to the Protected Resource
  * This is done via the Authorization header, using a given scheme defined by the Authorization Server
    * Using the typical Bearer scheme, anybody whoever has the Access Token can use it
  * What is inside an Access Token, and how the Protected Resource verifies it, is left open
    * Can be a request from the Protected Resource to the AS
    * Or perhaps the PR has an internal mechanism to validate it and understand what permissions were delegated (allowed).
8. Finally, the Client App is allowed access
  * That means it gets the awaited HTTP response from the PR

### [Device Flow](https://oauth.net/2/device-flow/)

This is for IoT devices that don't have a browser embedded, such as connected appliances, consoles, etc.

Since those devices typically don't have an up-to-date secured browser, nor very effective input interface, the login process is offloaded to a secundary device with an up-to-date secure browser i.e. a smartphone.

1. A new AS endpoint is requested by the IoT device: the **Device Authorization** endpoint
2. The AS replies with codes and a URL for the secundary device
3. The URL can be entered in the smartphone browser. This can be made easier by displaying a QR code, or taking advantage of proximity communication tech: NFC or low-energy bluetooth
4. Meanwhile, the device keeps polling the AS for a token until the user has logged in
5. Finally, the device receives the token in response to one of its polling requests

## Grant Types

<https://medium.com/@darutk/diagrams-of-all-the-openid-connect-flows-6968e3990660>

### [Authorization Code Grant Type](https://developer.okta.com/blog/2018/04/10/oauth-authorization-code-grant-type)

Most common Grant Type.
Best for applications/websites with a backend that can keep a secret i.e. the client secret and Access Token.

1. CA Authorization Request
  * Redirects the user's browser with the following query parameters:
    * `response_type=code`
    * `client_id={client id}`
    * `redirect_uri={url}`, which must be pre-registered in the AS
    * `scope={scopes}` (optional) = explicitely request permissions (as opposed to a default set of scopes, defined globally or by application or application type)
    * `state={state}` (optional but highly advised, for round-tripping data and CSRF defense)
2. AS Authorization Response
  * Once the AS has authenticated the user and validated the request, it forwards the browser to the *redirect_uri* along with the following **query parameters**:
    * `code` = the Grant value. It has a very short lifetime and can only be used once. The code is bound to the *client_id*, the *redirect_uri*, the Resource Owner and the Scopes the application has been delegated.
    * `state` = same exact *state* value sent in the Authorization request.
  * Alternatively, it can decide to ignore the request and give back no response.
3. CA Token Request
  * The CA can now send a HTTP POST request directly (i.e. **not** via the User's brower) to the AS, to its **Token endpoint**
  * Confidential information (protected by the TLS layer) is passed as POST headers:
    * `Host: {token endpoint url}`
    * `Content-Type: application/x-www-form-urlencoded`
    * `Authorization: Basic {Base64EncodedClientIdAndSecret}` HTTP Basic Authentication header, containing the client ID & secret.
      * Note that Basic Authentication can refer to either RFC7617 (`Base64(client_id + ":" + client_secret)`) or RFC 6749 (`Base64(urlformencode(client_id) + ":" + urlformencode(client_secret))`), which can lead to unexpected 401 unauthorized if we're providing the wrong one to the server.
    * `grant_type=authorization_code` = tells the Token endpoint what we're giving it and what we're trying to achieve
    * `&code={Grant code}`
    * `&redirect_uri={url}`
    * `&client_id={id}&client_secret={secret}` = only if didn't use Basic authentication POST header above
4. SA Token Response
  * The SA responds with a HTTP 200 including a JSON body containing the Access Token as well as some meta-information (token type, expiry, and optionally the scope, which is also mandatory if the User didn't consent to all of the requested scopes)
  * This Token must be kept hidden from the User in the Backend, so it cannot fall into the wrong hands.

### Implicit Grant Type

For _public clients_ that cannot store secret client credentials in a way that the User('s browser) cannot see/access i.e. all requests go through the User's browser.
It was designed specifically for Javascript applications.
E.g. Client App served directly from a CDN and runs solely on a client's device's browser.
Hence, there cannot be a client secret to pass for the Token Request.
It is therefore less secure than the Authorization Code Grant Type.

Since the client cannot keep any predefined secret, there's no added benefit for an additional dedicated Token Request, which is thus removed entirely.
Instead, the Access Token is provided directly via the browser in response to the initial Authorization Request.

1. CA Authorization Request
  * Parameters
    * `response_type=token`
    * `client_id` = more informative than anything
    * `redirect_uri` = this pre-registered URL is the main defense mechanism of this Grant Type. It must match exactly (no wildcards allowed).
    * `scope`
    * `state`
2. SA Authorization Response
  * After the Authentication, the Access Token is returned now as a **URL Fragment**, to be retrieved and stored in the User's **browser's local storage**.
    * [URL Fragment](https://blog.httpwatch.com/2011/03/01/6-things-you-should-know-about-fragment-urls/)s are only visible to a browser and never go server-side. 
  * This means the Access Token is exposed to the Resource Owner. It may not look serious, as the Resource Owner is indeed supposed to have access to the resources she gave access to, but it also means that it is readable to anyone with access to the user's browser. It also makes 3rd party JavaScript a potential threat.
  * Also, there's no way to verify that the Client App was the intended recipient of this Access Token (since there is no client secret), as it may have been injected.
  * Despite its flaws, this flow can be made more secure using OpenID Connect.

### Client Credientials Grant Type

When there isn't a clear Resource Owner, or that the CA that has no users, the CA itself is the Resource Owner.
This is best for Machine-to-Machine communication.
Client Authentication is required.
The Resource Owner is removed from the equation, as is the Authorization Endpoint.
Uses short-lived Access tokens.

1. CA Token Request
  * `grant_type=client_credentials`
  * `client_id={id}`
  * `client_secret={secret}`
2. PR responds with Token Response

### Resource Owner Password Credentials (ROPC) Grant Type

Used to migrate legacy applications and is considered deprecated.
The CA _impersonates_ the User, and is exceedingly trusted.
Only improvement over Credential Sharing is that username/password do not need be stored, and credentials revocation.
**Do not use this!**

1. CA Token Request
  * `grant_type=client_credentials`
  * `client_id={id}`
  * `client_secret={secret}`
  * `&username={login}&password={password}`

## OpenID Connect 1.0

Authentication protocol.

## EOF

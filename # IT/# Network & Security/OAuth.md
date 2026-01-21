# OAuth (Open Authorization)

Open standard for API access delegation over HTTP (ie partial/scoped access valet key).
It does not prescribe Access Token format or validation process (quality of actual implementation may vary).

* **OAuth 1.0** = uses request cryptographic signature
* **OAuth 2.0** = does not use signature (easier for developers, requires HTTPS (TLS/SSL) must be used for all exchanges so the token doesn't get compromised)

## Quick Tips

* Past = XML + SOAP + SAML/WS-* (federation)
* Now = JSON + HTTP APIs + OAuth & OpenID Connect
* [OAuth 2.0 Simplified](https://www.oauth.com)
* [OAuth 2.0](https://tools.ietf.org/html/rfc6749) = RFC
* [Bearer Token](https://tools.ietf.org/html/rfc6750) = RFC
* [OAuth 2.0 explained](https://connect2id.com/learn/oauth-2)
* [Diagrams of All The OpenID Connect Flows](https://medium.com/@darutk/6968e3990660)
* OAuth relies on transport-layer security, not application-layer encryption of secrets (meaning it uses HTTPS but does not encrypt stuff itself)
* Gist of it is we don't want to provide our confidential credentials to an app (not even who user is), so it will only carry a token whose content (and format) is none of its concern

## Glossary

* **Access Delegation** = use access tokens instead of sharing credentials
* **Access Token** = contains security credentials for a login session about user/group/privileges/particular application to access a some resources on a user's behalf before its expiration date
  * It does not describe user itself, only provides limited access rights to something a user has access
  * Analogy is a valet key, ie a key that opens some but not all parts of a car/house (like a master key would)
  * Must be kept private in transit & storage, because it provides as much access to anyone who has it (ie another user)
  * It should preferably not be exposed to user (& client-side browser) but kept safe in backend server, although this is not always possible (eg client-side-only apps)
  * Access Token are implementations of [Bearer Token](https://oauth.net/2/bearer-tokens), but implementation details are not prescribed by OAuth (could be login/password or valet key)
* **Authentication** = logins/passwords (is someone who they claim they are?)
* **Authorization** = permissions/access control (can someone do something?)
* **Bearer Token** = opaque string in any agreed format (eg hexadecimal or JWT) without any meaning to clients using it (client should be impervious to its particular format and not crash if changed)
* Channels
  * **Back-Channel** = server-to-server communication over HTTPS without involving a user agent (ie no browser that could get compromised)
  * **Front-Channel** = user agent communication (ie JS & URL-based), which is untrusted by OAuth (information can be obtained via browser history, Referer header, malicious extensions, injected scripts interception)
    * **Public Clients** & **Native Apps** = front-channel-only OAuth clients without backends (eg client-side SPA without BFF & running OAuth client logic in JavaScript, mobile, desktop apps), so cannot store secrets & require PKCE
* **Grant** = method that a client application (CA) uses to obtain an access token from an authorization server (AS)
* **HTTP Basic Authentication** = older user login/password prompt
* **JWT** (JSON Web Token) = internet standard for creating optional signatures and/or encryption with JSON payload asserting some claims (eg _logged in as admin_)
  * Tokens are signed via either a shared secret or public/private key, designed to be compact, URL-safe, usable in a web-browser SSO context
* **Microsoft Authentication Library** (MSAL) = enables applications to authenticate users & acquire OAuth/OIDC tokens from Microsoft Entra ID
* **OpenID** = open standard & decentralized authentication protocol (ie a referral letter)
* **OpenID Connect** (**OIDC**) = 3rd generation of OpenID technology, an authentication (identity) layer on top of OAuth 2.0, enabling SSO
  * Standardizes using JWT for its ID tokens, issuer identification, endpoints discovery, JWKS key distribution
* **Refresh Token** = optional longer-lived (typical policy is one-time usage for one month) token used by CA to obtain new access(/refresh) tokens after expiration without reinitiating protocol over
  * Highly condential: if stolen, effectiveness of short-lived access strategy becomes foiled as thief gains long-term access
  * Can only be used by Authorization Code & ROPC Grant Types, which possess a backend (also Client Credentials but doesn't need it since it can logs itself in)
* **Scope** = permissions to do something within an API (usually at controller-level, not individual methods), ie what an access token is allowed to do
  * Sent by client application during initial HTTP Authorization request to AS
  * Should be _scoped_ (prefixed) with API name eg `my_api.read` to guarantee namespacing

### Roles

* **Authorization Server** (AS) = dedicated server trusted by all parties involved, handling authorization requests, issuing access tokens to clients via serveral means (eg user Domain authentication, asking to login, etc)
  * A **Authorization Endpoint** = webpage that CA forwards user to (with all necessary parameters) to authenticate and come back with a grant (eg authorization code)
  * A **Device Authorization Endpoints** = for device authorization flow (device receives URL from that endpoint and starts polling, secondary device opens URL and authenticates, device gets in)
  * A **Token Endpoint** = lets a client application contact AS directly (ie not via web browser) to swap in its authorization code for an access token
  * Must use TLS to guarantee underlying channel security
* **Client (Application)** (CA) = any front (web/mobile/desktop) application used by end-user that needs to obtain a token to access a resource server (eg GUI app accessing a microservice, public Spotify statistics webpage)
  * **Client Secret** = shared secret between a (registered) client & AS to authenticate the client (**not** the user) and required missing half to exchange an authorization code for tokens
* **Resource Owner** = end-user who possesses some remote resource but must first prove himself to access it
* **Resource Server** (RS) = an entity that holds protected assets/data/resources, provided in exchange of right token

### [Flows (Grant Types)](https://frontegg.com/blog/oauth-flows)

* A browser is usually involved (except eg in Client Credentials or JWT Bearer flows) to perform an interactive user login validation step

* **Authorization Code** = most common, optimal for traditional mobile/web applications with a confidential backend, redirection-based flow to obtain both access/refresh tokens (in exchange of auth code)
  * An authorization code is a one-time code that is useless on its own (requires client secret to be traded), bound to a specific client, redeemable only once, very short-lived (typically seconds)
  * Browser returns from AS with its own backend address as return URL containing an auth code in GET parameter (browser does not make eg a separate XHR request, just serves to forward code on its way back)
* **Authorization Code + PKCE** = most common/recommended default flow nowadays, mandatory for public clients (replaces deprecated Implicit flow)
  * **Proof Key for Code Exchange** (PKCE) = extension to specifically prevent authorization code interception, by generating a code verifier/challenge pair used in exchanges with AS proving it originated token requests
* **Client Credentials** = for non-user (ie no GUI/browser, eg daemon/service) workflows machine-to-machine (eg WS calling other WS) authentication, CA becomes resource owner, authenticates directly via ID/secret
* **Device Authorization** = limited devices with no browser (eg IoT, Smart TV, media console, printer) authenticate via a secondary device (eg a smartphone with more up-to-date secure browser, and convenient QR/NFC/LE Bluetooth)
* **Implicit** (_deprecated_) = legacy flow for browser-only (JavaScript, SPAs) applications without a backend, pass token via URL (instead of auth code)
* **Password** = for trusted native clients where application & authorization server belong to same provider
* **Refresh Token** = special grant to let clients refresh their access token without having to go through steps of code or password grant again
* **Resource Owner Password Credentials** (ROPC) = direct user login/password impersonation by highly trusted CA, strongly discouraged & only used to migrate legacy applications
* **JWT (or SAML) Bearers Assertion** = token exchange using a signed JWT (no browser required)

#### Authorization Code

Best for applications/websites with a backend that can keep a secret (ie the client secret & Access Token).

* CA Authorization Request
  * Redirects the user's browser with the following query parameters:
    * `response_type=code`
    * `client_id={client id}`
    * `redirect_uri={url}`, which must be pre-registered in the AS
    * `scope={scopes}` (optional) = explicitely request permissions (as opposed to a default set of scopes, defined globally or by application or application type)
    * `state={state}` (optional but highly advised, for round-tripping data and CSRF defense)
* AS Authorization Response
  * Once the AS has authenticated the user and validated the request, it forwards the browser to the _redirect\_uri_ along with the following **query parameters**:
    * `code` = the Grant value. It has a very short lifetime and can only be used once. The code is bound to the _client\_id_, the _redirect\_uri_, the Resource Owner and the Scopes the application has been delegated
    * `state` = same exact _state_ value sent in the Authorization request
  * Alternatively, it can decide to ignore the request and give back no response
* CA Token Request
  * The CA can now send a HTTP POST request directly (ie **not** via the User's brower) to the AS, to its **Token endpoint**
  * Confidential information (protected by the TLS layer) is passed as POST headers:
    * `Host: {token endpoint url}`
    * `Content-Type: application/x-www-form-urlencoded`
    * `Authorization: Basic {Base64EncodedClientIdAndSecret}` HTTP Basic Authentication header, containing the client ID & secret
      * Note that Basic Authentication can refer to either RFC7617 (`Base64(client_id + ":" + client_secret)`) or RFC 6749 (`Base64(urlformencode(client_id) + ":" + urlformencode(client_secret))`), which can lead to unexpected 401 unauthorized if we're providing the wrong one to the server
    * `grant_type=authorization_code` = tells the Token endpoint what we're giving it and what we're trying to achieve
    * `&code={Grant code}`
    * `&redirect_uri={url}`
    * `&client_id={id}&client_secret={secret}` = only if didn't use Basic authentication POST header above
* SA Token Response
  * The SA responds with a HTTP 200 including a JSON body containing the Access Token as well as some meta-information (token type, expiry, and optionally the scope, which is also mandatory if the User didn't consent to all of the requested scopes)
  * This Token must be kept hidden from the User in the Backend, so it cannot fall into the wrong hands
* CA can now access RS, passing obtain tokens via header `Authorization: Bearer <access_token>`

#### Implicit

For _public clients_ that cannot store secret client credentials in a way that the User('s browser) cannot see/access ie all requests go through the User's browser.
It was designed specifically for Javascript applications.
eg Client App served directly from a CDN and runs solely on a client's device's browser.
Hence, there cannot be a client secret to pass for the Token Request.
It is therefore less secure than the Authorization Code Grant Type.

Since the client cannot keep any predefined secret, there's no added benefit for an additional dedicated Token Request, which is thus removed entirely.
Instead, the Access Token is provided directly via the browser in response to the initial Authorization Request.

* CA Authorization Request
  * Parameters
    * `response_type=token`
    * `client_id` = more informative than anything
    * `redirect_uri` = this pre-registered URL is the main defense mechanism of this Grant Type. It must match exactly (no wildcards allowed).
    * `scope`
    * `state`
* SA Authorization Response
  * After the Authentication, the Access Token is returned now as a **URL Fragment**, to be retrieved and stored in the User's **browser's local storage**.
    * [URL Fragment](https://blog.httpwatch.com/2011/03/01/6-things-you-should-know-about-fragment-urls/)s are only visible to a browser and never go server-side.
  * This means the Access Token is exposed to the Resource Owner. It may not look serious, as the Resource Owner is indeed supposed to have access to the resources she gave access to, but it also means that it is readable to anyone with access to the user's browser. It also makes 3rd party JavaScript a potential threat.
  * Also, there's no way to verify that the Client App was the intended recipient of this Access Token (since there is no client secret), as it may have been injected.
  * Despite its flaws, this flow can be made more secure using OpenID Connect.

#### Resource Owner Password Credentials (ROPC)

Only improvement over Credential Sharing is that username/password do not need be stored, and credentials revocation.
**Do not use this!**

* CA Token Request
  * `grant_type=client_credentials`
  * `client_id={id}`
  * `client_secret={secret}`
  * `&username={login}&password={password}`

## Other API Authorization Methods

* **Credential Sharing** = lets applications use private login/password to access some resource/API
  * Can't distinguish between user & application (**impersonation**)
  * Can't grant granular permissions: the application can do everything the user can (full access/administration possibly for malicious intents)
  * No revocation if app gets compromised (user's password itself can get lost in nature and must then be changed)
  * If app stores credentials for user convenience, they cannot be securely hashed as they must be provided in clear/plain text
  * Prevents client-side-only SPA websites, who cannot possibly store credentials securely
  * Federation is not possible
* **Cookies** = lets user login to API and save login token in a cookie (better, no plain text login, allows some granularity on allowed functions)
  * Sensitive to CSRF = whole browser becomes since cookies are shared at the browser-level
* **API Key** = long-lived secret key provided by API to lets Client App access it(s resources), solves nearly all above problems
  * Doesn't work for client applications that cannot keep a secret (eg client-side-only SPAs)
  * There is no standard so you're on your own, and its longevity is problematic if stolen

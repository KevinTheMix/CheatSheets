# OAuth (Open Authorization)

Open standard for API access delegation over HTTP (ie partial/scoped access valet key).
It does not prescribe Access Token format or validation process (quality of actual implementation may vary).

* **OAuth 1.0** = uses request cryptographic signature
* **OAuth 2.0** = does not use signature (easier for developers), relies on HTTPS (TLS/SSL) for all exchanges so tokens don't get compromised (no application-layer encryption)

## Quick Tips

* Past = XML + SOAP + SAML/WS-* (federation)
* Now = JSON + HTTP APIs + OAuth & OpenID Connect
* [OAuth 2.0 Simplified](https://www.oauth.com)
* [OAuth 2.0](https://tools.ietf.org/html/rfc6749) = RFC
* [Bearer Token](https://tools.ietf.org/html/rfc6750) = RFC
* [OAuth 2.0 explained](https://connect2id.com/learn/oauth-2)
* [Diagrams of All The OpenID Connect Flows](https://medium.com/@darutk/6968e3990660)
* Gist = an app never gets user credentials, it only carries a token whose content/format is none of its concern

## Glossary

* **Access Delegation** = use access tokens instead of sharing credentials
* **Access Token** = grants limited access rights to some resources on a user's behalf until its expiration date (does not describe user itself)
  * Analogy is a valet key, ie opens some but not all parts of a car/house (unlike a master key)
  * Gives same access to anyone who has it, so keep private in transit & storage, preferably in a backend & not exposed to user/browser (not always possible, eg client-side-only apps)
* **Authentication** = verifying identity, eg logins/passwords (is someone who they claim to be?)
* **Authorization** = permissions/access control (can someone do something?)
* **[Bearer Token](https://oauth.net/2/bearer-tokens)** = token usable by whoever holds it, in any agreed format (eg hexadecimal or JWT, not prescribed by OAuth)
  * Clients should treat it as an opaque string & not break if its format changes
* Channels
  * **Back-Channel** = server-to-server communication over HTTPS without involving a user agent (ie no browser that could get compromised)
  * **Front-Channel** = user agent communication (ie JS & URL-based), which is untrusted by OAuth (information can be obtained via browser history, Referer header, malicious extensions, injected scripts interception)
    * **Public Clients** & **Native Apps** = front-channel-only OAuth clients without backends (eg client-side SPA without BFF & running OAuth client logic in JavaScript, mobile, desktop apps), so cannot store secrets & require PKCE
* **Grant** = method that a client application (CA) uses to obtain an access token from an authorization server (AS)
* **HTTP Basic Authentication** = older user login/password prompt
* **JWT** (JSON Web Token) = internet standard for creating optional signatures and/or encryption with JSON payload asserting some claims (eg *logged in as admin*)
  * Tokens are signed via either a shared secret or public/private key, designed to be compact, URL-safe, usable in a web-browser SSO context
  * They are divided into three dot-delimited parts (ie `header.payload.signature` where signature is computed from `base64url(header) + "." + base64url(payload)` with a secret or private key)
* **Microsoft Authentication Library** (MSAL) = enables applications to authenticate users & acquire OAuth/OIDC tokens from Microsoft Entra ID
* **OpenID** = open standard & decentralized authentication protocol
* **OpenID Connect** (**OIDC**) = 3rd generation of OpenID technology, an authentication (identity) layer on top of OAuth 2.0, enabling SSO
  * Standardizes using JWT for its ID tokens, issuer identification, endpoints discovery, JWKS key distribution
* **Refresh Token** = optional longer-lived token used by CA to obtain new access(/refresh) tokens after expiration without reinitiating protocol over
  * Highly confidential: if stolen, thief gains long-term access (defeats short-lived access tokens)
  * Issued by Authorization Code (incl PKCE), Device & ROPC grants, never by Implicit & not meant for Client Credentials (can simply log in again)
* **Scope** = permissions to do something within an API (usually at controller-level, not individual methods), ie what an access token is allowed to do
  * Sent by client application during initial HTTP Authorization request to AS
  * Should be *scoped* (prefixed) with API name eg `my_api.read` to guarantee namespacing

### Roles

* **Authorization Server** (AS) = dedicated server trusted by all parties involved, handling authorization requests, issuing access tokens to clients via several means (eg user Domain authentication, asking to login, etc)
  * **Authorization Endpoint** = front-channel webpage that CA forwards user to (with all necessary parameters) to authenticate and come back with a grant (eg authorization code)
  * **Device Authorization Endpoint** = for device flow (device gets a verification URL & user code from it and starts polling, user opens URL on a secondary device, enters code & authenticates, device gets tokens)
  * **Token Endpoint** = back-channel endpoint where CA contacts AS directly (ie not via browser) to swap its authorization code for an access token
  * Must use TLS to guarantee underlying channel security
* **Client (Application)** (CA) = application obtaining a token to access a resource server, on behalf of a user or itself, with a backend (confidential) or without (public) (eg web/mobile/desktop GUI app, SPA, daemon accessing a microservice)
  * **Client Secret** = shared secret between a (registered) client & AS to authenticate the client (**not** the user) and required missing half to exchange an authorization code for tokens
* **Resource Owner** = entity (usually end-user) that owns a protected resource & can grant access to it
* **Resource Server** (RS) = an entity that holds protected assets/data/resources, provided in exchange of right token

### [Flows (Grant Types)](https://frontegg.com/blog/oauth-flows)

* A browser is usually involved (except eg in Client Credentials or JWT Bearer flows) to perform an interactive user login validation step

* **Authorization Code** = optimal for traditional mobile/web applications with a confidential backend, redirection-based flow to obtain access/refresh tokens in exchange of an auth code
  * Front channel = user logs in at AS Authorization Endpoint, browser is redirected to client backend with a one-time auth code (browser only forwards it)
  * Back channel = backend calls AS Token Endpoint directly with code + client secret to get tokens (never exposed to browser)
* **Authorization Code + PKCE** = most common/recommended default flow nowadays (replacing deprecated Implicit flow), mandatory for public clients that can't keep a secret (eg scripts on a user's machine)
  * **Proof Key for Code Exchange** (PKCE) = extension to specifically prevent authorization code interception, by generating a code verifier/challenge pair used in exchanges with AS proving it originated token requests
* **Client Credentials** = for non-interactive **machine-to-machine** (eg inter-backends) workflows, authenticated via long-lived client ID/secret that represent application itself (not a user), CA acts as resource owner
* **Device Authorization** = limited devices with no browser (eg IoT, Smart TV, media console, printer) authenticate via a secondary device (eg a smartphone with more up-to-date secure browser, and convenient QR/NFC/LE Bluetooth)
* **Implicit** (*deprecated*) = legacy flow for browser-only (JavaScript, SPAs) applications without a backend, token passed via URL (instead of auth code), no refresh token
* **JWT (or SAML) Bearers Assertion** = token exchange using a signed JWT (no browser required)
* **Refresh Token** = special grant to get a new access token without repeating code/password steps
* **Resource Owner Password Credentials** (ROPC, aka Password, *deprecated, strongly discouraged*) = direct user login/password submission to highly trusted CA (eg same provider as AS), only used to migrate legacy applications

#### Authorization Code

Best for applications/websites with a backend that can keep secrets (ie client secret & access token).

* CA Authorization Request
  * Redirects user's browser with following query parameters:
    * `response_type=code`
    * `client_id={client id}`
    * `redirect_uri={url}`, which must be pre-registered at AS
    * `scope={scopes}` (optional) = explicitly request permissions (instead of default scopes defined globally or per application/type)
    * `state={state}` (optional but highly advised, for round-tripping data and CSRF defense)
* AS Authorization Response
  * After authenticating user & validating request, AS redirects browser to *redirect_uri* with **query parameters**:
    * `code` = grant value, single-use & very short-lived (typically seconds), bound to *client_id*, *redirect_uri*, Resource Owner & delegated scopes (useless without client secret)
    * `state` = same *state* value sent in Authorization request
  * If user denies or request fails, AS redirects with `error` instead (eg `error=access_denied`, plus `state`), except for invalid/mismatching *redirect_uri* (user is informed, no redirect)
* CA Token Request
  * CA sends an HTTP POST directly (ie **not** via user's browser) to AS **Token endpoint**, protected by TLS
  * Headers
    * `Host: {token endpoint url}`
    * `Content-Type: application/x-www-form-urlencoded`
    * `Authorization: Basic {Base64EncodedClientIdAndSecret}` = client ID & secret
      * Basic Authentication can follow RFC 7617 (`Base64(client_id + ":" + client_secret)`) or RFC 6749 (`Base64(urlformencode(client_id) + ":" + urlformencode(client_secret))`), a wrong one can cause an unexpected 401 unauthorized
  * Form body parameters
    * `grant_type=authorization_code` = tells Token endpoint which grant is used
    * `code={Grant code}`
    * `redirect_uri={url}`
    * `client_id={id}` & `client_secret={secret}` = only if Basic authentication header is not used
* AS Token Response
  * HTTP 200 with JSON body containing access token & meta-information (token type, expiry, scope: optional unless user didn't consent to all requested scopes)
  * Token stays in backend, hidden from user
* CA can now access RS with header `Authorization: Bearer <access_token>`

#### Implicit

For *public clients* that cannot hide a client secret from user's browser (eg JavaScript app served from a CDN, running solely in browser).
No client secret means no Token Request: access token is returned directly in browser in response to Authorization Request (less secure than Authorization Code).

* CA Authorization Request
  * `response_type=token`
  * `client_id` = informative only
  * `redirect_uri` = pre-registered, main defense of this grant, must match exactly (no wildcards)
  * `scope`
  * `state`
* AS Authorization Response
  * Access token returned as a [URL Fragment](https://blog.httpwatch.com/2011/03/01/6-things-you-should-know-about-fragment-urls/) (only visible to browser, never sent server-side), to be stored in browser local storage
  * Token is readable by anyone with access to browser & exposed to 3rd party JavaScript
  * Cannot verify that CA was intended recipient (no client secret), token may have been injected

#### Resource Owner Password Credentials (ROPC)

Only improvements over Credential Sharing = login/password need not be stored & access can be revoked.
**Do not use this!**

* CA Token Request
  * `grant_type=password`
  * `client_id={id}`
  * `client_secret={secret}`
  * `username={login}` & `password={password}`

## Other API Authorization Methods

* **Credential Sharing** = lets applications use private login/password to access some resource/API
  * Can't distinguish between user & application (**impersonation**)
  * Can't grant granular permissions: app can do everything user can (full access/administration, possibly for malicious intents)
  * No revocation if app gets compromised (user's password itself can get lost in nature and must then be changed)
  * If app stores credentials for user convenience, they cannot be securely hashed as they must be provided in clear/plain text
  * Unusable by client-side-only SPAs (cannot store credentials securely)
  * Federation is not possible
* **Cookies** = lets user login to API and save login token in a cookie (better, no plain text login, allows some granularity on allowed functions)
  * Sensitive to CSRF, since cookies are shared at browser level
* **API Key** = long-lived secret key provided by API to let CA access its resources, solves nearly all above problems
  * Doesn't work for client applications that cannot keep a secret (eg client-side-only SPAs)
  * There is no standard so you're on your own, and its longevity is problematic if stolen

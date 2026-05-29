## 5. Client Authentication

```diff
Updated statement
- the PKI Mutual TLS OAuth Client Authentication Method SHALL NOT be supported
+ the Mutual TLS Client Authentication Methods SHALL NOT be supported
```

This section outlines how participants in the CDR regime will authenticate clients seeking access to endpoints.

Note that, while **[[MTLS]](#nref-MTLS)** is utilised for transaction security and as a Holder of Key mechanism, the Mutual TLS Client Authentication Methods **SHALL NOT** be supported as the mechanism for client authentication.

The following authentication methods are supported:

* Data Holders **SHALL** authenticate the CDR Register client using one of the following Client Authentication methods: 
  * Self-signed JWT client assertion authenticated by the protected request endpoint according to [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication), or 
  * `private_key_jwt` authentication using `client_credentials` authorisation grant flow according to [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication).
* Data Holders and the CDR Register **MUST** authenticate Data Recipient Software Products using the [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) method.
* Data Recipient Software Products **MUST** authenticate Data Holders and the CDR Register using the [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication) method.

### 5.1. Private Key JWT Client Authentication

> Private Key JWT Client Authentication Non-Normative Example - CDR Register calls the Data Holder's token endpoint to obtain an Access Token for the purposes of calling the Data Holder's Get Metrics endpoint.

```
POST /token HTTP/1.1
Host: mtls.dh.example.com
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials&
  client_id={ClientId}&
  scope=admin%3Ametrics.basic%3Aread&
  client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&
  client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...

## Decoded client assertion JWT
{
  "alg": "PS256",
  "typ": "JWT",
  "kid": "12456"
}
{
  "iss": "{ClientId}",
  "sub": "{ClientId}",
  "iat": 1516239022,
  "exp": 1516239322,
  "aud": "https://tls.dh.example.com",
  "jti": "37747cd1-c105-4569-9f75-4adf28b73e31"
}
```

```diff
Updated Private Key JWT Client Authentication section
```

The `private_key_jwt` authentication method is enabled through the delivery of an encoded **[[JWT]](#nref-JWT)** signed using the Data Recipient Software Product's private key and thus facilitates non-repudiation.

Client public keys are obtained from the **[[JWKS]](#nref-JWKS)** endpoints.

#### 5.1.1. Authorisation Server

Authorisation Servers:

1. **SHALL** verify client authentication assertions in accordance with section [5.3.2](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.3.2) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

#### 5.1.2. Client

Clients:

1. **SHALL** issue client authentication assertions in accordance with section [5.3.3](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.3.3) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

### 5.2. Self-signed JWT Client Authentication

> Self-signed JWT Client Authentication Non-Normative Example - CDR Register calls the Data holder's Get Metrics endpoint using self-signed JWT Client Authentication (note that the "aud" claim represents the AdminBaseUri as defined in CDR Register Participant Endpoints).

```
GET https://mtls.dh.example.com/cds-au/v1/admin/metrics HTTP:/1.1
Host: mtls.dh.example.com
x-v: string
x-min-v: string
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...

## Decoded Bearer token JWT
{
  "alg":"PS256",
  "typ":"JWT",
  "kid":"12456"
}
{
  "iss":"cdr-register",
  "sub":"cdr-register",
  "aud":"https://mtls.dh.example.com",
  "iat":1516239022,
  "exp":1516239322,
  "jti":"32358102-a44f-43cc-ad7c-42443d01507a"
}
```

```diff
Updated Self-signed JWT Client Authentication section
```

Data Recipient Software Products and Data Holders supporting the self-signed JWT authentication of clients using a signed JWT **SHALL** do so according to the following requirements:

1. The JWT **SHALL** contain the following REQUIRED Claim Values and **MAY** contain the following OPTIONAL Claim Values:
  * _iss_ - REQUIRED. The identifier for the issuer of the JWT. The client ID of the bearer.
  * _sub_ - REQUIRED. Subject Identifier. The client ID of the bearer.
  * _aud_ - REQUIRED. Audience(s) that the JWT is intended for. The Data Holder or Data Recipient Software Product **SHALL** verify that it is an intended audience for the token.
     * Data Recipient hosted endpoints:
         * The [Resource Path](#uri-resource-path) for the endpoint being accessed **SHALL** be used.
     * Data Holder Metrics endpoints:
         * The `<AdminBaseUri>` for the endpoint being accessed **SHALL** be used.
  * _jti_ - REQUIRED. JWT ID. A unique identifier for the token, which can be used to prevent reuse of the token. These tokens **SHALL** only be used once.
  * _exp_ - REQUIRED. Expiration time on or after which the ID Token **SHALL NOT** be accepted for processing. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC expiry time.
  * _iat_ - OPTIONAL. Time at which the JWT was issued. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC 'issued at' time.
1. Validation and use of the JWT and the claims described above **SHALL** be performed in accordance with **[[JWT]](#nref-JWT)**. 
1. The JWT **SHALL** be accepted from the client at the requested endpoint using the "Authorization Request Header Field" mechanism as described in [section 2.1](https://datatracker.ietf.org/doc/html/rfc6750#section-2.1) of **[[RFC6750]](#nref-RFC6750)**.
1. In accordance with _jti_ requirements, self-signed JWTs are one-time use only. The authenticating server **SHALL** reject JWTs reuse.

### 5.3. CDR Register calling Data Holders

Data Holders **MUST** support either [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) or [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication) of the CDR Register.

Data Holders **SHOULD** support [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) but **MAY** support [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication).

This method **MAY** be changed by updating Data Holder registration details with the CDR Register.

#### 5.3.1. Private Key JWT authentication

If the Data Holder supports the [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) method for authenticating the CDR Register, it **MUST** also support the following requirements:

1. Data Holders **MUST** issue a client ID that is provided to the CDR Register. The client ID is issued to the CDR Register during out of band registration processes, including, Data Holder onboarding. This **MAY** be a static client ID value of `cdr-register`.
1. The authorisation grant's _grant_type_ parameter **MUST** be set to `client_credentials`. 
1. The authorisation grant's _scope_ parameter **MUST** be provided and **MUST** be set to the scope of the resource endpoint to be accessed.
1. Upon successful authentication, Data Holders **MUST** issue an Access Token to the CDR Register. In accordance with [section 4.4](https://tools.ietf.org/html/rfc6749#section-4.4) of **[[RFC6749]](#nref-RFC6749)** a Refresh Token **SHOULD NOT** be included.

#### 5.3.2. Self-signed JWT authentication

If the Data Holder supports the [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication) method for authenticating the CDR Register, the client ID **MUST** be set to a value of `cdr-register`.

### 5.4. Data Holders calling Data Recipients

> Non-Normative Example - Data Holder calls the Data Recipient Software Product's CDR Arrangement Revocation endpoint (note that the "aud" claim is "resource path" to the revocation endpoint).

```
POST https://adr.example.com/arrangements/revoke HTTP/1.1
Host: adr.example.com
Content-Type: application/x-www-form-urlencoded
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...

cdr_arrangement_jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImtpZCI6IjEyNDU2In0.ey...

## Decoded Bearer token JWT
{
  "alg":"PS256",
  "typ":"JWT",
  "kid":"12456"
}
{
  "iss":"{dataHolderBrandId}",
  "sub":"{dataHolderBrandId}",
  "aud":"https://adr.example.com/arrangements/revoke",
  "iat":1516239022,
  "exp":1516239322,
  "jti":"dba86502-7cf5-4719-9638-c5339a0ddb06"
}
```

> Non-Normative Example - Data Recipient Software Product calls Data Holder's token endpoint.
This example uses PKCE to send the code_verifier which was previously encrypted in the request object submission as the code_challenge using S256 as the code_challenge_method

```
POST /token HTTP/1.1
Host: mtls.dh.example.com
Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code&
  code=i1WsRn1uB1&
  client_id={ClientId}&
  code_verifier=4d9213fb-d68b-49d1-a2c9-486e5a0b4e14&
  client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&
  client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...

## Decoded client assertion JWT
{
  "alg": "PS256",
  "typ": "JWT",
  "kid": "12456"
}
{
  "iss": "{ClientId}",
  "sub": "{ClientId}",
  "iat": 1516239022,
  "exp": 1516239322,
  "aud": "https://tls.dh.example.com",
  "jti": "37747cd1-c105-4569-9f75-4adf28b73e31"
}
```

In addition to the requirements for [Self-signed JWT Client Authentication](#5-2-self-signed-jwt-client-authentication), the _client_id_ is the "Data Holder Brand ID" as issued by CDR Register.

### 5.5. Data Recipients calling Data Holders

In addition to the requirements for [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) the following requirements **MUST** be supported:

1. The authorisation grant's _client_id_ parameter value **MUST** represent the ID issued to the Data Recipient Software Product by the Data Holder upon successful dynamic client registration.
1. The authorisation grant's _grant_type_ parameter value **MUST** only be included when invoking the Token endpoint and **MUST** be set to `authorization_code` or `client_credentials`. The value `refresh_token` is also valid when refreshing an access token.

### 5.6. Data Recipients calling the CDR Register

> Non-Normative Example - Data Recipient Software Product requests CDR Register Access Token

```
POST /token HTTP/1.1
Host: secure.api.cdr.gov.au
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials&
  client_id=<brand id> OR <software product id>&
  client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&
  client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...&
  scope=cdr-register%3Aread

## Decoded client assertion JWT
{
  "alg": "PS256",
  "typ": "JWT",
  "kid": "b50641343f8f4717a4865d238b6297b8"
}
{
  "iss": "<brand id> OR <software product id>",
  "sub": "<brand id> OR <software product id>",
  "exp": 1516239322,
  "aud": "https://secure.api.cdr.gov.au/idp/connect/token",
  "jti": "37747cd1-c105-4569-9f75-4adf28b73e31"
}

## Response
{
  "access_token": "eyJhbGciOiJQUz...",
  "expires_in": 7200,
  "token_type": "Bearer",
  "scope": "cdr-register:read openid"
}
```

In addition to the requirements for [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) the following requirements **MUST** be supported:

1. _grant_type_ **MUST** be set to `client_credentials`
1. Refresh tokens will not be provided for _grant_type_ `client_credentials`
1. _client_id_, _iss_ and _sub_ claims **MUST** be set to the ID of the calling client "Data Recipient Brand ID" OR "Software Product ID" issued by the CDR Register

<aside class="notice">
"Data Recipient Brand ID" and "Software Product ID" are both currently supported as client identifiers for client authentication.<br>
"Data Recipient Brand ID" as a client identifier will be deprecated in the future and is currently retained for backwards compatibility.
</aside>

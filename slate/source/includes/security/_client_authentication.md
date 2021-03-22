<a id="client-authentication"></a>
## Client Authentication

This section outlines how participants in the CDR regime will authenticate clients seeking access to end points.

Note that, while **[MTLS]** is utilised for transaction security and as a Holder of Key mechanism, the PKI Mutual TLS OAuth Client Authentication Method SHALL NOT be supported as the mechanism for client authentication.

### CDR Register calling Data Holders and Data Recipients

The following authentication methods are supported:

  * Data Holders SHALL authenticate the CDR Register client using one of the following Client Authentication methods:  
      * Self-signed JWT client assertion authenticated by the protected request endpoint according to [Self-signed JWT Client Authentication](#self-signed-jwt-client-authentication), or  
      * `private_key_jwt` authentication using `client_credentials` authorisation grant flow according to [Private Key JWT Client Authentication](#private-key-jwt-client-authentication).  

  * Data Recipients MUST authenticate the CDR Register using the [Self-signed JWT Client Authentication](#self-signed-jwt-client-authentication) method.

#### Private Key JWT Client Authentication

> Private Key JWT Client Authentication Non-Normative Example - CDR Register calls the Data Holder's token end point to obtain an Access Token for the purposes of calling the Data Holder's Get Metrics endpoint.

```
POST /token HTTP/1.1
Host: www.holder.com.au
Content-Type: application/x-www-form-urlencoded

grant_type=client_credentials&
  client_id=5ntwEOpMdPxxy49Gt28SXWY6j3afl2CP2&
  client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&
  client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey ...

## Decoded client assertion JWT
{
  "alg": "PS256",
  "typ": "JWT",
  "kid": "12456"
}
{
  "iss": "5ntwEOpMdPxxy49Gt28SXWY6j3afl2CP2",
  "sub": "5ntwEOpMdPxxy49Gt28SXWY6j3afl2CP2",
  "iat": 1516239022,
  "exp": 1516239322,
  "aud": "https://www.holder.com.au/token",
  "jti": "37747cd1-c105-4569-9f75-4adf28b73e31"
}
```

Data Holders supporting `private_key_jwt` Client Authentication of the CDR Register they MUST support the following requirements:

* Data Holders MUST support the authentication of the CDR Register using the `private_key_jwt` Client Authentication method specified at [section 9](https://openid.net/specs/openid-connect-core-1_0.html#ClientAuthentication) of **[OIDC]**.
* Data Holders MUST issue a client ID that is provided to the CDR Register. The client ID is issued to the CDR Register during out of band registration processes, including, Data Holder onboarding. This MAY be a static client ID value of ‘cdr-register’.
* The `private_key_jwt` authentication method is enabled through the delivery of an encoded **[JWT]** signed using the CDR Register's private key and thus facilitates non-repudiation.
* The CDR Register public key is obtained from the **[JWKS]** endpoint provided to Data Holders.
* For the client authentication assertion, the **[JWT]** represents an assertion that MUST contain the following REQUIRED Claim Values and MAY contain the following OPTIONAL Claim Values:
    * `iss` - REQUIRED. Issuer. The client ID of the bearer. This MUST be the client ID issued by the Data Holder to the CDR Register.
    * `sub` - REQUIRED. Subject. The client ID of the bearer. This MUST be the client ID issued by the Data Holder to the CDR Register.
    * `aud` - REQUIRED. Audience. The aud (audience) Claim. Identifies the recipients that the JWT is intended for. The issuer identifier URL of the authorisation server according to **[RFC8414]** SHOULD be used as the value of the audience. In order to facilitate interoperability, the authorisation server MUST accept its Issuer Identifier, Token Endpoint URL, or the URI of the endpoint being invoked as values that identify it as an intended audience.
    * `jti` - REQUIRED. JWT ID. A unique identifier for the token, which can be used to prevent reuse of the token. These tokens MUST only be used once.
    * `exp` - REQUIRED. Expiration time on or after which the ID Token MUST NOT be accepted for processing. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC expiry time.
    * `iat` - OPTIONAL. Time at which the JWT was issued. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC issued at time.

* The aforementioned assertion MUST be sent to the Data Holder's Token endpoint with the `POST` method and MUST include the following REQUIRED parameters:

    * `grant_type` - REQUIRED. The grant type(s) supported by the Authorisation Server. This parameter MUST be set to `client_credentials`.  
    * `client_id` - REQUIRED. The client ID of the bearer.
    * `client_assertion_type` - REQUIRED. This MUST be set to `urn:ietf:params:oauth:client-assertion-type:jwt-bearer`.
    * `client_assertion` - REQUIRED. The encoded assertion JWT.
    * `scope` - REQUIRED. The requested scope as described in [Section 3.3](https://tools.ietf.org/html/rfc6749#section-3.3) of **[RFC6749]**.

* Upon successful authentication, Data Holders MUST issue an Access Token to the CDR Register. In accordance with [section 4.4](https://tools.ietf.org/html/rfc6749#section-4.4) of **[RFC6749]** an Refresh Token SHOULD NOT be included.

#### Self-signed JWT Client Authentication
> Self-signed JWT Client Authentication Non-Normative Example - CDR Register calls the Data holder's Get Metrics end point using self-signed JWT Client Authentication (note that the “aud” claim represents the AdminBaseUri as defined in CDR Register Participant Endpoints).

```
GET https://admin.data.holder.com.au/cds-au/v1/admin/metrics HTTP:/1.1
Host: admin.data.holder.com.au
x-v: string
x-min-v: string
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey ...

## Decoded Bearer token JWT
{
   "alg":"PS256",
   "typ":"JWT",
   "kid":"12456"
}
{
   "iss":"cdr-register",
   "sub":"cdr-register",
   "aud":"https://admin.data.holder.com.au",
   "iat":1516239022,
   "exp":1516239322,
   "jti":"32358102-a44f-43cc-ad7c-42443d01507a"
}
```

Data Recipients and Data Holders supporting the self-signed JWT authentication of the CDR Register using a signed JWT according to the following requirements:

*	The JWT MUST contain the following REQUIRED Claim Values and MAY contain the following OPTIONAL Claim Values:
    * `iss` - REQUIRED. Issuer Identifier. This MUST contain the static CDR Register id of ‘cdr-register’.
    * `sub` - REQUIRED. Subject Identifier. This MUST contain the static CDR Register id of ‘cdr-register’.
    * `aud` - REQUIRED. Audience(s) that the JWT is intended for. Value that identifies the intended audience. The Data Holder or Data Recipient MUST verify that it is an intended audience for the token. Contents MUST be the base URI for the end point being accessed.
    * `jti` - REQUIRED. JWT ID. A unique identifier for the token, which can be used to prevent reuse of the token. These tokens MUST only be used once.
    * `exp` - REQUIRED. Expiration time on or after which the ID Token MUST NOT be accepted for processing. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC expiry time.
    * `iat` - OPTIONAL. Time at which the JWT was issued. Value is a JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC issued at time.

*	Validation and use of the JWT and the claims described above MUST be performed in accordance with **[JWT]**.  
*	The JWT MUST be accepted from the client at the requested endpoint using the "Authorization Request Header Field" mechanism as described in [section 2.1](https://tools.ietf.org/html/rfc6750#section-2.1) of **[RFC6750]**.

### Data Holders calling Data Recipients

> Non-Normative Example - Data Holder calls the Data Recipient's revocation end point (note that the “aud” claim is the fully qualified path to the revocation end point because the full path is also the Base URI).

```
POST https://data.recipient.com.au/revocation HTTP/1.1
Host: data.recipient.com.au
Content-Type: application/x-www-form-urlencoded
Authorization: Bearer eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey …

token=45ghiukldjahdnhzdauz&token_type_hint=refresh_token

## Decoded Bearer token JWT
{
   "alg":"PS256",
   "typ":"JWT",
   "kid":"67890"
}
{
   "iss":"dataholderbrand-123",
   "sub":"dataholderbrand-123",
   "aud":"https://data.recipient.com.au/revocation",
   "iat":1516239022,
   "exp":1516239322,
   "jti":"dba86502-7cf5-4719-9638-c5339a0ddb06"
}
```

Data Recipients MUST support the authentication of Data Holders using a signed JWT according to the following requirements:

*	The JWT MUST contain the following REQUIRED Claim Values and MAY contain the following OPTIONAL Claim Values:
    *	`iss` - REQUIRED. Issuer. This MUST contain the id of the Data Holder obtained from the CDR Register.
    *	`sub` - REQUIRED. Subject. This MUST contain the id of the Data Holder obtained from the CDR Register.
    *	`aud` - REQUIRED. Audience. The aud (audience) Claim. Value that identifies the Data Recipient as the intended audience. The Data Recipient MUST verify that it is an intended audience for the token. Contents MUST be the base URI for the end point being accessed.
    *	`jti` - REQUIRED. JWT ID. A unique identifier for the token, which can be used to prevent reuse of the token. These tokens MUST only be used once.
    *	`exp` - REQUIRED. Expiration time on or after which the ID Token MUST NOT be accepted for processing.
    *	`iat` - OPTIONAL. Time at which the JWT was issued.
*	Validation and use of the JWT and the claims described above MUST be performed in accordance with [JWT]
*	The JWT should be accepted from the client using the "Authorization Request Header Field" mechanism as described in [section 2.1 of RFC6750](https://tools.ietf.org/html/rfc6750)


### Data Recipients calling Data Holders

Data Holders MUST support the authentication of Data Recipients using the `private_key_jwt` Client Authentication method specified at [section 9](https://openid.net/specs/openid-connect-core-1_0.html#ClientAuthentication) of **[OIDC]**.

> Non-Normative Example - Data Recipient calls Data Holder's token end point.

```
POST /token HTTP/1.1
Host: www.holder.com.au
Content-Type: application/x-www-form-urlencoded

grant_type=authorization_code&
  code=i1WsRn1uB1&
  client_id=s6BhdRkqt3&
  client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer&
  client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey ...

## Decoded client assertion JWT
{
  "alg": "PS256",
  "typ": "JWT",
  "kid": "12456"
}
{
  "iss": "12345",
  "sub": "12345",
  "iat": 1516239022,
  "exp": 1516239322,
  "aud": "https://www.holder.com.au/token",
  "jti": "37747cd1-c105-4569-9f75-4adf28b73e31"
}
```

The `private_key_jwt` authentication method is enabled through the delivery of an encoded **[JWT]** signed using the Data Recipient's private key and thus facilitates non-repudiation.

Client public keys are obtained from the **[JWKS]** endpoints.

For the client authentication assertion, the **[JWT]** represents an assertion that MUST include the following claims:

- `iss`: The client ID of the bearer.
- `sub`: The client ID of the bearer.
- `aud`: The aud (audience) Claim. Identifies the recipients that the JWT is intended for.<br/>
      **Until March 31st, 2021**, Data Recipients MUST continue to send as a single value string the URL of the endpoint being invoked. Data Holders MUST support validation of the URL of the endpoint being invoked.<br/>
      **After March 30th, 2021**, Data Holders MUST support:<br/> The issuer identifier URL of the authorisation server according to **[RFC8414]** SHOULD be used as the value of the audience. In order to facilitate interoperability, the authorisation server MUST accept its Issuer Identifier, Token Endpoint URL, or the URI of the endpoint being invoked as values that identify it as an intended audience.<br/>

- `exp`: A JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC expiry time.
- `jti`: A unique identifier generated by the client for this authentication.

The following claims MAY be included:

- `iat`: A JSON number representing the number of seconds from 1970-01-01T00:00:00Z to the UTC issued at time.

When invoking a protected end point, the aforementioned assertion MUST be sent with the `POST` method and MUST include the following parameters:

-  `grant_type`: This parameter MUST only be included when invoking the Token End point and MUST be set to `authorisation_code` or `client_credentials`.  The value `refresh_token` is also valid when refreshing an access token.
-  `code`: This parameter MUST only be included when invoking the Token End point after utilising the [Hybrid Authentication flow](#hybrid-flow).  This is the value of the code parameter returned in the authorisation response.
-  `client_id`: The ID of the calling Client.
-  `client_assertion_type`: This MUST be set to `urn:ietf:params:oauth:client-assertion-type:jwt-bearer`.
-  `client_assertion`: The encoded assertion JWT.

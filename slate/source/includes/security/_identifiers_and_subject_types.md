<a id="identifiers"></a>

## 12. Identifiers and Subject Types  

### 12.1. sub claim

The identifier for an authenticated end-user (subject) **MUST** be passed in the _sub_ claim of an [ID Token](https://openid.net/specs/openid-connect-core-1_0.html#IDToken) and [UserInfo response](https://openid.net/specs/openid-connect-core-1_0.html#UserInfoResponse) as defined by **[[OIDC]](#nref-OIDC)**.

The Data Holder **MUST** generate the _sub_ value as a Pairwise Pseudonymous Identifier (PPID) as described in [section 8](https://openid.net/specs/openid-connect-core-1_0.html#SubjectIDTypes) of **[[OIDC]](#nref-OIDC)**. Furthermore, the identifier **MUST** be unique per customer as per the definition of customer in the CDR Federation section of this profile.

The Data Holder **MUST** support the _sector_identifier_uri_ in PPID generation according to **[[OIDC]](#nref-OIDC)** if this field was supplied by the client during registration.

It is RECOMMENDED that the _sub_ value is generated as a version 4 Universally Unique Identifier (UUID) **[[RFC4122]](#nref-RFC4122)**.


### 12.2. CDR Arrangement ID

> Non-normative example: Token Endpoint hydration

> Request

```
POST /token HTTP/1.1
Host: mtls.dh.example.com
Content-Type: application/x-www-form-urlencoded

client_id={ClientId}
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...
&grant_type=refresh_token
&refresh_token=tGzv3JOkF0XG5Qx2TlKWIA
&scope=openid%20profile
```

> Response

```
{
  "access_token": "2YotnFZFEjr1zCsicMWpAA",
  "expires_in": 3600,
  "refresh_token": "tGzv3JOkF0XG5Qx2TlKWIA",
  "id_token": "eyJraWQiOiIxZTlnZGs3IiwiYWxnIjoiUl...",
  "cdr_arrangement_id": "02e7c9d9-cfe7-4c3e-8f64-e91173c84ecb"
}
```

```diff
Updated Non-Normative example
- "iss": "https://mtls.dh.example.com",
+ "iss": "https://tls.dh.example.com",
```


> Decoded ID Token JWT

```
{
  "iss": "https://tls.dh.example.com",
  "sub": "{ppid}",
  "aud": "{ClientId}",
  "nonce": "n-0S6_WzA2Mj",
  "exp": 1311281970,
  "iat": 1311280970,
  "nbf": 1311280970,
  "auth_time": 1311280969,
  "acr": "urn:cds.au:cdr:3"
}
```

> Non-normative example: Token Introspection Endpoint hydration

> Request

```
POST /token/introspect HTTP/1.1
Host: mtls.dh.example.com
Content-Type: application/x-www-form-urlencoded

client_id={ClientId}
&client_assertion_type=urn%3Aietf%3Aparams%3Aoauth%3Aclient-assertion-type%3Ajwt-bearer
&client_assertion=eyJhbGciOiJQUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjEyNDU2In0.ey...
&token=tGzv3JOkF0XG5Qx2TlKWIA
&token_type_hint=refresh_token
```

> Response

```
{
  "active": true,
  "exp": 1311281970,
  "scope": "openid profile bank:accounts.basic:read bank:accounts.detail:read",
  "cdr_arrangement_id": "02e7c9d9-cfe7-4c3e-8f64-e91173c84ecb"
}
```

The CDR Arrangement ID is a unique string representing a consent arrangement between a Data Recipient Software Product and Data Holder for a given consumer.

The identifier **MUST** be unique per customer according to the definition of customer in the CDR Federation section of this profile.

The Data Holder **MUST** provide the CDR Arrangement ID as the claim _cdr_arrangement_id_ in the Token endpoint response and Token Introspection endpoint response.

Statements related to the CDR Arrangement ID:

1. The CDR Arrangement ID **MUST** be unique to a Data Holder.
1. The CDR Arrangement ID **MUST** be non-guessable and **MUST NOT** identify a consumer.
1. A CDR Arrangement ID **SHOULD** be generated using an algorithm that reduces the chances of collision.
1. A CDR Arrangement ID **MUST** be static across consents within the one sharing arrangement (e.g. across consent renewal and re-authorisation).

#### 12.2.1. Obtaining a CDR Arrangement ID

A Data Recipient Software Product can call either the Token or Token Introspection endpoints at any point post-consent to obtain the CDR Arrangement ID in the response JSON as the claim _cdr_arrangement_id_.

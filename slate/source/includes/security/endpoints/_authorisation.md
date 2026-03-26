### 19.2. Authorisation endpoint

> Non-Normative Example  
> This example demonstrates how an ADR may send a staged authorisation request (using PAR) in the back-channel to the Data Holder.
>
> It demonstrates a compliant authorisation request that used PAR to first submit the authorisation request object.

```
## Request

GET /authorise?client_id={ClientId}&
    scope=openid&
    request_uri=urn%3Aietf%3Aparams%3Aoauth%3Arequest_uri%3A6esc_11ACC5bwc014ltc14eY22c
HTTP/1.1
Host: tls.dh.example.com
```

| Description | Value |
|---|---|
| Hosted By | Data Holder |
| Transport Security | TLS |
| Client Authentication Required| No|
| Bearer Token Required| No|

```diff
Updated Authorisation endpoint detail to change reference from [FAPI-1.0-Advanced] to [Baseline Security Provisions]
```

The requirements for the Authorisation endpoint are specified in [section 3.1](https://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth) of **[[OIDC]](#nref-OIDC)** and further specified under **[[Baseline Security Provisions]](#3-1-baseline-security-provisions)** in this profile. This endpoint is invoked as part of the [Authorization Code Flow](#4-2-authorization-code-flow).

This endpoint does not require [CORS](#17-cors).

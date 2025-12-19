### JSON Web Key Set endpoint
| Description | Value |
|---|---|
| Hosted By | Data Holder & Data Recipient Software Product |
| Transport Security | TLS |
| Client Authentication Required | No |
| Bearer Token Required | No |

The requirements for the JWKS endpoint are specified in various sections of **[[OIDC]](#nref-OIDC)**.

This endpoint is used by the Data Holder to provide the public keys they will use when required.

Data Holders **MUST** support a JWKS endpoint.

This endpoint does not require [CORS](#cors).

```diff
Removed detail for JWKS URIs
```

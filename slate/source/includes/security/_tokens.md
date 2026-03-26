## 11. Tokens

```diff
Updated Tokens section to remove past FDOs and references to hybrid flow and FAPI 1.0

Updated Non-Normative example
- "iss": "https://mtls.dh.example.com",
+ "iss": "https://tls.dh.example.com",
```

### 11.1. ID Token

> Non-Normative Example - Decoded ID Token

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
  "acr": "urn:cds.au:cdr:2"
}
```

ID Tokens are specified in [section 2](https://openid.net/specs/openid-connect-core-1_0.html#IDToken) of the **[[OIDC]](#nref-OIDC)** standard.

#### 11.1.1. Baseline ID Token requirements

The following provisions apply to Data Holders issuing ID Tokens:

1. ID Tokens **SHALL** be signed by Data Holders in accordance with [section 2](https://openid.net/specs/openid-connect-core-1_0.html#IDToken) of **[[OIDC]](#nref-OIDC)** and [section 5.4.1](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.4.1) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.
1. ID Tokens **SHALL NOT** contain any Personal Information (PI) claims.

### 11.2. Access Token

The following provisions apply to Data Holders issuing Access Tokens:

1. Access Tokens **SHALL** be used as specified in [section 10.3] (https://tools.ietf.org/html/rfc6749#section-10.3) of **[[OAUTH2]](#nref-OAUTH2)**.
1. An Access Token **SHALL** expire between **2 minutes** to **10 minutes** after the Data Holder issues it (at the discretion of the Data Holder).
1. Data Holders **SHALL** reject a token request with an authorization code (Section 1.3.1 of **[[RFC6749]](#nref-RFC6749)**) if it has been previously used.

The process for refreshing an Access Token is described in [section 12.1](https://openid.net/specs/openid-connect-core-1_0.html#RefreshingAccessToken) of **[[OIDC]](#nref-OIDC)**.

### 11.3. Refresh Token

1. Refresh Tokens **SHALL** be supported by Data Holders in accordance with [section 12](https://openid.net/specs/openid-connect-core-1_0.html#RefreshTokens) of **[[OIDC]](#nref-OIDC)**.<br>In addition, Data Holders:
1. **SHALL** issue Refresh Tokens with an _exp_ value equal to the sharing duration authorised by the consumer.

### 11.4. Token Expiry

The following token expiry requirements apply:

1. The expiry time for issued access tokens and refresh tokens **SHALL** be deterministic for the Data Recipient Software Product.<br>In order to achieve this:
1. The Data Holder **SHALL** indicate the lifetime in seconds of the access token in the _expires_in_ field of the JSON object returned by the token endpoint (see [section 4.2.2] (https://tools.ietf.org/html/rfc6749#section-4.2.2) of **[[OAUTH2]](#nref-OAUTH2)**).

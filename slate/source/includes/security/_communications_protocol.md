## 3. Communications Protocol

```diff
Section added:
+ 3. Communications Protocol
```

### 3.1. Baseline Security Provisions

#### 3.1.1. Cryptography and Secrets

Data Holders and Data Receipients **MUST** comply with section [5.4.1](https://openid.net/specs/fapi-security-profile-2_0.html#name-general-requirements-3) of the **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**, except that JWTs **MUST** be signed using only PS256 or ES256. 

#### 3.1.2. Data Holders

Data Holders **MUST** support the authorisation server (section [5.3.2](https://openid.net/specs/fapi-security-profile-2_0.html#section-5.3.2)) and resource server (section [5.3.4](https://openid.net/specs/fapi-security-profile-2_0.html#section-5.3.4)) provisions defined in **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

In addition, Data Holders:

1. **MUST** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.
1. **MUST** support client authentication using *private_key_jwt*.
1. **MUST NOT** support refresh token rotation subject to section [5.3.2.1(9)](https://openid.net/specs/fapi-security-profile-2_0.html#section-5.3.2.1) of the **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.
1. **MUST** distribute discovery metadata using **[[OIDD]](#nref-OIDD)**.
1. **MAY** optionally, and in addition, distribute authorisation server metadata using **[[RFC8414]](#nref-RFC8414)**.
1. **MUST** set *require_pushed_authorization_requests parameter* to `true`, distributed using **[[OIDD]](#nref-OIDD)**.
1. **MUST** only support Authorization Code Flow.
1. **MUST** require the value of *response_type* described in **[[RFC6749]](#nref-RFC6749)** to be `code`.
1. **MUST** support authorisation request signing in accordance with section [5.3.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.3.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **MUST** support and issue signed authorisation responses using **[[JARM]](#nref-JARM)** in accordance with section [5.4.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.4.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **MAY** implement introspection response signing in accordance with section [5.5.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.5.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **MUST NOT** serve a JWK set via their *jwks_uri* that contains multiple keys with the same *kid*.
1. **MUST** set the *x-fapi-interaction-id* response header in accordance with [HTTP Headers](#http-headers) section to track the interaction for PAR and Token endpoint responses (See [Request and Response Correlation](#3-2-request-and-response-correlation)).
1. **MUST** log the values of the *x-fapi-interaction-id* header in the log entries associated with requests to, and responses from, the PAR and Token endpoints\.
1. **MUST** support the `jwt` response mode as defined in **[[JARM]](#nref-JARM)** and **MUST** include `jwt` in the *response_modes_supported* metadata parameter distributed using **[[OIDD]](#nref-OIDD)**.

**3.1.2.1. Resource Server Baseline Provisions**

In addition, Data Holders: 

1. **MUST** set the response header *x-fapi-interaction-id* in accordance with the [HTTP Headers](#http-headers) section, to track the interaction for resource endpoint responses (See [Request and Response Correlation](#3-2-request-and-response-correlation)).
1. **MUST** log the value of *x-fapi-interaction-id* in the correlated request and response log entries.
1. **MUST** accept *x-fapi-end-user-present* as an indicator that the end-user is present when a resource endpoint is called. 
1. **MUST** log the value of *x-fapi-end-user-present* in the correlated resource request and response log entry.

#### 3.1.3. Data Recipients
Data Recipient Software Products **MUST** support the client provisions defined in section [5.3.3](https://openid.net/specs/fapi-security-profile-2_0.html#section-5.3.3) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**. 

In addition, Data Recipient Software Products:

1. **MUST** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.
1. **MUST** support client authentication using *private_key_jwt*.
1. **MUST** only request authorisation using Authorization Code Flow such that *response_type* described in **[[RFC6749]](#nref-RFC6749)** is set to `code`.
1. **MUST** support authorisation request signing in accordance with section [5.3.2](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.3.2) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **MUST** support and use signed authorisation responses using **[[JARM]](#nref-JARM)**  in accordance with section [5.4.2](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.4.2) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHOULD NOT** reuse *authorization_code* values.
1. **MAY** send requests with the *x-fapi-interaction-id* header in accordance with [HTTP Headers](#http-headers) section across the data holder's PAR, Token and resource endpoints (See [Request and Response Correlation](#3-2-request-and-response-correlation)).
1. **SHOULD** reuse the same *x-fapi-interaction-id* value across the data holder's PAR request and the Token endpoint request that immediately follows the authorisation response, to assist with tracing and troubleshooting for authorisation flow(s). 
1. **MUST** log the value of the *x-fapi-interaction-id* header in log entries associated with requests to, and responses from, the PAR, Token and resource endpoints. 
1. **MUST NOT** serve a JWK set via their *jwks_uri* that contains multiple keys with the same *kid*.
1. **MAY** send requests with an *x-fapi-end-user-present* header in accordance with the [HTTP Headers](#http-headers) section.


### 3.2. Request and Response Correlation

Request and response correlation provides a mechanism to correlate individual client requests and server responses for debugging, security and interoperability purposes. The Standards define the *x-fapi-interaction-id* header that provides this property and it is mandatory for certain server responses. 
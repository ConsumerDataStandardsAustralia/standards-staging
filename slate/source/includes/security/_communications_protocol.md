## 3. Communications Protocol

```diff
Section added:
+ 3. Communications Protocol
```

### 3.1. Baseline Security Provisions
#### 3.1.1. Data Holders

Data Holders **MUST** support the the authorisation server (section 5.3.2) and resource server (section 5.3.4) provisions defined in **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

In addition, Data Holders:

1. **SHALL** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.
1. **SHALL** support client authentication using both **[[MTLS]](#nref-MTLS)** and *private_key_jwt*.
1. **SHALL NOT** support refresh token rotation.
1. **SHALL** distribute disovery metadata using **[[OIDD]](#nref-OIDD)**.
1. **MAY** optionally, and in addition, distribute authorization server metadata using **[[RFC8414]](#nref-RFC8414)**.
1. **SHALL** set *require_pushed_authorization_requests parameter* to `true`, distributed using **[[OIDD]](#nref-OIDD)**.
1. **SHALL** support *mtls_endpoint_aliases*, distributed using **[[OIDD]](#nref-OIDD)** in accordance with section [5.2.2.1](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.2.2.1) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.
1. **SHALL** only support Authorization Code Flow.
1. **SHALL** require the value of *response_type* described in **[[RFC6749]](#nref-RFC6749)** to be `code`.
1. **SHALL** support authorisation request signing in accordance with section [5.3.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.3.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHALL** support and issue signed authorisation responses using **[[JARM]](#nref-JARM)** in accordance with section [5.4.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.4.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHALL** implement introspection response signing in accordance with section [5.5.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.5.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHALL** use the HTTP 303 status code when redirecting the user agent using status codes.
1. **SHALL** accept *x-cds-user-present* as an indicator that the end-user is present when the authorisation or resource endpoint is called.
1. **SHALL** log the value of *x-cds-user-present* in the correlated PAR, authorisation, and token request, response and resource log entries.
1. **SHALL NOT** contain issue JWK sets via their *jwks_uri* that contain multiple keys with the same *kid*.
1. **SHOULD** certify their implementation as FAPI Certified as defined in [OpenID-Certification](https://openid.net/certification/).

**3.1.1.1. Authorization Server Baseline Provisions**

In addition, Data Holders:

1. **SHALL** set the response headers *x-fapi-interaction-id*, *x-cds-authorisation-attempt-id*, and *x-cds-authorisation-intent-id* in accordance with the [HTTP Headers](#http-headers) section, to track the interaction for PAR and Token endpoint responses.
1. **SHALL** set the *x-fapi-interaction-id*, *x-cds-authorisation-attempt-id*, and *x-cds-authorisation-intent-id* as parameters in the authorisation response JWT in accordance with **[[JARM]](#nref-JARM)** for authorisation responses.
1. **SHALL** log the values of *x-fapi-interaction-id*, *x-cds-authorisation-attempt-id*, and *x-cds-authorisation-intent-id* in the correlated request and response log entries including PAR, Authorization and Token endpoints.

**3.1.1.2. Resource Server Baseline Provisions**

In addition, Data Holders: 

1. **SHALL** set the response header *x-fapi-interaction-id* in accordance with the [HTTP Headers](#http-headers) section, to track the interaction for resource endpoint responses.
1. **SHALL** log the value of *x-fapi-interaction-id* in the correlated request and response log entries.

#### 3.1.2. Data Recipients
Data Recipient Software Products **MUST** support the client provisions defined in section [5.3.3](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.3.3) of **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**. 

In addition, Data Recipient Software Products:

1. **SHALL** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.
1. **SHALL** support client authentication using both **[[MTLS]](#nref-MTLS)** and *private_key_jwt*.
1. **SHALL** only request authorisation using Authorization Code Flow such that *response_type* described in **[[RFC6749]](#nref-RFC6749)** is set to `code`.
1. **SHALL** support authorisation request signing in accordance with section [5.3.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.3.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHALL** support and issue signed authorisation responses using **[[JARM]](https://consumerdatastandardsaustralia.github.io/standards/#nref-JARM)** in accordance with section [5.4.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.4.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHALL** implement introspection response signing in accordance with section [5.5.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.4.1) of **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)**.
1. **SHOULD** record the following information each time an authorisation flow is executed: username (consumer's ID at the Data Recipient Software Product), timestamp, IP, consent scopes and duration.
1. **SHOULD NOT** reuse *authorization_code* values, and if reused, it will be rejected.
1. **SHALL** log the value of *x-fapi-interaction-id* in the correlated request and response log entries for all applicable authorisation and resource endpoints.
1. **SHALL** log the values of *x-cds-authorisation-attempt-id* and *x-cds-authorisation-intent-id* in the correlated PAR, Authorization, and Token request and response log entries.
1. **SHALL NOT** contain issue JWK sets via their *jwks_uri* that contain multiple keys with the same *kid*.
1. **MAY** send requests with a *x-fapi-customer-ip-address* header containing a valid IPv4 or IPv6 address.
1. **SHOULD** certify their Relying Party implementation as FAPI Certified as defined in [OpenID-Certification](https://openid.net/certification/).


### 3.2. Correlation Identifiers

#### 3.2.1. Request Interaction Correlation

Request and response correlation provides a mechanism to correlate individual client requests and server responses for debugging, security and interoperability purposes. FAPI defines the *x-fapi-interaction-id* header that provides this property and is mandatory for server error responses.

**Data Holders**

1. **SHALL** shall set the response header *x-fapi-interaction-id* in accordance with the [HTTP Headers](#http-headers) section, to track the interaction.

#### 3.2.2. Authorisation Attempt Correlation

Authorisation attempts require correlation across three levels: (i) the individual endpoint being called, (ii) the authorisation attempt that chains all authorisation endpoints relevant to establishing a grant, and (iii) repeated client attempts to establish authorisation in case of failure and retry.

**x-cds-authorisation-attempt-id:** an identifier for a unique authorisation attempt. The *x-cds-authorisation-id* must be used as a reference to a discrete authorisation exchange (specifically, a single authorisation interaction commencing from the PAR lodgment through to token exchange). If the attempt fails, but the Data Recipient retries, then a new value must be generated. This provides a shared persistent identifier to correlate authorisation issues between the Data Recipient and Data Holder.

The Data Recipient can use this in conjunction with the *x-fapi-interaction-id* to correlate multiple authorisation attempts. The *x-fapi-interaction-id* must be used as a reference across a chain of authorisation attempts.

#### 3.2.3. Correlating multiple attempts to achieve authorisations

Data Recipients and Data Holders can track multiple attempts where the consumer attempts authorisation (including previously failed attempts) under the same intent to authorise an action like data sharing by mapping multiple *x-pai-interaction*.

**x-cds-authorisation-intent-id:** an identifier for tracking successive related authorisation attempts correlated to the same authorisation intent. The purpose of this tracking ID is to The *x-cds-authorisation-id* must be used as a reference to a discrete authorisation exchange (specifically, a single authorisation interaction commencing from the PAR lodgment through to token exchange). If the attempt fails, but the Data Recipient retries, then a new value must be generated. This provides a shared persistent identifier to correlate authorisation issues between the Data Recipient and Data Holder.

The Data Recipient can use this in conjunction with the *x-fapi-interaction-id* to correlate multiple authorisation attempts. The *x-fapi-interaction-id* must be used as a reference across a chain of authorisation attempts.
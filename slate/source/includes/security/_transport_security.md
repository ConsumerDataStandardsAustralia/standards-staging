## 15. Transaction Security

### 15.1. Use of TLS
All HTTP calls **MUST** be made using HTTPS incorporating TLS version 1.2 or later and **MUST** satisfy the mandatory requirements in section [5.2.1](https://openid.net/specs/fapi-security-profile-2_0.html#name-requirements-for-all-endpoi) of the **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

<a id="mutual-tls"></a>

### 15.2. Use of MTLS

All back-channel communication between Data Recipient Software Product and Data Holder systems **MUST** incorporate, unless stated otherwise, **[[MTLS]](#nref-MTLS)** as part of the TLS handshake:

- The presented Client transport certificate **MUST** be issued by the CDR Certificate Authority (CA). The Server **MUST NOT** trust Client transport certificates issued by other authorities.
- The presented Server transport certificate **MUST** be issued by the CDR Certificate Authority (CA). The Client **MUST NOT** trust Server transport certificates issued by other authorities.

Endpoints for transferring CDR Data that are classified as not requiring authentication (i.e. public endpoints) or those specified as TLS, **MUST NOT** use **[[MTLS]](#nref-MTLS)**.

### 15.3. Holder of Key Mechanism

**[[MTLS]](#nref-MTLS)** **MUST** be supported as a Holder of Key (HoK) Mechanism.

Note that, by implication, resource requests **MUST** be validated to ensure the client certificate and access token match.

OAUTB **SHALL NOT** be supported due to a lack industry support.

**[[MTLS]](#nref-MTLS)** HoK allows issued tokens to be bound to a client certificate as specified in [section 3](https://www.rfc-editor.org/rfc/rfc8705.html#name-mutual-tls-client-certifica) of **[[MTLS]](#nref-MTLS)**.

### 15.4. Ciphers

```diff
Updated Ciphers section to remove past FDOs
```
Cipher suite requirements **MUST** follow **[[BCP195]](#nref-BCP195)** subject to sections [5.2.2](https://openid.net/specs/fapi-security-profile-2_0.html#name-requirements-for-endpoints-) and [5.2.3](https://openid.net/specs/fapi-security-profile-2_0.html#name-requirements-for-endpoints-u) of the **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

### 15.5. Browser-facing endpoints

CDR endpoints that are accessed by web browsers **MUST** use methods to protect against TLS stripping attacks, in accordance with section [5.2.3(1)](https://openid.net/specs/fapi-security-profile-2_0.html#section-5.2.3) of the **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

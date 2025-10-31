## Communications Protocol
### Baseline Security Provisions 
#### Data Holders 
Data Holders **MUST** support the the authorisation server (section 5.3.2) and resource server (section 5.3.4) provsions defined in [FAPI-2.0-Security](#FAPI-2.0-Security-Profile).

In addition, Data Holders:

- **SHALL** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.  
- **SHALL** support client authentication using both **[[MTLS]](#nref-MTLS)** and private_key_jwt. 
- **SHALL NOT** support refresh token rotation. 
- **SHALL** distribute disovery metadata using **[[OIDD]](#nref-OIDD)**.
- **MAY** optionally, and in addition, distrubute authorization server metadata using **[[RFC8414]](#nref-RFC8414)**.
- **SHALL** set require_pushed_authorization_requests parameter to true distributed using **[[OIDD]](#nref-OIDD)**.
- **SHALL** support mtls_endpoint_aliases distributed using **[[OIDD]](#nref-OIDD)** in accordance with section 5.2.2.1 of [FAPI-2.0-Security](#FAPI-2.0-Security-Profile).
- **SHALL** only support Authorization Code Flow.
- **SHALL** require the value of response_type described in **[[RFC6749]](#nref-RFC6749)** to be code.
- **SHALL** support authorisation request signing in accordance with section 5.3.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHALL** support and issue signed authorisation responses using **[[JARM]](#nref-JARM)** in accordance with section 5.4.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHALL** implement introspection response signing in accordance with section 5.5.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHALL** use the HTTP 303 status code when redirecting the user agent using status codes.
- **SHALL** accept x-cds-user-present as an indicator that the end-user is present when the authorisation or resource endpoint is called.
- **SHALL** log the value of x-cds-user-present in the correlated PAR, authorisation, and token request, response and resource log entries.
- **SHALL NOT** contain issue JWK sets via their jwks_uri that contain multiple keys with the same kid.
- **SHOULD** certify their implementation as FAPI Certified as defined in [OpenID-Certification].

#### Authorization Server Baseline Provisions 
In addition, Data Holders:

- **SHALL** shall set the response headers x-fapi-interaction-id, x-cds-authorisation-attempt-id , and x-cds-authorisation-intent-id  in accordance with the **[[HTTP Headers]](#http-headers)** section, to track the interaction for PAR and Token endpoint responses.
- **SHALL** set the x-fapi-interaction-id, x-cds-authorisation-attempt-id , and x-cds-authorisation-intent-id  as parameters in the authorisation response JWT in accordance with **[[JARM]](#nref-JARM)** for authorisation responses.
- **SHALL** log the values of x-fapi-interaction-id, x-cds-authorisation-attempt-id , and x-cds-authorisation-intent-id in the correlated request and response log entries including PAR, Authorization and Token endpoints.

#### Resource Server Baseline Provisions 
In addition, Data Holders: 

- **SHALL** shall set the response header x-fapi-interaction-id in accordance with the **[[HTTP Headers]](#http-headers)** section, to track the interaction for resource endpoint responses.
- **SHALL** log the value of x-fapi-interaction-id in the correlated request and response log entries.

### Data Recipients 
Data Recipient Software Products **MUST** support the the client provsions defined in section 5.3.3 of [FAPI-2.0-Security](#FAPI-2.0-Security-Profile). 

In addition, Data Recipient Software Products:

- **SHALL** only use **[[MTLS]](#nref-MTLS)** as the mechanism for sender-constrained access tokens.
- **SHALL** support client authentication using both **[[MTLS]](#nref-MTLS)** and private_key_jwt.
- **SHALL** only request authorisation using Authorization Code Flow such that response_type described in **[[RFC6749]](#nref-RFC6749)** is set to code.
- **SHALL** support authorisation request signing in accordance with section 5.3.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHALL** support and issue signed authorisation responses using [JARM] in accordance with section 5.4.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHALL** implement introspection response signing in accordance with section 5.5.1 of [FAPI-2.0-Message-Signing](#nref-FAPI-2-0-Message-Signing).
- **SHOULD** record the following information each time an authorisation flow is executed: username (consumer’s ID at the Data Recipient Software Product), timestamp, IP, consent scopes and duration.
- **SHOULD NOT** reuse authorization_code values, and if reused, it will be rejected.
- **SHALL** log the value of x-fapi-interaction-id in the correlated request and response log entries for all applicable authorisation and resource endpoints.
- **SHALL** log the values of  x-cds-authorisation-attempt-id and x-cds-authorisation-intent-id  in the correlated PAR, Authorization, and Token request and response log entries.
- **SHALL NOT** contain issue JWK sets via their jwks_uri that contain multiple keys with the same kid.
- **MAY** send requests with a x-fapi-customer-ip-address header containing a valid IPv4 or IPv6 address.
- **SHOULD** certify their Relying Party implementation as FAPI Certified as defined in [OpenID-Certification].


### Correlation Identifiers

#### Request Interaction Correlation

Request and response correlation provides a mechanism to correlate individual client requests and server responses for debugging, security and interoperablity purposes. FAPI defines the x-fapi-interaction-id header that provides this property and is mandatory for server error responses.

**Data Holders**
**SHALL** shall set the response header x-fapi-interaction-id in accordance with the [HTTP Headers](#http-headers) section, to track the interaction.

#### Authroisation Attempt Correlation

Authorisation attempts require correlation across three levels:

- (i) the individual endpoint being called,
- (ii) the authorisation attempt that chains all authorisation endpoints relevant to establishing a grant, and
- (iii) repeated client attempts to establish authorisation in case of failure and retry.

**x-cds-authorisation-attempt-id:** an identifier for a unique authorisation attempts. The x-cds-authorisation-id must be used as a reference to a discrete authorisation exchange (specifically, a single authorisation interaction commencing from the PAR lodgment through to token exchange). If the attempt fails, but the Data Recipient retries, then a new value must be generated. This provides a shared persistent identifier to correlate authorisation issues between the Data Recipient and Data Holder.

The Data Recipient can use this in conjunction with the x-fapi-interaction-id to correlate multiple authorisation attempts. The x-fapi-interaction-id must be used as a reference across a chain of authorisation attempts.

**Correlating multiple attempts to achieve authorisations**

Data Recipients and Data Holders can track multiple attempts where the consumer attempts authorisation (including previously failed attempts) under the same intent to authorise an action like data sharing by mapping multiple x-pai-interaction.

**x-cds-authorisation-intent-id:** an identifier for tracking successive related authorisation attempts correlated to the same authorisation intent. The purpose of this tracking ID is to The x-cds-authorisation-id must be used as a reference to a discrete authorisation exchange (specifically, a single authorisation interaction commencing from the PAR lodgment through to token exchange). If the attempt fails, but the Data Recipient retries, then a new value must be generated. This provides a shared persistent identifier to correlate authorisation issues between the Data Recipient and Data Holder.

The Data Recipient can use this in conjunction with the x-fapi-interaction-id to correlate multiple authorisation attempts. The x-fapi-interaction-id must be used as a reference across a chain of authorisation attempts.
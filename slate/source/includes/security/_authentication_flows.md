## 4. Authentication Flows

```diff
Introductory text updated to reference to FAPI 2.0 and remove a reference to the deprecated hybrid flow.

Updated 'Baseline Security Provisions' to 'Baseline Authentication Flow Provisions' for Data Holders and Data Recipient Software Products
```

This profile supports the authentication flows specified by [OpenID Connect](https://openid.net/specs/openid-connect-core-1_0.html) **[[OIDC]](#nref-OIDC)** as constrained further by **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)**.

Authorization Code Flow outlined at [section 3.1](https://openid.net/specs/openid-connect-core-1_0.html#CodeFlowAuth) of **[[OIDC]](#nref-OIDC)** is supported.

No other flows are currently supported.

### 4.1. Baseline Authentication Flow Provisions

#### 4.1.1. Data Holders

1.	**SHALL** support the *request_uri* parameter in accordance with **[[RFC9126]](#nref-RFC9126)**.
1.	**SHALL** request a user identifier that can uniquely identify the customer and that is already known by the customer in the redirected page.
1.	**SHALL NOT** request that the customer enter an existing password in the redirected page.
1.	**SHOULD** implement additional controls to minimise the risk of enumeration attacks via the redirect page.

#### 4.1.2. Data Recipient Software Products

1. **SHOULD** record the following information each time an authorisation flow is executed: username (consumer's ID at the Data Recipient Software Product), timestamp, IP, consent scopes and duration, and correlation identifiers (including *x-fapi-interaction-id*, *x-cds-authorisation-attempt-id* and *x-cds-authorisation-intent-id*).

```diff
Removed 'OIDC Hybrid Flow' section
```

### 4.2. Authorization Code Flow

```diff
Updated Authorization Code Flow section
```

#### 4.2.1. Data Holders
1. **MAY** advertise they do not support authorisation response encryption: either by omitting these values from their OpenID Provider Metadata, or by presenting an empty array for the unsupported parameters.
1. **SHALL NOT** perform authorisation response encryption if *authorization_encrypted_response_alg* is omitted from a client registration request.
1. **SHALL** use `PS256` as the default signing algorithm if *authorization_signed_response_alg* is omitted from a client registration request.

#### 4.2.2. Data Recipient Software Products
1. **SHALL** request authorisation response signing using one of the *authorization_signing_alg_values_supported* values offered by the Data Holder.
1. **MAY** request response encryption using one of the advertised encryption sets.
1. **MAY** request no response encryption by omitting *authorization_encrypted_response_alg* in their client registration.

Additional requirements and guidelines for the authentication flows are contained in the [Consumer Experience](#consumer-experience) section.

<h3 id="authentication-flows_redirect-to-app">4.3. Redirect to App</h3>

```diff
Applied numbering and reformatted Redirect to App section
```

#### 4.3.1. Data Holders

Data holders **SHALL** support Redirect to App in accordance with the [Authentication Schedule](#authentication-schedule), and:

1. **SHALL** use a single issuer identifier per app.
1. **SHALL** only support Authorization Code Flow for Redirect to App authentication.
1. **SHALL** support Claimed "https" Scheme URI redirection in accordance with [section 7.2](https://datatracker.ietf.org/doc/html/rfc8252#section-7.2) and [section 8](https://datatracker.ietf.org/doc/html/rfc8252#section-8) of [**[RFC8252]**](#nref-RFC8252).
1. After authentication, **SHALL** continue the authorisation flow within the data holder app.

#### 4.3.2. Data Recipients

Data recipients **SHALL** support Redirect to App in accordance with the [Authentication Schedule](#authentication-schedule), and:

1. **SHALL** register separate Redirect URIs where they provide both app-based and web-based redirection.
1. If data recipients initiate consent from an app, they **SHALL** support Claimed "https" Scheme URI redirection in accordance with [section 7.2](https://datatracker.ietf.org/doc/html/rfc8252#section-7.2) and [section 8](https://datatracker.ietf.org/doc/html/rfc8252#section-8) of [**[RFC8252]**](#nref-RFC8252) for their app Redirect URI.

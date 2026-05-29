## 18. Request Object

```diff
Updated Request Object section to reference FAPI 2.0 and added details for passing sharing_duration and cdr_arrangement_id via Rich Authorization Requests (RAR)

Updated Non-Normative example
- "aud": "https://adr.example.com",
+ "aud": "https://tls.dh.example.com",
```

> Non-Normative Example  

```
## Decoded Request Object JWT
{
  "iss": "{ClientId}",
  "exp": 1680832800,
  "nbf": 1680829200,
  "aud": "https://tls.dh.example.com",
  "response_type": "code",
  "response_mode": "jwt",
  "client_id": "{ClientId}",
  "redirect_uri": "https://adr.example.com/redirects/redirect1",
  "scope": "openid profile bank:accounts.basic:read bank:accounts.detail:read",
  "nonce": "n-0S6_WzA2Mj",
  "state": "af0ifjsldkj",
  "claims": {
    "sharing_duration": 7776000,
    "cdr_arrangement_id": "02e7c9d9-cfe7-4c3e-8f64-e91173c84ecb",
    "id_token": {
      "acr": {
        "essential": true,
        "values": ["urn:cds.au:cdr:3"]
      }
    },
    "userinfo": {
      "given_name": null,
      "family_name": null
    }
  },
  "code_challenge": "ZTA2ZmFkYjUyMjA2NDNhZGVkYzE1M2I5OTYzZDAxNGI2NWNiZjAxMzVhNDlmMTk2NTlmZWE0OWVhOTQxZjhmZg==",
  "code_challenge_method": "S256"
}
```

The Request Object is a signed and encoded JWT specified in [section 6.1](https://openid.net/specs/openid-connect-core-1_0.html#RequestObject) of **[OIDC]**. The Request Object enables **[OIDC]** requests to be passed in a single and self-contained parameter.

Request Objects **SHALL** be signed by Data Recipient Software Products in accordance with **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)** and **[[JAR]](#nref-JAR)**.

### 18.1. Requesting Sharing Duration
To facilitate the specification of the duration for consent to share CDR data that is approved by the consumer, a mechanism for the Data Recipient Software Product to specify a sharing duration to the Data Holder is required.

To accomplish this, the Data Holder **SHALL** support an additional claim in the authorisation request object named *sharing_duration*. The *sharing_duration* claim **SHALL** be handled as follows:

1. Method of delivery:
   1. If the Data Holder and Data Recipient Software Product support Rich Authorization Requests (RAR), the *sharing_duration* **SHALL** be presented as a property of the *authorization_details* object associated with the `"cdr-data-sharing"` *type*.
   1. If RAR is not supported, the *sharing_duration* **SHALL** be presented as an essential claim in the authorisation request.
1. The *sharing_duration* parameter is a number.
1. The value of the *sharing_duration* parameter will contain the requested duration for sharing, in seconds.
1. If the *sharing_duration* value exceeds one year then a duration of one year will be assumed.
1. If the *sharing_duration* value is less than or equal to 24 hours, then one-time collection will be assumed, and a Refresh Token **SHOULD** be provided by the Data Holder.
1. If the *sharing_duration* value is zero or absent then once off access will be assumed and only an Access Token (without a Refresh Token) will be provided on successful authorisation.
1. If a Refresh Token is issued for one-time collection the Data Recipient Software Product **SHALL** call the Data Holder’s revocation endpoint after successful collection of the CDR data.
1. If the *sharing_duration* value is negative then the authorisation **SHOULD** fail.

Note that the period of "one year" in the above statements **SHOULD** be interpreted as 365, 24 hour days (or 31,536,000 seconds).

The Data Recipient Software Product is able to obtain the expiration of the sharing arrangement by presenting a refresh token to the token introspection endpoint. The expiration value is provided in the _exp_ field in the response.

### 18.2. Specifying an existing arrangement

```diff
Updated reference to Amending Consent CX standard
```

To facilitate the amending of an existing arrangement, the following statements apply:

1. Method of delivery:
   1. If the Data Holder and Data Recipient Software Product support Rich Authorization Requests (RAR), the *cdr_arrangement_id* **SHALL** be presented as a property of the *authorization_details* object associated with the `"cdr-data-sharing"` *type* and `"amend"` action.
   1. If RAR is not supported, the *cdr_arrangement_id* **SHALL** be presented as an essential claim in the authorisation request.
1. The Data Recipient Software Product **SHALL** provide the _cdr_arrangement_id_ claim in the Request Object if requesting to amend a current authorisation in accordance with [Amending Consent: Amendment of Collection Consents and Authorisations](#consumer-experience_amending-consent-standards).
1. Data Holders **SHALL** treat the request under the [Amending Authorisation Standards](#amending-authorisation-standards) if the _cdr_arrangement_id_ claim is provided.

If a Data Recipient Software Product provides the _cdr_arrangement_id_ claim in the request object to the Data Holder's [PAR endpoint](#19-9-pushed-authorisation-endpoint), the Data Holder **SHALL** revoke any existing tokens related to the arrangement once the new consent is successfully established and a new set of tokens has been provided to the Data Recipient Software Product.

### 18.3. Request Object Submission

```diff
Updated redundant statement
- Request Object references SHALL NOT be supported in any mode of use other than [PAR]. If a Data Holder does not support [PAR], it SHALL NOT support Request Object references.
+ Request Object references SHALL NOT be supported in any mode of use other than [PAR].
```

In addition:

1. Request Object references **SHALL NOT** be supported in any mode of use other than **[[PAR]](#nref-PAR)**.
1. The Request URI is intended to be a single-use reference to the respective request object.
1. The Request URI **SHALL** expire between 10 seconds and 90 seconds.
1. Data Recipient Software Products **MAY** provide an existing _cdr_arrangement_id_ claim in an authorisation request object to establish a new consent under an existing arrangement.
1. Data Holders **SHALL** revoke existing refresh tokens and access tokens when a _cdr_arrangement_id_ is provided in the Request Object but only after successful authorisation.
1. If the _cdr_arrangement_id_ is not related to the consumer being authenticated it **SHALL** be rejected.
1. If the _cdr_arrangement_id_ is not recognised by the Data Holder it **SHALL** be rejected.

<h4 id="security-profile_request-object_data-holders">18.4. Data Holders</h4>

```diff
Updated Data Holder requirement to reference FAPI 2.0
- S256 as the code challenge method in accordance with [FAPI-1.0-Advanced] section 5.2.2.
+ S256 as the code challenge method in accordance with [FAPI-2.0-Security-Profile] section 5.3.2.

Updated Data Holder requirement to reference FAPI 2.0
- lifetime of no longer than 60 minutes after the nbf claim in accordance with [FAPI-1.0-Advanced] section 5.2.2.
+ lifetime of no longer than 60 minutes after the nbf claim in accordance with [FAPI-2.0-Message-Signing] section 5.3.1.
```

Data Holders **SHALL** support Pushed Authorisation Requests (PAR) via the pushed authorisation endpoint according to **[[PAR]](#nref-PAR)**.

1. Data Holders **SHALL** support **[[RFC9126]](#nref-RFC9126)** (PAR) using **[[PKCE]](#nref-PKCE)** (**[[RFC7636]](#nref-RFC7636)**) with `S256` as the code challenge method in accordance with **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)** [section 5.3.2](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.3.2).
1. Data Holders **SHALL** require PAR for authorisation request data in accordance with **[[RFC9126]](#nref-RFC9126)** where *require_pushed_authorization_requests* parameter is set to `true`.
1. Data Holders **SHALL** require the request object to contain an _exp_ claim that has a lifetime of no longer than 60 minutes after the _nbf_ claim in accordance with **[[FAPI-2.0-Message-Signing]](#nref-FAPI-2-0-Message-Signing)** [section 5.3.1](https://openid.net/specs/fapi-message-signing-2_0.html#section-5.3.1).
1. Authorisation request data **SHALL** only be accepted using PAR.
1. Data Holders **SHALL** reject authorisation requests containing the _request_ parameter.
1. Data Holders **SHALL** reject the reuse of *request_uri* values.

<h4 id="security-profile_request-object_data-recipient-software-products">18.5. Data Recipient Software Products</h4>

```diff
Updated Data Recipient requirement to reference FAPI 2.0
- and use [PKCE] ([RFC7636]) in accordance with [FAPI-1.0-Advanced].
+ and use [PKCE] ([RFC7636]) in accordance with [FAPI-2.0-Security-Profile] section 5.3.3.2.
```

1. Data Recipient Software Products **SHALL** send request objects containing an _nbf_ claim and an _exp_ claim that has a lifetime of no longer than 60 minutes after the _nbf_ claim.
1. Data Recipient Software Products **SHALL** only use a *request_uri* value once.
1. Data Recipients **SHALL** only send authorisation request data using **[[RFC9126]](#nref-RFC9126)** (PAR) and use **[[PKCE]](#nref-PKCE)** (**[[RFC7636]](#nref-RFC7636)**) in accordance with **[[FAPI-2.0-Security-Profile]](#nref-FAPI-2-0-Security-Profile)** [section 5.3.3.2](https://openid.net/specs/fapi-security-profile-2_0-final.html#section-5.3.3.2).
1. Data Recipients Software Products **SHALL** support **[[PKCE]](#nref-PKCE)** (**[[RFC7636]](#nref-RFC7636)**) and **SHALL** use `S256` as the code challenge method.

<h4 id="security-profile_request-object_rar">18.6. Rich Authorization Requests (RAR)</h4>

```diff
Added detail for RAR
+ Rich Authorization Requests (RAR)
```

> Non-Normative Example using RAR  

```
## Decoded Request Object JWT with RAR authorization_details
{
  "iss": "{ClientId}",
  "exp": 1680832800,
  "nbf": 1680829200,
  "aud": "https://tls.dh.example.com",
  "response_type": "code",
  "response_mode": "jwt",
  "client_id": "{ClientId}",
  "redirect_uri": "https://adr.example.com/redirects/redirect1",
  "scope": "openid profile bank:accounts.basic:read bank:accounts.detail:read",
  "nonce": "n-0S6_WzA2Mj",
  "state": "af0ifjsldkj",
  "authorization_details": [
    {
      "type": "cdr-data-sharing",
      "version": 1,
      "actions": [
        "amend"
      ],
      "sharing_duration": 7776000,
      "cdr_arrangement_id": "02e7c9d9-cfe7-4c3e-8f64-e91173c84ecb"
    }
  ],
  "claims": {
    "id_token": {
      "acr": {
        "essential": true,
        "values": ["urn:cds.au:cdr:3"]
      }
    },
    "userinfo": {
      "given_name": null,
      "family_name": null
    }
  },
  "code_challenge": "ZTA2ZmFkYjUyMjA2NDNhZGVkYzE1M2I5OTYzZDAxNGI2NWNiZjAxMzVhNDlmMTk2NTlmZWE0OWVhOTQxZjhmZg==",
  "code_challenge_method": "S256"
}
```

1. Data Holders **MAY** advertise their support for Rich Authorization Requests (**[[RAR]](#nref-RAR)**) via their discovery metadata document (**[[OIDD]](#nref-OIDD)**) by specifying `"cdr-data-sharing"` in their array of *authorization_details_types_supported*.
1. Where support is indicated by a Data Holder, Data Recipients **SHOULD** send request objects according to **[[RAR]](#nref-RAR)** with the following *authorization_details* properties: 
   - *type*: `"cdr-data-sharing"`
   - *version*: `1`
   - *actions*: `["initiate"]` or `["amend"]` as applicable
   - *sharing_duration*: (with the value as per [Requesting Sharing Duration](#18-1-requesting-sharing-duration))
   - *cdr_arrangement_id*: (used in conjunction with the `"amend"` action, with the value as per [Specifying an existing arrangement](#18-2-specifying-an-existing-arrangement)).
1. Where supported, Data Holders **SHALL** treat these values according to existing non-RAR requirements for initiating and amending authorisations.
1. Authorisation request errors related to RAR details are identified by the error `"invalid_authorization_details"`.

> Non-Normative Example of error related to RAR  

```
{
  "error": "invalid_authorization_details",
  "error_description": "Authorization details incompatible or not supported."
}
```

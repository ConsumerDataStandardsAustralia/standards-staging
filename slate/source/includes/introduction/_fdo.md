## Future Dated Obligations

```diff
Removed past FDOs
- Get Generic Plan Detail
- Get Energy Account Detail
- Transaction Security Ciphers
- Get Metrics v5
- Tokens -> Refresh Tokens
- Authentication Flows
- Amending consent: Changing attributes
- CDR Receipts
- 90-day notifications
- Get Product Detail v5
- Get Transaction Detail v2

Added FDOs for May 2027
+ Communications Protocol
+ Client Authentication
+ HTTP Headers
+ Resource endpoint version increment
+ Shared Responsibility > Energy > Endpoint Variations
+ Fallback Authentication Flows
+ Redirect to Web
+ One Time Password Credential Requirements
+ Common Authentication Standards
```

The standards, as published from time to time, may include specific statements indicating that a specific section of the standards will not take effect until a future date or may cease to have effect on some future date. 

The table below highlights these areas of the standards.

|Section|Description|Applicable Date|
|-------|-----------|---------------|
|[Get Service Points v2](#cdr-energy-api_get-service-points)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 10th 2025**</li><li>Data Holders **MAY** retire v1 of this endpoint from **March 16th 2026**</li></ul> | November 10th 2025 |
|[Get Service Point Detail v2](#cdr-energy-api_get-service-point-detail)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 10th 2025**</li><li>Data Holders **MAY** retire v1 of this endpoint from **March 16th 2026**</li></ul> | November 10th 2025 |
|[Get Service Points (SR) v2](#cdr-energy-secondary-data-holder-api_get-service-points-sr)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 10th 2025**</li><li>Data Holders **MAY** retire v1 of this endpoint from **March 16th 2026**</li></ul> | November 10th 2025 |
|[Get Service Point Detail (SR) v2](#cdr-energy-secondary-data-holder-api_get-service-point-detail-sr)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 10th 2025**</li><li>Data Holders **MAY** retire v1 of this endpoint from **March 16th 2026**</li></ul> | November 10th 2025 |
|[Shared Responsibility -> Energy -> Additional Requirements](#additional-requirements)| Energy data holders **MUST** support additional requirements for sharing electricity usage data according to the Last Consumer Change Date (LCCD) by **November 10th 2025** | November 10th 2025 |
|[JARM encryption requirements](#4-authentication-flows)| From **November 10th 2025**, Data Holders **SHALL NOT** perform authorization response encryption unless requested by the ADR | November 10th 2025 |
|[Get Products v4](#cdr-banking-api_get-products)|<ul><li>Data Holders **MUST** implement v4 of this endpoint by **March 16th 2026**</li><li>Data Holders **MAY** retire v3 of this endpoint from **May 11th 2026**</li></ul> | March 16th 2026 |
|[Get Product Detail v6](#cdr-banking-api_get-product-detail)|<ul><li>Data Holders **MUST** implement v6 of this endpoint by **March 16th 2026**</li><li>Data Holders **MAY** retire v5 of this endpoint from **May 11th 2026**</li></ul> | March 16th 2026 |
|[Get Account Detail v4](#cdr-banking-api_get-account-detail)|<ul><li>Data Holders **MUST** implement v4 of this endpoint by **March 16th 2026**</li><li>Data Holders **MAY** retire v3 of this endpoint from **May 11th 2026**</li></ul> | March 16th 2026 |
|[Get Products v5](#cdr-banking-api_get-products)|<ul><li>Data Holders **MUST** implement v5 of this endpoint by **July 13th 2026**</li><li>Data Holders **MAY** retire v4 of this endpoint from **August 10th 2026**</li></ul> | July 13th 2026 |
|[Get Product Detail v7](#cdr-banking-api_get-product-detail)|<ul><li>Data Holders **MUST** implement v7 of this endpoint by **July 13th 2026**</li><li>Data Holders **MAY** retire v6 of this endpoint from **August 10th 2026**</li></ul> | July 13th 2026 |
|[Get Accounts v3](#cdr-banking-api_get-accounts)|<ul><li>Data Holders **MUST** implement v3 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v2 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Account Detail v5](#cdr-banking-api_get-account-detail)|<ul><li>Data Holders **MUST** implement v5 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v4 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Bulk Balances v2](#cdr-banking-api_get-bulk-balances)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v1 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Bulk Direct Debits v2](#cdr-banking-api_get-bulk-direct-debits)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v1 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Scheduled Payments Bulk v3](#cdr-banking-api_get-scheduled-payments-bulk)|<ul><li>Data Holders **MUST** implement v3 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v2 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Transactions for Account v2](#cdr-banking-api_get-transactions-for-account)|<ul><li>Data Holders **MUST** implement v2 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v1 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Transaction Detail v3](#cdr-banking-api_get-transaction-detail)|<ul><li>Data Holders **MUST** implement v3 of this endpoint by **November 9th 2026**</li><li>Data Holders **MAY** retire v2 of this endpoint from **December 7th 2026**</li></ul> | November 9th 2026 |
|[Get Instalment Plans for Account v1](#cdr-banking-api_get-instalment-plans-for-account)|<ul><li>Data Holders **MUST** implement v1 of this endpoint by **November 9th 2026**</li></ul> | November 9th 2026 |
|[Get Instalment Plans Bulk v1](#cdr-banking-api_get-instalment-plans-bulk)|<ul><li>Data Holders **MUST** implement v1 of this endpoint by **November 9th 2026**</li></ul> | November 9th 2026 |
|[Redirect to App](#redirect-to-app)| Data Holders and Data Recipients **MUST** implement these standards on and from **May 10th 2027**. | May 10th 2027 |
|[Authentication Flows](#4-authentication-flows)| Data Holders and Data Recipients **MUST** implement these standards on and from **May 10th 2027**. | May 10th 2027 |
|[Communications Protocol](#3-communications-protocol) |Data Holders and Data Recipients **MUST** comply with section 3 [Communications Protocol](#3-communications-protocol) on and from **30 April 2028.**| 30 April 2028 |
|[Client Authentication](#5-client-authentication) | <p> When using private key JWT authentication, the Data Holder and any Data Recipient **MUST** comply with section 5.1 [Private Key JWT Client Authentication](#5-1-private-key-jwt-client-authentication) on and from **30 April 2028.**</p>For this purpose: <ul><li>Clients **MUST** specify the *aud* claim as the Data Holder *issuer* value as a string in accordance with Private Key JWT Client Authentication.</li><li>Data Holders **MUST** verify the *aud* claim is their *issuer* value in accordance with section 5.1. If a Data Holder does not already verify clients in accordance with these requirements, they **MUST NOT** apply the restriction prior to **30 April 2028**.</li></ul> | 30 April 2028 |
|[HTTP Headers](#http-headers) | <ul><li>Data Recipients **SHOULD** continue to send the *x-fapi-customer-ip-address* header in accordance with its specification in any corresponding version requests, including where a range is requested, to ensure customer presence is interpreted correctly.</li><li>Data Holders **MUST** support the *x-fapi-interaction-id* header at the PAR and Token endpoints (see [HTTP Headers](#http-headers) and [Request and Response Correlation](#3-2-request-and-response-correlation)) on and from **30 April 2028**.</li> <li>Data Recipients **MAY** set the *x-fapi-interaction-id* header at the PAR and Token endpoints to assist in traceability (see [HTTP Headers](#http-headers) and [Request and Response Correlation](#3-2-request-and-response-correlation)) on and from **30 April 2028**.</li>| 30 April 2028 |
|[Resource endpoint version increment](#endpoint-version-schedule) | <ul><li>Data Holders **MUST** support applicable resource endpoint versions which have been incremented to specify the *x-fapi-end-user-present* request header on and from **30 April 2028**.</li><li>Data Holders **MAY** retire deprecated versions on and from **31 May 2028**.</li><li>Data Holders **MUST** refer to the *x-fapi-end-user-present* header to determine customer presence for NFR purposes from **30 April 2028**.</li></ul> | 30 April 2028 |
|[Shared Responsibility > Energy > Endpoint&nbsp;Variations](#endpoint-variations) | Energy Data Holders **MUST** align to updated Secondary DH API header requirements on and from **30 April 2028**. | 30 April 2028 |
|[Fallback Authentication](#fallback-authentication-flows)| Data holders implementing Redirect to App **MUST** support the 'Redirect to Web' flow on and from **30 April 2028**. | 30 April 2028 |
|[Redirect to Web](#redirect-to-web)| Data holders and data recipients **MUST** implement these standards on and from **30 April 2028**. | 30 April 2028 |
|[One Time Password Credential Requirements](#14-3-one-time-password-credential-requirements)| Data holders **SHALL** implement these standards on and from **30 April 2028**. | 30 April 2028 |
|[Common Authentication Standards](#consumer-experience_common-authentication-standards)| Data holders **MUST** implement the following standards on and from **30 April 2028**: Digital onboarding; Accessible authentication; Error messaging and redirection and Unique identifier. | 30 April 2028 |
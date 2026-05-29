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
+ Adoption of FAPI 2.0
+ Communications Protocol
+ Client Authentication
+ HTTP Headers
+ Resource endpoint version increment
+ Shared Responsibility > Energy > Endpoint Variations
```

The standards, as published from time to time, may include specific statements indicating that a specific section of the standards will not take effect until a future date or may cease to have effect on some future date. 

Please also refer to the [Obligation Date Schedule](includes/endpoint-version-schedule/#obligation-date-schedule) which summarises obligation milestones.

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
|[Redirect to App](#redirect-to-app)| Data holders and data recipients **MUST** implement these standards on and from **May 10th 2027**. | May 10th 2027 |
|[Authentication Flows](#4-authentication-flows)| Data holders and data recipients **MUST** implement these standards on and from **May 10th 2027**. | May 10th 2027 |
|[Adoption of FAPI 2.0](#security-profile) | Comply with FAPI 2.0 requirements that have changed from FAPI 1.0, including, but not limited to:<ul><li>Redirect status codes.</li><li>Tokens must have at least 128 bits of entropy.</li><li>Adhere to RFC8725 when creating or processing JWTs.</li><li>Adhere to BCP195 for supported cipher suites.</li></ul> | May 10th 2027 |
|[Communications Protocol](#3-communications-protocol) | <ul><li>Data Recipients **SHALL** call MTLS endpoints as defined in *mtls_endpoint_aliases* in a Data Holder OIDD.</li><li>Data Holders **SHALL** support *mtls_endpoint_aliases* in their OIDD according to the Communications Protocol.</li><li>Data Recipients and Data Holders **SHALL** adhere to requirements for [Correlation Identifiers](#3-2-correlation-identifiers) and header logging.</li></ul> | May 10th 2027 |
|[Client Authentication](#5-client-authentication) | <ul><li>Clients **SHALL** specify the *aud* claim as the Data Holder *issuer* value in accordance with Private Key JWT Client Authentication.</li><li>Data Holders **SHALL** verify the *aud* claim is their *issuer* value in accordance with Private Key JWT Client Authentication. If a Data Holder does not already verify clients in accordance with these requirements, they **SHALL NOT** apply the restriction prior to **May 10th 2027**.</li></ul> | May 10th 2027 |
|[HTTP Headers](#http-headers) | <ul><li>Data Recipients **SHOULD** continue to send the *x-fapi-customer-ip-address* header in accordance with its specification in any corresponding version requests, including where a range is requested, to ensure customer presence is interpreted correctly.</li><li>Data Holders and Data Recipients **SHALL** support *x-cds-authorisation-attempt-id* and *x-cds-authorisation-intent-id* headers as [Correlation Identifiers](#3-2-correlation-identifiers) from **May 10th 2027**.</li></ul> | May 10th 2027 |
|[Resource endpoint version increment](#endpoint-version-schedule) | <ul><li>Data Holders **SHALL** support applicable resource endpoint versions which have been incremented to specify the *x-fapi-end-user-present* request header from **May 10th 2027**.</li><li>Data Holders **MAY** retire deprecated versions from **June 14th 2027**.</li><li>Data Holders **SHALL** refer to the *x-fapi-end-user-present* header to determine customer presence for NFR purposes from **May 10th 2027**.</li></ul> | May 10th 2027 |
|[Shared Responsibility > Energy > Endpoint&nbsp;Variations](#endpoint-variations) | Energy Data Holders **SHALL** align to updated Secondary DH API header requirements from **May 10th 2027**. | May 10th 2027 |

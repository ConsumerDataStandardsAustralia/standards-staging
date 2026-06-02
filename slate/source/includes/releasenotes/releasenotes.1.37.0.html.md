---
title: CDR Data Standards - v1.37.0 Release Notes

#language_tabs: # must be one of https://git.io/vQNgJ

toc_footers:
  - <a href='../../'>CDR Data Standards</a>

includes:
  - footer

search: false
---

# V1.37.0 Release Notes
Release notes for version **1.37.0** of the [CDR Data Standards](../../).

## Changes Made
### Change Requests

This release addresses the following minor defects raised on [Standards Staging](https://github.com/ConsumerDataStandardsAustralia/standards-staging/issues):

- [Standards Staging #493 - Standards staging fixes](https://github.com/ConsumerDataStandardsAustralia/standards-staging/issues/493)

This release addresses the following change requests raised on [Standards Maintenance](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues):

- None


### Decisions
This release addresses the following Decisions published on [Standards](https://github.com/ConsumerDataStandardsAustralia/standards/issues):

- [Consultation Draft #210 - Transition to FAPI 2.0 Profile](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210)
- [Consultation Draft #374 - Minimum Baseline Authentication](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374)


## General Changes
|Change|Description|Link|
|------|-----------|----|
| Standards staging fixes | [**Standards Staging #493**](https://github.com/ConsumerDataStandardsAustralia/standards-staging/issues/493): Minor updates to the standards development codebase. | 


## Introduction
|Change|Description|Link|
|------|-----------|----|
| Updated Chair detail | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Added Dr Scott Farrell as the new Data Standards Chair. | [Data Standards Chair](../../?diff#data-standards-chair)
| Updated FDOs | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Removed past FDOs and added new FDOs for:<ul><li>Adoption of FAPI 2.0<li>Communications Protocol<li>Client Authentication<li>HTTP Headers<li>Resource endpoint version increment<li>Shared Responsibility > Energy > Endpoint Variations.</ul> | [Future Dated Obligations](../../?diff#future-dated-obligations)
| Normative References | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated Normative References, including titles, descriptions and links to reflect current locations and details. Replaced FAPI 1.0 references with FAPI 2.0. | [Normative References](../../?diff#normative-references)
| Informative References | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated Informative References, including descriptions and links to reflect current locations and details. Added **[OpenID-Certification]**. | [Informative References](../../?diff#informative-references)
| Updated FDOs | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added new FDOs for new Redirect to Web, One Time Password Credential Requirements, and Restricted Credentials sections, the updated Pushed Authorisation Request endpoint, the new Get Configuration endpoint, and updated Get Metrics endpoint. | [Future Dated Obligations](../../?diff#future-dated-obligations)


## High Level Standards
|Change|Description|Link|
|------|-----------|----|
| FAPI and Correlation headers | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): <ul><li>Updated Request Headers:<ul><li>removed *x-fapi-auth-date* and *x-fapi-customer-ip-address*,</li><li>added *x-fapi-end-user-present*, *x-cds-authorisation-attempt-id*, *x-cds-authorisation-intent-id*.</li></ul></li><li>Updated Response Headers:<ul><li>added *x-cds-authorisation-attempt-id*, *x-cds-authorisation-intent-id*.</li></ul></li></ul> | [HTTP Headers](../../?diff#http-headers)
| Updated HTTP Headers | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added *x-cds-originating-channel* header for PAR requests. | [HTTP Headers](../../?diff#http-headers)


## Authentication Schedule
|Change|Description|Link|
|------|-----------|----|
| Added Redirect to Web section | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added Redirect to Web section. | [Redirect to Web](../../?diff#redirect-to-web)
| Updated wording | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Minor update to wording in the Fallback Authentication Flows section to align to Redirect to Web. | [Fallback Authentication Flows](../../?diff#fallback-authentication-flows)


## Consumer Experience
|Change|Description|Link|
|------|-----------|----|
| Clarification of Consent Standards | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Removed row: "Consent: Amendment of Collection Consents and Authorisations". | [Consent Standards](../../?diff#consumer-experience_consent-standards)
| Clarification of Amending Consent Standards | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Added row: "Amending Consent: Amendment of Collection Consents and Authorisations". | [Amending Consent Standards](../../?diff#consumer-experience_amending-consent-standards)
| Clarification of Amending Authorisation Standards | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Minor updates to add introductory text and clarify area titles for consistency. | [Amending Authorisation Standards](../../?diff#amending-authorisation-standards)
| Authentication Standards additions | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): In the Common Authentication Standards table; renamed the 'App install' row to 'Digital onboarding' with additional detail, added new rows for accessibility, error messaging, and unique identifier. | [Common Authentication Standards](../../?diff#consumer-experience_common-authentication-standards)


## Security Profile
|Change|Description|Link|
|------|-----------|----|
| General changes | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): <ul><li>Applied section numbering for reference throughout the Security Profile section<li>Replaced FAPI 1.0 references with FAPI 2.0<li>Removed past FDOs<li>Removed deprecated hybrid flow details<li>Updated Authorization Code Flow section<li>Updated Private Key JWT Client Authentication section<li>Updated Self-signed JWT Client Authentication section<li>Updated Software Statement Assertion (SSA) section for clarity<li>Updated Normative reference link in Scopes and Claims section<li>Updated Tokens section to remove past FDOs and references to hybrid flow and FAPI 1.0<li>Updated Request Object section to reflect removal of hybrid flow, addition of FAPI 2.0, updated Non-Normative examples, references to updated CX documentation<li>Updated Security Endpoints section.</ul> | [Security Profile](../../?diff#security-profile)
| Added section | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Added Communications Protocol section. | [Communications Protocol](../../?diff#3-communications-protocol)
| Non-normative Examples | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated Non-normative Examples for fields: *iss*, *issuer*, *aud*, *sub*, *client_id*. | [Security Profile](../../?examples#security-profile)
| RAR support | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Added detail for the optional support of Rich Authorization Requests (RAR) in applicable sections. | [Security Profile](../../?examples#security-profile)
| Update to Baseline Credential Requirements | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated data holder requirements to expect a risk assessment to determine appropriate authentication levels. | [Credential Requirements](../../?diff#credential-requirements)
| Updates to OTPs | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated One Time Password Credential Requirements section to increase OTP length requirement to 6-10 digits. Changed OTP algorithm requirement from SHOULD to SHALL. Added detail to state that OTPs SHALL be delivered to a channel that has been pre-registered and currently elected to receive authentication secrets. | [Credential Requirements](../../?diff#credential-requirements)
| Updates to Restricted Credentials | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated Restricted Credentials section to discourage SMS and email as OTP delivery mechanisms. | [Credential Requirements](../../?diff#credential-requirements)
| Updated PAR request headers | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated Pushed Authorisation endpoint to include mandatory *x-cds-originating-channel* header for PAR requests. | [Pushed Authorisation endpoint](../../?diff#pushed-authorisation-endpoint)


## DCR APIs
|Change|Description|Link|
|------|-----------|----|
| General changes | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated Non-Normative example, removed details related to deprecated hybrid flow options and prior optionality of PAR. | [DCR APIs](../../?diff#dcr-apis)


## Register APIs
None


## Authorisation Scopes
None

## Non-functional Requirements
|Change|Description|Link|
|------|-----------|----|
| Updated Definitions | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated 'Customer Present' definition by replacing *x-fapi-customer-ip-address* header with *x-fapi-end-user-present*. | [Definitions](../../?diff#definitions)


## Banking APIs
|Change|Description|Link|
|------|-----------|----|
| Updated Parameters | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated endpoint Parameters tables to remove *x-fapi-auth-date* and replace *x-fapi-customer-ip-address* with *x-fapi-end-user-present*. Incremented all affected endpoints. | [Banking APIs](../../?diff#banking-apis)


## Energy APIs
|Change|Description|Link|
|------|-----------|----|
| Updated Parameters | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated endpoint Parameters tables to remove *x-fapi-auth-date* and replace *x-fapi-customer-ip-address* with *x-fapi-end-user-present*. Incremented all affected endpoints. | [Energy APIs](../../?diff#energy-apis)


## Common APIs
|Change|Description|Link|
|------|-----------|----|
| Updated Parameters | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Updated endpoint Parameters tables to remove *x-fapi-auth-date* and replace *x-fapi-customer-ip-address* with *x-fapi-end-user-present*. Incremented all affected endpoints. | [Common APIs](../../?diff#common-apis)
| Added Get Configuration endpoint | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added Get Configuration endpoint to support discovery of authentication level requirements. | [Common APIs](../../?diff#common-apis)


## Admin APIs
|Change|Description|Link|
|------|-----------|----|
| Updated Get Metrics | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated the Get Metrics endpoint to v6 to support authentication metrics. | [Admin APIs](../../?diff#admin-apis)


## Shared Responsibility
|Change|Description|Link|
|------|-----------|----|
| Updated header detail | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Removed references to deprecated headers *x-fapi-auth-date* and *x-fapi-customer-ip-address* in the Endpoint Variations section.<br>Added requirement for *x-fapi-end-user-present* to be forwarded to AEMO to support NFRs. | [Endpoint Variations](../../?diff#endpoint-variations)


## Energy Secondary DH APIs
|Change|Description|Link|
|------|-----------|----|
| Updated endpoint parameters | [**Decision #210**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/210): Added *x-fapi-end-user-present* header to Energy Secondary DH APIs to support NFRs. Incremented all affected endpoints. | [Energy Secondary DH APIs](../../?diff#energy-secondary-dh-apis)


## Additional Standards
None

## Known Issues
None

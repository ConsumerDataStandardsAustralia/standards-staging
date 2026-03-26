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

- [Standards Maintenance #XXX - Title](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/XXX)


### Decisions
This release addresses the following Decisions published on [Standards](https://github.com/ConsumerDataStandardsAustralia/standards/issues):

- [Consultation Draft #374 - Minimum Baseline Authentication](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374)


## General Changes
|Change|Description|Link|
|------|-----------|----|
| Standards staging fixes | [**Standards Staging #493**](https://github.com/ConsumerDataStandardsAustralia/standards-staging/issues/493): Minor updates to the standards development codebase. | 


## Introduction
|Change|Description|Link|
|------|-----------|----|
| Updated FDOs | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added new FDOs for new Redirect to Web, One Time Password Credential Requirements, and Restricted Credentials sections, the updated Pushed Authorisation Request endpoint, the new Get Configuration endpoint, and updated Get Metrics endpoint. | [Future Dated Obligations](../../?diff#future-dated-obligations)


## High Level Standards
|Change|Description|Link|
|------|-----------|----|
| Updated HTTP Headers | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added *x-cds-originating-channel* header for PAR requests. | [HTTP Headers](../../?diff#http-headers)


## Authentication Schedule
|Change|Description|Link|
|------|-----------|----|
| Added Redirect to Web section | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added Redirect to Web section. | [Redirect to Web](../../?diff#redirect-to-web)
| Updated wording | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Minor update to wording in the Fallback Authentication Flows section to align to Redirect to Web. | [Fallback Authentication Flows](../../?diff#fallback-authentication-flows)


## Consumer Experience
|Change|Description|Link|
|------|-----------|----|
| Authentication Standards additions | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): In the Common Authentication Standards table; renamed the 'App install' row to 'Digital onboarding' with additional detail, added new rows for accessibility, error messaging, and unique identifier. | [Common Authentication Standards](../../?diff#consumer-experience_common-authentication-standards)


## Security Profile
|Change|Description|Link|
|------|-----------|----|
| Update to Baseline Credential Requirements | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated data holder requirements to expect a risk assessment to determine appropriate authentication levels. | [Credential Requirements](../../?diff#credential-requirements)
| Updates to OTPs | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated One Time Password Credential Requirements section to increase OTP length requirement to 6-10 digits. Changed OTP algorithm requirement from SHOULD to SHALL. Added detail to state that OTPs SHALL be delivered to a channel that has been pre-registered and currently elected to receive authentication secrets. | [Credential Requirements](../../?diff#credential-requirements)
| Updates to Restricted Credentials | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated Restricted Credentials section to discourage SMS and email as OTP delivery mechanisms. | [Credential Requirements](../../?diff#credential-requirements)
| Updated PAR request headers | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated Pushed Authorisation endpoint to include mandatory *x-cds-originating-channel* header for PAR requests. | [Pushed Authorisation endpoint](../../?diff#pushed-authorisation-endpoint)


## DCR APIs
|Change|Description|Link|
|------|-----------|----|


## Register APIs
|Change|Description|Link|
|------|-----------|----|


## Authorisation Scopes
|Change|Description|Link|
|------|-----------|----|


## Non-functional Requirements
|Change|Description|Link|
|------|-----------|----|


## Banking APIs
|Change|Description|Link|
|------|-----------|----|


## Energy APIs
|Change|Description|Link|
|------|-----------|----|


## Common APIs
|Change|Description|Link|
|------|-----------|----|
| Added Get Configuration endpoint | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Added Get Configuration endpoint to support discovery of authentication level requirements. | [Common APIs](../../?diff#common-apis)


## Admin APIs
|Change|Description|Link|
|------|-----------|----|
| Updated Get Metrics | [**Decision #374**](https://github.com/ConsumerDataStandardsAustralia/standards/issues/374): Updated the Get Metrics endpoint to v6 to support authentication metrics. | [Admin APIs](../../?diff#admin-apis)


## Shared Responsibility
|Change|Description|Link|
|------|-----------|----|


## Energy Secondary DH APIs
|Change|Description|Link|
|------|-----------|----|


## Additional Standards
|Change|Description|Link|
|------|-----------|----|


## Known Issues
|Change|Description|Link|
|------|-----------|----|

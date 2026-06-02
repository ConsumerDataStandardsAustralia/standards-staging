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

- [Standards Maintenance #443 - SSA definition: Deprecation of revocation_uri](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/443)
- [Standards Maintenance #621 - Add maxLength field sizes to field descriptions for Register APIs and SSA](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/621)
- [Standards Maintenance #635 - Include "Provider number" in GetDataHolderBrands Response](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/635)
- [Standards Maintenance #679 - Update SSA specification](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679)


### Decisions
This release addresses the following Decisions published on [Standards](https://github.com/ConsumerDataStandardsAustralia/standards/issues):

- [Consultation Draft #XXX - Title](https://github.com/ConsumerDataStandardsAustralia/standards/issues/XXX)


## General Changes
|Change|Description|Link|
|------|-----------|----|
| Standards staging fixes | [**Standards Staging #493**](https://github.com/ConsumerDataStandardsAustralia/standards-staging/issues/493): Minor updates to the standards development codebase. | 
| Field maxLength | [**Standards Maintenance #621**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/621): The _maxLength_ of string fields defined in API specifications is appended to field descriptions. | [DCR APIs](../../?diff#dcr-apis)<br>[Register APIs](../../?diff#register-apis)<br>(Change applies to all specifications where a _maxLength_ is defined)


## Introduction
|Change|Description|Link|
|------|-----------|----|
| Added FDO | [**Standards Maintenance #679**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679): Added FDO for supporting updated fields in the SSA and DCR. | [Future Dated Obligations](../../?diff#future-dated-obligations)


## High Level Standards
|Change|Description|Link|
|------|-----------|----|


## Authentication Schedule
|Change|Description|Link|
|------|-----------|----|


## Consumer Experience
|Change|Description|Link|
|------|-----------|----|


## Security Profile
|Change|Description|Link|
|------|-----------|----|
| Update SSA specification | [**Standards Maintenance #679**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679): Moved SSA and DCR details and examples from the Client Registration section to their respective API specifications. | [Client Registration](../../?diff#client-registration)


## DCR APIs
|Change|Description|Link|
|------|-----------|----|
| DCR APIs | [**Standards Maintenance #679**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679): Refined the DCR request and response schemas to better align with the updated Get Software Statement Assertion (SSA) response, including clearer references to the software statement and client metadata fields and their updated optional/mandatory requirements. | [DCR APIs](../../?diff#dcr-apis)


## Register APIs
|Change|Description|Link|
|------|-----------|----|
| Deprecation of revocation_uri | [**Standards Maintenance #443**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/443): Removed the deprecated *revocation_uri* field from the SSA, as part of issue #679. | [Register APIs](../../?diff#register-apis)
| Update SSA specification | [**Standards Maintenance #679**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679): Updated the Get Software Statement Assertion (SSA) response schema and updated optional/mandatory field requirements. Removed the *revocation_uri* and *software_roles* fields, added *ssaVersion*. | [Register APIs](../../?diff#register-apis)
| Added Data Holder fields | [**Standards Maintenance #635**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/635): Added _legalEntityRef_ and _brandRef_ to the Get Data Holder Brands endpoint, and _brandRef_ to the Get Data Holder Brands Summary endpoint. | [Register APIs](../../?diff#register-apis)
| Added Data Recipient fields | [**Standards Maintenance #679**](https://github.com/ConsumerDataStandardsAustralia/standards-maintenance/issues/679): Added _clientUri_, _tosUri_, _policyUri_, _softwareProductRef_, _brandRef_ to the Get Data Recipients endpoint. | [Register APIs](../../?diff#register-apis)


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


## Admin APIs
|Change|Description|Link|
|------|-----------|----|


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

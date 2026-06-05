## 14. Credential Requirements

### 14.1. User Identifiers
If a data holder requests a user identifier for the purposes of identifying the customer during authentication, then the data holder:

1. **MUST** request a user identifier that can uniquely identify the customer.
1. **MUST** request a user identifier that is already known by the customer in the redirected page.

### 14.2. Baseline Credential Requirements

```diff
Added for Baseline Credential Requirements > Data holders: 
+ SHALL conduct a risk assessment to determine the LoA that is appropriate for disclosing consumer data.
```

Data holders:

1. **MUST ONLY** support authenticator types as permitted by the Authentication levels (AL) requirements defined in **[[DigitalID-Accreditation]](#nref-DigitalID-Accreditation)** unless otherwise excluded by the [Restricted Credentials](#14-4-restricted-credentials) requirements.
1. **SHALL** conduct a risk assessment to determine the LoA that is appropriate for disclosing consumer data.
1. **SHOULD** implement [Multi-Factor Authentication](#authentication-schedule) for user access to CDR data containing personal information.

```diff
Updated One Time Password Credential Requirements
- The algorithm for the creation of the OTP is at the discretion of the data holder but SHOULD incorporate a level of pseudo-randomness appropriate for the use case.
+ The data holder SHALL ensure that OTPs are generated using cryptographically secure mechanisms that provide unpredictability, such as CSPRNG or TOTP.
```

### 14.3. One Time Password Credential Requirements

Where a data holder supports an OTP flow:

1. The data holder **MUST** request a user identifier in accordance with [User Identifiers](#14-1-user-identifiers).
1. The data holder **MUST** provide a one-time password (OTP) to the customer through an existing channel or mechanism that the customer can then enter into the redirected page.
1. The delivery mechanism for the OTP is at the discretion of the data holder, but **MUST** align to existing and preferred channels for the customer.
1. The data holder **SHOULD** implement additional controls to minimise the risk of interception of the OTP through the selected delivery mechanism.
1. The provided OTP **MUST** only be used for authentication for CDR based sharing and **MUST NOT** be usable for the authorisation of other transactions or actions.
1. The provided OTP **MUST** be invalidated after a period of time at the discretion of the data holder. This expiry period **SHOULD** facilitate enough time for the customer to reasonably complete the authorisation process.
1. The provided OTP **SHALL** be numeric digits and be between 6 and 10 digits in length. 
1. The data holder **SHALL** ensure that OTPs are generated using cryptographically secure mechanisms that provide unpredictability, such as CSPRNG or TOTP.
1. The data holder **SHALL** deliver OTPs to a channel that has been pre-registered by the end user and is currently elected by them to receive authentication secrets. 

```diff
Updated Restricted Credentials
```

### 14.4. Restricted Credentials
The following credential constraints apply such that Authenticators:

1. **MUST NOT** permit Memorised Secrets defined by **[[DigitalID-Accreditation]](#nref-DigitalID-Accreditation)** to achieve 'LoA 2' (as a single factor of authentication only).
1. **SHOULD NOT** use SMS as the delivery mechanism for OTPs.
1. **SHOULD NOT** use email as the delivery mechanism for OTPs.

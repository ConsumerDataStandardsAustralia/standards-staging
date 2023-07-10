This specification defines the APIs for Data Holders exposing Telecommunications endpoints.

<table>
<tr><td><a href='../../../includes/swagger/cds_telco.json'>Telco OpenAPI Specification (JSON)</a></td></tr>
<tr><td><a href='../../../includes/swagger/cds_telco.yaml'>Telco OpenAPI Specification (YAML)</a></td></tr>
</table>

```diff
Updated description of TelcoPaymentScheduleDigitalWallet.name field
from:
- The name assigned to the digital wallet by the owner of the wallet, else the display name provided by the digital wallet provider
to:
+ The display name of the wallet as given by the customer, else a default value defined by the data holder

Replaced FAPI draft references with FAPI 1.0 Final references.
References pertain to the x-fapi-auth-date header.
```
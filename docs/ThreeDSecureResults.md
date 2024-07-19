# PCPServerSDK::ThreeDSecureResults

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **version** | **String** | 3D Secure Protocol version used during this transaction. | [optional] |
| **scheme_eci** | **String** | 3D Secure ECI (Electronic Commerce Indicator) depending on the Scheme. Returned by DS. | [optional] |
| **applied_exemption** | **String** | Exemption requested and applied in the authorization.  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ThreeDSecureResults.new(
  version: 2.2.0,
  scheme_eci: 5,
  applied_exemption: null
)
```


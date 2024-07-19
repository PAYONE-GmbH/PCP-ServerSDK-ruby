# PCPServerSDK::ApplePaymentDataTokenHeaderInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **transaction_id** | **String** | A hexadecimal Transaction identifier identifier as a string. | [optional] |
| **application_data** | **String** | SHA–256 hash, hex encoded as a string. Hash of the applicationData property of the original PKPaymentRequest object. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ApplePaymentDataTokenHeaderInformation.new(
  transaction_id: null,
  application_data: null
)
```


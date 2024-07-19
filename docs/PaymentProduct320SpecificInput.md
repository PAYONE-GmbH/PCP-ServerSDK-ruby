# PCPServerSDK::PaymentProduct320SpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **network** | **String** |  | [optional] |
| **token** | [**ApplePaymentDataTokenInformation**](ApplePaymentDataTokenInformation.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentProduct320SpecificInput.new(
  network: GIROCARD,
  token: null
)
```


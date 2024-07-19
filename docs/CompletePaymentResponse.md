# PCPServerSDK::CompletePaymentResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **creation_output** | [**PaymentCreationOutput**](PaymentCreationOutput.md) |  | [optional] |
| **merchant_action** | [**MerchantAction**](MerchantAction.md) |  | [optional] |
| **payment** | [**PaymentResponse**](PaymentResponse.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CompletePaymentResponse.new(
  creation_output: null,
  merchant_action: null,
  payment: null
)
```


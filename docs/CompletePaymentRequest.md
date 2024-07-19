# PCPServerSDK::CompletePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **financing_payment_method_specific_input** | [**CompleteFinancingPaymentMethodSpecificInput**](CompleteFinancingPaymentMethodSpecificInput.md) |  | [optional] |
| **order** | [**Order**](Order.md) |  | [optional] |
| **device** | [**CustomerDevice**](CustomerDevice.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CompletePaymentRequest.new(
  financing_payment_method_specific_input: null,
  order: null,
  device: null
)
```


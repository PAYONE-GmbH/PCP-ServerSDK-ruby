# PCPServerSDK::SepaDirectDebitPaymentMethodSpecificOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |
| **payment_product771_specific_output** | [**PaymentProduct771SpecificOutput**](PaymentProduct771SpecificOutput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::SepaDirectDebitPaymentMethodSpecificOutput.new(
  payment_product_id: 840,
  payment_product771_specific_output: null
)
```


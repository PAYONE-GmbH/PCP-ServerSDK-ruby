# PCPServerSDK::SepaDirectDebitPaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product771_specific_input** | [**SepaDirectDebitPaymentProduct771SpecificInput**](SepaDirectDebitPaymentProduct771SpecificInput.md) |  | [optional] |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::SepaDirectDebitPaymentMethodSpecificInput.new(
  payment_product771_specific_input: null,
  payment_product_id: 840
)
```


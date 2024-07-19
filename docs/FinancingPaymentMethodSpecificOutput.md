# PCPServerSDK::FinancingPaymentMethodSpecificOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. Currently supported payment methods * 3390 - PAYONE Secured Invoice * 3391 - PAYONE Secured Installment * 3392 - PAYONE Secured Direct Debit | [optional] |
| **payment_product3391_specific_output** | [**PaymentProduct3391SpecificOutput**](PaymentProduct3391SpecificOutput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::FinancingPaymentMethodSpecificOutput.new(
  payment_product_id: 3390,
  payment_product3391_specific_output: null
)
```


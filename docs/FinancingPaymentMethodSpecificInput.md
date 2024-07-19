# PCPServerSDK::FinancingPaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier - please check product documentation for a full overview of possible values. Currently supported payment methods * 3390 - PAYONE Secured Invoice * 3391 - PAYONE Secured Installment * 3392 - PAYONE Secured Direct Debit | [optional] |
| **requires_approval** | **Boolean** | * true &#x3D; the payment requires approval before the funds will be captured using the Approve payment or Capture payment API * false &#x3D; the payment does not require approval, and the funds will be captured automatically  If the parameter is not provided in the request, the default value will be true | [optional] |
| **payment_product3392_specific_input** | [**PaymentProduct3392SpecificInput**](PaymentProduct3392SpecificInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::FinancingPaymentMethodSpecificInput.new(
  payment_product_id: 3390,
  requires_approval: null,
  payment_product3392_specific_input: null
)
```


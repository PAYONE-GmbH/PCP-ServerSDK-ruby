# PCPServerSDK::CompleteFinancingPaymentMethodSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_product_id** | **Integer** | Payment product identifier. Currently supported payment methods: * 3391 - PAYONE Secured Installment | [optional] |
| **requires_approval** | **Boolean** | * true &#x3D; the payment requires approval before the funds will be captured using the Approve payment or Capture payment API * false &#x3D; the payment does not require approval, and the funds will be captured automatically  If the parameter is not provided in the request, the default value will be true | [optional] |
| **payment_product3391_specific_input** | [**PaymentProduct3391SpecificInput**](PaymentProduct3391SpecificInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CompleteFinancingPaymentMethodSpecificInput.new(
  payment_product_id: 3391,
  requires_approval: null,
  payment_product3391_specific_input: null
)
```


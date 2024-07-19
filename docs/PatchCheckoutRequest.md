# PCPServerSDK::PatchCheckoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **references** | [**CheckoutReferences**](CheckoutReferences.md) |  | [optional] |
| **shipping** | [**Shipping**](Shipping.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartPatch**](ShoppingCartPatch.md) |  | [optional] |
| **payment_method_specific_input** | [**PaymentMethodSpecificInput**](PaymentMethodSpecificInput.md) |  | [optional] |
| **payment_references** | [**References**](References.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PatchCheckoutRequest.new(
  amount_of_money: null,
  references: null,
  shipping: null,
  shopping_cart: null,
  payment_method_specific_input: null,
  payment_references: null
)
```


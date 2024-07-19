# PCPServerSDK::PaymentExecutionSpecificInput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartInput**](ShoppingCartInput.md) |  | [optional] |
| **payment_references** | [**References**](References.md) |  |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentExecutionSpecificInput.new(
  amount_of_money: null,
  shopping_cart: null,
  payment_references: null
)
```


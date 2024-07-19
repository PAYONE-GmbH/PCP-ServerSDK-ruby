# PCPServerSDK::Order

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount_of_money** | [**AmountOfMoney**](AmountOfMoney.md) |  | [optional] |
| **customer** | [**Customer**](Customer.md) |  | [optional] |
| **references** | [**References**](References.md) |  |  |
| **shipping** | [**Shipping**](Shipping.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartInput**](ShoppingCartInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::Order.new(
  amount_of_money: null,
  customer: null,
  references: null,
  shipping: null,
  shopping_cart: null
)
```


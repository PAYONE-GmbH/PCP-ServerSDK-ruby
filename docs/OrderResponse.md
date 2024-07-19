# PCPServerSDK::OrderResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **create_payment_response** | [**CreatePaymentResponse**](CreatePaymentResponse.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::OrderResponse.new(
  create_payment_response: null,
  shopping_cart: null
)
```


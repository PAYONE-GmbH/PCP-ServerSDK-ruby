# PCPServerSDK::ReturnResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_payment_response** | [**RefundPaymentResponse**](RefundPaymentResponse.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ReturnResponse.new(
  return_payment_response: null,
  shopping_cart: null
)
```


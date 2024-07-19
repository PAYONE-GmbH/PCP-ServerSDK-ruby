# PCPServerSDK::CancelResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cancel_payment_response** | [**CancelPaymentResponse**](CancelPaymentResponse.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CancelResponse.new(
  cancel_payment_response: null,
  shopping_cart: null
)
```


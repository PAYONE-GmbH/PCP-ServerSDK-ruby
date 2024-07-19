# PCPServerSDK::DeliverResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **capture_payment_response** | [**CapturePaymentResponse**](CapturePaymentResponse.md) |  | [optional] |
| **shopping_cart** | [**ShoppingCartResult**](ShoppingCartResult.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::DeliverResponse.new(
  capture_payment_response: null,
  shopping_cart: null
)
```


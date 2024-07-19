# PCPServerSDK::OrderItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Id of the item from the ShoppingCart. The id will be returned in the response from create Checkout request. |  |
| **quantity** | **Integer** | Quantity of the specific item. Must be greater than zero.  Note: Must not be all spaces or all zeros  |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::OrderItem.new(
  id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  quantity: 1
)
```


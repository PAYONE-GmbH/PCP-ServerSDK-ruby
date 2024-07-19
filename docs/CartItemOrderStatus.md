# PCPServerSDK::CartItemOrderStatus

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cart_item_status** | [**CartItemStatus**](CartItemStatus.md) |  | [optional] |
| **quantity** | **Integer** | Amount of units for which this status is applicable, should be greater than zero | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CartItemOrderStatus.new(
  cart_item_status: null,
  quantity: 1
)
```


# PCPServerSDK::ReturnItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Id of the item to return. |  |
| **quantity** | **Integer** | Quantity of the units being returned, should be greater than zero Note: Must not be all spaces or all zeros |  |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ReturnItem.new(
  id: 4f0c512e-f12c-11ec-8ea0-0242ac120002,
  quantity: 1
)
```


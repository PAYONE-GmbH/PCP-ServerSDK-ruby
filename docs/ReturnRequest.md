# PCPServerSDK::ReturnRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_type** | [**ReturnType**](ReturnType.md) |  | [optional] |
| **return_reason** | **String** | Reason of the Refund (e.g. communicated by or to the consumer). | [optional] |
| **return_items** | [**Array&lt;ReturnItem&gt;**](ReturnItem.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ReturnRequest.new(
  return_type: null,
  return_reason: Customer complained,
  return_items: null
)
```


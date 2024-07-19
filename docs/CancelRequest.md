# PCPServerSDK::CancelRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cancel_type** | [**CancelType**](CancelType.md) |  | [optional] |
| **cancellation_reason** | [**CancellationReason**](CancellationReason.md) |  | [optional] |
| **cancel_items** | [**Array&lt;CancelItem&gt;**](CancelItem.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CancelRequest.new(
  cancel_type: null,
  cancellation_reason: null,
  cancel_items: null
)
```


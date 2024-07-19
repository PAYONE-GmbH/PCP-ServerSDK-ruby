# PCPServerSDK::DeliverRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deliver_type** | [**DeliverType**](DeliverType.md) |  | [optional] |
| **is_final** | **Boolean** | This property indicates whether this will be the final operation. For deliverType FULL, it is always the final operation. If deliverType PARTIAL is provided and the property is set to true, the remaining amount of the items will be cancelled and the items are marked as CANCELLED.  | [optional][default to false] |
| **cancellation_reason** | [**CancellationReason**](CancellationReason.md) |  | [optional] |
| **deliver_items** | [**Array&lt;DeliverItem&gt;**](DeliverItem.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::DeliverRequest.new(
  deliver_type: null,
  is_final: null,
  cancellation_reason: null,
  deliver_items: null
)
```


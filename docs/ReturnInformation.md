# PCPServerSDK::ReturnInformation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_reason** | **String** | Reason of the Refund (e.g. communicated by or to the consumer). | [optional] |
| **items** | [**Array&lt;CartItemInput&gt;**](CartItemInput.md) | Items returned. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ReturnInformation.new(
  return_reason: Customer complained,
  items: null
)
```


# PCPServerSDK::ErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_id** | **String** | Unique reference of this error response for debugging purposes | [optional] |
| **errors** | [**Array&lt;APIError&gt;**](APIError.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ErrorResponse.new(
  error_id: null,
  errors: null
)
```


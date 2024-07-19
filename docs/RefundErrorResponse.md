# PCPServerSDK::RefundErrorResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **error_id** | **String** | Unique reference, for debugging purposes, of this error response | [optional] |
| **errors** | [**Array&lt;APIError&gt;**](APIError.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RefundErrorResponse.new(
  error_id: null,
  errors: null
)
```


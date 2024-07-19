# PCPServerSDK::RedirectData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **redirect_url** | **String** | The URL that the customer should be redirected to. Be sure to redirect using the GET method | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::RedirectData.new(
  redirect_url: https://example-mandate-signing-url.com\
)
```


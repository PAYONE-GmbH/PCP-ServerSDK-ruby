# PCPServerSDK::CustomerDevice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ip_address** | **String** | The IP address of the customer client from the HTTP Headers. | [optional] |
| **device_token** | **String** | Tokenized representation of the end customers device. For example used for PAYONE Buy Now, Pay Later (BNPL). | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CustomerDevice.new(
  ip_address: null,
  device_token: null
)
```


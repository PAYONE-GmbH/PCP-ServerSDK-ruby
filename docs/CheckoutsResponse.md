# PCPServerSDK::CheckoutsResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number_of_checkouts** | **Integer** | Number of found Checkouts | [optional] |
| **checkouts** | [**Array&lt;CheckoutResponse&gt;**](CheckoutResponse.md) | List of Checkouts | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CheckoutsResponse.new(
  number_of_checkouts: 3390,
  checkouts: null
)
```


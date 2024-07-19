# PCPServerSDK::ContactDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email_address** | **String** | Email address of the customer | [optional] |
| **phone_number** | **String** | Phone number of the customer | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::ContactDetails.new(
  email_address: wile.e.coyote@acmelabs.com,
  phone_number: +1234567890
)
```


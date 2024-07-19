# PCPServerSDK::PaymentProduct840SpecificOutput

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_address** | [**Address**](Address.md) |  | [optional] |
| **customer_account** | [**PaymentProduct840CustomerAccount**](PaymentProduct840CustomerAccount.md) |  | [optional] |
| **shipping_address** | [**Address**](Address.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentProduct840SpecificOutput.new(
  billing_address: null,
  customer_account: null,
  shipping_address: null
)
```


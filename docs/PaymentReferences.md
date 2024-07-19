# PCPServerSDK::PaymentReferences

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **merchant_reference** | **String** | Unique reference of the Commerce Case that is also returned for reporting and reconciliation purposes. | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::PaymentReferences.new(
  merchant_reference: your-order-6372
)
```


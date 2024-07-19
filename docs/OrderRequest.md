# PCPServerSDK::OrderRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **order_type** | [**OrderType**](OrderType.md) |  | [optional] |
| **order_references** | [**References**](References.md) |  | [optional] |
| **items** | [**Array&lt;OrderItem&gt;**](OrderItem.md) |  | [optional] |
| **payment_method_specific_input** | [**PaymentMethodSpecificInput**](PaymentMethodSpecificInput.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::OrderRequest.new(
  order_type: null,
  order_references: null,
  items: null,
  payment_method_specific_input: null
)
```


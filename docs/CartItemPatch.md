# PCPServerSDK::CartItemPatch

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_data** | [**CartItemInvoiceData**](CartItemInvoiceData.md) |  | [optional] |
| **order_line_details** | [**OrderLineDetailsPatch**](OrderLineDetailsPatch.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CartItemPatch.new(
  invoice_data: null,
  order_line_details: null
)
```


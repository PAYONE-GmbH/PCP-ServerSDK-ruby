# PCPServerSDK::CartItemResult

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_data** | [**CartItemInvoiceData**](CartItemInvoiceData.md) |  | [optional] |
| **order_line_details** | [**OrderLineDetailsResult**](OrderLineDetailsResult.md) |  | [optional] |

## Example

```ruby
require 'PCP-server-Ruby-SDK'

instance = PCPServerSDK::CartItemResult.new(
  invoice_data: null,
  order_line_details: null
)
```

